package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.*;
import com.balance.beacon.backend.Repositories.AreaRepository;
import com.balance.beacon.backend.Repositories.AssessAreaRepository;
import com.balance.beacon.backend.Repositories.UserRepository;
import org.hibernate.mapping.Collection;
import org.springframework.stereotype.Service;

import java.awt.geom.Area;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class AssessAreaService {

    GeneralResponse generalResponse = new GeneralResponse();
    private final UserRepository userRepository;
    private final AssessAreaRepository assessAreaRepository;
    private final AreaRepository areaRepository;

    public AssessAreaService(UserRepository userRepository, AssessAreaRepository assessAreaRepository, AreaRepository areaRepository) {
        this.userRepository = userRepository;
        this.assessAreaRepository = assessAreaRepository;
        this.areaRepository = areaRepository;
    }

    public GeneralResponse addUserAreas(AssessAreaRequest assessAreaRequest) {
        System.out.println("----- addUserAreas is starting -----");
        // check whether the user is available in the database
        try {
            if (assessAreaRequest != null) {
                Users databaseUser = userRepository.findByUserId(assessAreaRequest.getUserId());
                if (databaseUser != null) {
                    System.out.println("User found in the database");

                    // get the highest value of the assessment id
                    AssessmentAreas assessmentAreas = assessAreaRepository.findTopByOrderByAssessmentIdDesc();
                    int currentMaxAssessId = assessmentAreas.getAssessmentId();
                    System.out.println("currentMaxAssessId: " + currentMaxAssessId);
                    System.out.println("Therefore adding the assessment data as Assessment ID: " + (currentMaxAssessId+1));
                    System.out.println("Number of areas chosen: " + assessAreaRequest.getUserChosenAreas().size());


                    for (int i=0 ; i<assessAreaRequest.getUserChosenAreas().size() ; i++) {
                        AssessmentAreas assessment = new AssessmentAreas();
                        assessment.setUserId(assessAreaRequest.getUserId());
                        assessment.setAssessmentId((currentMaxAssessId+1));
                        assessment.setAreaId(assessAreaRequest.getUserChosenAreas().get(i).getAreaId());
                        assessment.setAreaStatus(true);
                        assessment.setAssessAreaCreatedDate(new Timestamp(System.currentTimeMillis()));
                        assessAreaRepository.save(assessment);
                    }
                    System.out.println("All areas added to the user successfully");
                    generalResponse.setResponseCode(200);
                    generalResponse.setResponseDescription("Areas added successfully");
                }
                else {
                    System.out.println("User not found in the database");
                    generalResponse.setResponseCode(400);
                    generalResponse.setResponseDescription("User not found");
                }
            }
            else {
                System.out.println("Area details cannot be empty!");
                generalResponse.setResponseCode(400);
                generalResponse.setResponseDescription("Please select areas");
            }
        } catch (Exception ex) {
            System.out.println("Failed to retrieve data");
            generalResponse.setResponseCode(400);
            generalResponse.setResponseDescription("Failed to add data!");
            System.out.println(ex.getCause());
            ex.printStackTrace();
        }
        return generalResponse;
    }

    /**
     * function to get all the areas that added user the particular user
     * there might have several assessments, if then only get latest assessment
     */
    public UserAssessResponse getAllUserAreas(int userId) {
        System.out.println("----- getAllUserAreas function is starting -----");
        List<AssessmentAreas> userAssessmentAreas = new ArrayList<>();
        List<AssessmentPayload> assessmentPayload = new ArrayList<>();
        List<AssessmentAreas> assessmentAreas = null;
        UserAssessResponse userAssessResponse = new UserAssessResponse();

        try {
            // get assessments of the given user
            // Spring boot query always return values in Ascending order
            // so, we get the last assessment id in the list
            System.out.println("Checking whether any areas available for the user");
            assessmentAreas = assessAreaRepository.findAllByUserId(userId);


            if (assessmentAreas != null) {
                System.out.println("" + assessmentAreas.size() + " areas available for the user ID: " + userId);
                int maxAssessmentId = assessmentAreas.get(assessmentAreas.size()-1).getAssessmentId();

                // filter out latest user assessment areas to an array
                for (int i=0 ; i<assessmentAreas.size() ; i++) {
                    if (assessmentAreas.get(i).getAssessmentId() == maxAssessmentId) {
                        userAssessmentAreas.add(assessmentAreas.get(i));
                    }
                }

                // collect areas from the database by filtered out assessment data
                for (int j=0 ; j<userAssessmentAreas.size() ; j++) {
                    AssessmentPayload payload = new AssessmentPayload();
                    Areas dbArea = areaRepository.findByAreaId(userAssessmentAreas.get(j).getAreaId());
                    payload.setAreaId(dbArea.getAreaId());
                    payload.setAreaDescription(dbArea.getAreaDescription());
                    payload.setAreaPercentage(userAssessmentAreas.get(j).getAssessAreaPercentage());
                    payload.setAreaStatus(userAssessmentAreas.get(j).isAreaStatus());
                    assessmentPayload.add(payload);
                }

                // binding all the data into the response object
                userAssessResponse.setResponseCode(200);
                userAssessResponse.setResponseDescription("Areas loaded successfully");
                userAssessResponse.setUserId(userId);
                userAssessResponse.setAssessmentId(maxAssessmentId);
                userAssessResponse.setAssessmentPayloads(assessmentPayload);
            }
            else {
                userAssessResponse.setResponseCode(400);
                userAssessResponse.setResponseDescription("Areas loading failed");
                userAssessResponse.setUserId(userId);
                userAssessResponse.setAssessmentPayloads(assessmentPayload);
            }

        } catch (Exception e) {
            System.out.println("Request failed: " + e.getMessage());
            System.out.println(e.getCause());
            userAssessResponse.setResponseCode(400);
            userAssessResponse.setResponseDescription("Request failed");
            userAssessResponse.setUserId(userId);
            userAssessResponse.setAssessmentPayloads(assessmentPayload);
            e.printStackTrace();
        }

        return userAssessResponse;
    }
}
