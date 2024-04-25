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
    private final TipService tipService;
    private final UserTipService userTipService;
    private final UserService userService;
    List<AssessmentAreas> userAssessmentAreas = new ArrayList<>();

    public AssessAreaService(UserRepository userRepository, AssessAreaRepository assessAreaRepository, AreaRepository areaRepository, TipService tipService, UserTipService userTipService, UserService userService) {
        this.userRepository = userRepository;
        this.assessAreaRepository = assessAreaRepository;
        this.areaRepository = areaRepository;
        this.tipService = tipService;
        this.userTipService = userTipService;
        this.userService = userService;
    }

    /**
     * function to add user selected areas into the database
     */
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

                    System.out.println("Calling the getAllTips function to retrieve all tips belongs to the selected areas");
                    TipResponse tipResponse = tipService.getAllTips(assessAreaRequest.getUserId(), assessAreaRequest.getUserChosenAreas(), currentMaxAssessId+1);

                    if (tipResponse.getResponseStatus() == 200) {
                        System.out.println("Calling addUserTips function to add retrieve tips to the user-tips table");
                        generalResponse = userTipService.addUserTips(tipResponse, 0);
                    }
                    else {
                        generalResponse.setResponseCode(400);
                        generalResponse.setResponseDescription("getAllTips function failed");
                    }

                    System.out.println("Updating the user status");
                    userService.updateUserStatus(assessAreaRequest.getUserId(), 2);
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
        List<AssessmentPayload> assessmentPayload = new ArrayList<>();
        List<AssessmentAreas> assessmentAreas = null;
        UserAssessResponse userAssessResponse = new UserAssessResponse();
        userAssessmentAreas.clear();

        try {
            // get the latest assessment of the given user
            // Spring boot query always return values in Ascending order
            // so, this function gets the last assessment id in the list (latest)
            System.out.println("Checking whether any assessments available for the user");
            assessmentAreas = assessAreaRepository.findAllByUserId(userId);

            if (assessmentAreas != null) {
                System.out.println("Total areas: " + assessmentAreas.size() + " available for the user: " + userId);
                int maxAssessmentId = assessmentAreas.get(assessmentAreas.size()-1).getAssessmentId();
                System.out.println("maxAssessmentId: " + maxAssessmentId);

                // filter out latest user assessment areas to an array
                for (int i=0 ; i<assessmentAreas.size() ; i++) {
                    if (assessmentAreas.get(i).getAssessmentId() == maxAssessmentId) {
                        userAssessmentAreas.add(assessmentAreas.get(i));
                    }
                }

                System.out.println("Total selected areas: " + userAssessmentAreas.size() + " available for the user: " + userId);

                // collect areas from the database by filtered out assessment data
                for (int j=0 ; j<userAssessmentAreas.size() ; j++) {
                    AssessmentPayload payload = new AssessmentPayload();
                    Areas dbArea = areaRepository.findByAreaId(userAssessmentAreas.get(j).getAreaId());
                    payload.setAreaId(dbArea.getAreaId());
                    payload.setAreaDescription(dbArea.getAreaDescription());
                    payload.setAreaCurrent(userAssessmentAreas.get(j).getAssessAreaCurrent());
                    payload.setAreaFuture(userAssessmentAreas.get(j).getAssessAreaFuture());
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


    public GeneralResponse updateUserAreas(UserAssessResponse userAssessResponse) {
        System.out.println("----- updateUserAreas function is starting -----");
        List<AssessmentPayload> payloadsFromFrontEnd = new ArrayList<>();

        if (userAssessmentAreas.size() != 0) {
            try {
                // get payload data from which is coming from the front end and
                // set it to the payloadsFromFrontEnd object
                payloadsFromFrontEnd = userAssessResponse.getAssessmentPayloads();

                for (int i = 0; i < payloadsFromFrontEnd.size(); i++) {

                    // bind data into the updateArea object
                    AssessmentAreas updateArea = getAssessmentAreas(i, payloadsFromFrontEnd);

                    System.out.println("userAssessmentAreas.get(i).getAssessmentId(): " + userAssessmentAreas.get(i).getAssessAreaId());
                    System.out.println("----------");

                    // send object to the database
                    // details will be updated since object already existing in the database (override new values)
                    assessAreaRepository.save(updateArea);
                }

                System.out.println("" + payloadsFromFrontEnd.size() + " areas updated successfully");

                generalResponse.setResponseCode(200);
                generalResponse.setResponseDescription("Areas updated successfully");
            } catch (Exception ex) {
                System.out.println("Failed to update user areas");
                System.out.println(ex.getCause());
                ex.printStackTrace();
                generalResponse.setResponseCode(400);
                generalResponse.setResponseDescription("Cannot update at the moment");
            }
        }
        else {
            System.out.println("User areas not retrieved yet!");
            generalResponse.setResponseCode(400);
            generalResponse.setResponseDescription("User areas not retrieved yet!");
        }
        return generalResponse;
    }

    /**
     * function to update the Current and the Future values in the user areas
     */
    private AssessmentAreas getAssessmentAreas(int i, List<AssessmentPayload> payloadsFromFrontEnd) {
        AssessmentAreas updateArea = new AssessmentAreas();
        updateArea.setAssessAreaId(userAssessmentAreas.get(i).getAssessAreaId());
        updateArea.setUserId(userAssessmentAreas.get(i).getUserId());
        updateArea.setAreaId(userAssessmentAreas.get(i).getAreaId());
        updateArea.setAssessmentId(userAssessmentAreas.get(i).getAssessmentId());
        updateArea.setAssessAreaCurrent(payloadsFromFrontEnd.get(i).getAreaCurrent());
        updateArea.setAssessAreaFuture(payloadsFromFrontEnd.get(i).getAreaFuture());
        updateArea.setAreaStatus(userAssessmentAreas.get(i).isAreaStatus());
        updateArea.setAssessAreaCreatedDate(userAssessmentAreas.get(i).getAssessAreaCreatedDate());
        return updateArea;
    }
}
