package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.*;
import com.balance.beacon.backend.Repositories.UserTipRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserTipService {

    private final UserTipRepository userTipRepository;
    private final GoalService goalService;

    public UserTipService(UserTipRepository userTipRepository, GoalService goalService) {
        this.userTipRepository = userTipRepository;
        this.goalService = goalService;
    }

    /**
     * function add an entry to user_tips table in the database
     * status: 0 = tip is active
     * status: 1 = a goal is set
     * status: 2 = completed
     * status: 3 = tip is inactive
     */
    public GeneralResponse addUserTips(TipResponse tipResponse, int status) {
        System.out.println("----- addUserTips function is starting -----");
        GeneralResponse generalResponse = new GeneralResponse();

        try {
            if (tipResponse.getResponseStatus() != 400) {
                for (int i=0 ; i<tipResponse.getTips().size(); i++) {
                    UserTips userTips = new UserTips();

                    // binding details to the object and saving to the database
                    userTips.setUserId(tipResponse.getUserId());
                    userTips.setAssessmentId(tipResponse.getAssessmentId());
                    userTips.setAreaId(tipResponse.getTips().get(i).getAreaId());
                    userTips.setTipId(tipResponse.getTips().get(i).getTipId());
                    userTips.setTipDescription(tipResponse.getTips().get(i).getTipDescription());
                    userTips.setTipStatus(status);
                    userTips.setCreatedDate(new Timestamp(System.currentTimeMillis()));
                    UserTips dbUserTips = userTipRepository.save(userTips);
                }
                System.out.println("User tips updated successfully");
                generalResponse.setResponseCode(200);
                generalResponse.setResponseDescription("User tips updated successfully");
            }
        } catch (Exception e) {
            System.out.println("User tips updating failed!");
            generalResponse.setResponseCode(400);
            generalResponse.setResponseDescription("User tips updating failed!");
            e.printStackTrace();
        }

        return generalResponse;
    }

    /**
     * function to retrieve all the user tips available for the particular user
     * status: 0 = tip is active
     * status: 1 = a goal is set
     * status: 2 = completed
     * status: 3 = tip is inactive
     */
    public List<UserTips> getAllUserTips(int userId, int assessmentId, int status) {
        System.out.println("----- getAllUserTips function is starting -----");
        List<UserTips> userTips = new ArrayList<>();

        try {
            userTips = userTipRepository.findByUserIdAndAssessmentIdAndTipStatus(userId, assessmentId, status);
            System.out.println("User tips retrieved successfully for User ID: " + userId);
            System.out.println("Assessment ID: " + assessmentId);
            System.out.println("Status ID: " + status);
        } catch (Exception ex) {
            System.out.println("User tips retrieving failed!");
        }

        return userTips;
    }

    /**
     * function to update user tips. below are the updating scenarios
     * status: 0 = tip is active
     * status: 1 = a goal is set
     * status: 2 = completed
     * status: 3 = tip is inactive
     */
    public GeneralResponse updateUserTips(UpdateUserTips updateUserTips) {
        System.out.println("----- updateUserTips function is starting -----");
        GeneralResponse generalResponse = new GeneralResponse();

        if (updateUserTips != null) {
            try {
                System.out.println("Tip loaded for updating the status");
                UserTips dbUserTips = userTipRepository.findByUserTipId(updateUserTips.getUserTipId());

                dbUserTips.setTipStatus(updateUserTips.getTipStatus());
                userTipRepository.save(dbUserTips);
                System.out.println("Tip updated successfully");

                generalResponse.setResponseCode(200);
                generalResponse.setResponseDescription("Tip updated successfully");

                // adding a new goal to the goals table
                System.out.println("Starting to add the goal details to the database");
                goalService.addNewGoal(updateUserTips);

            } catch (Exception ex) {
                ex.printStackTrace();
                System.out.println("Tip updating failed");
                generalResponse.setResponseCode(400);
                generalResponse.setResponseDescription("Tip updating failed");
            }
        }
        else {
            System.out.println("Update data not received to the backend");
            generalResponse.setResponseCode(200);
            generalResponse.setResponseDescription("No update data provided");
        }
        return generalResponse;
    }
}
