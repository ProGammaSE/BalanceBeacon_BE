package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Models.Goals;
import com.balance.beacon.backend.Models.UpdateUserTips;
import com.balance.beacon.backend.Repositories.GoalRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoalService {

    private final GoalRepository goalRepository;

    public GoalService(GoalRepository goalRepository) {
        this.goalRepository = goalRepository;
    }

    /**
     * function to add a new goal to the goal table in the database
     */
    public GeneralResponse addNewGoal(UpdateUserTips updateUserTips) {
        System.out.println("----- addNewGoal function is calling -----");
        GeneralResponse response = new GeneralResponse();
        Goals goals = new Goals();

        if (updateUserTips != null) {
            try {
                // checking whether the goal is already set in the database
                System.out.println("Checking whether the goal is already set");
                Goals dbGoals = null;
                dbGoals = goalRepository.findByUserTipId(updateUserTips.getUserTipId());

                if (dbGoals == null) {
                    System.out.println("Goal is not set, therefore adding a new one");
                    goals.setUserId(updateUserTips.getUserId());
                    goals.setGoalDays(updateUserTips.getGoalDays());
                    goals.setUserTipId(updateUserTips.getUserTipId());
                    goals.setAreaDescription(updateUserTips.getAreaDescription());
                    goals.setTipDescription(updateUserTips.getTipDescription());
                    goals.setTipStatus(updateUserTips.getTipStatus());
                    goalRepository.save(goals);
                }
                else {
                    System.out.println("Goal already exists, therefore updating the existing one");
                    dbGoals.setGoalDays(updateUserTips.getGoalDays());
                    dbGoals.setTipStatus(updateUserTips.getTipStatus());
                    goalRepository.save(dbGoals);
                }
                System.out.println("Goal added successfully");
                response.setResponseCode(200);
                response.setResponseDescription("Goal added successfully");
            }
            catch (Exception e) {
                System.out.println("Goal adding failed!");
                response.setResponseCode(400);
                response.setResponseDescription("Goal adding failed!");
                e.printStackTrace();
            }
        }
        else {
            response.setResponseCode(400);
            response.setResponseDescription("Goal days cannot be empty");
        }
        return response;
    }

    /**
     * get all user goals
     */
    public List<Goals> getAllGoals(int userId) {
        System.out.println("----- getAllGoals function is calling -----");
        List<Goals> goals = new ArrayList<Goals>();
        try {
            goals = goalRepository.findAllByUserId(userId);
            System.out.println("Goal list returned successfully");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("GOAL LIST NOT FOUND");
        }
        return goals;
    }
}
