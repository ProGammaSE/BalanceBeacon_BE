package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.Achievements;
import com.balance.beacon.backend.Models.AssessmentAreas;
import com.balance.beacon.backend.Models.Goals;
import com.balance.beacon.backend.Models.UserAssessResponse;
import com.balance.beacon.backend.Repositories.AssessAreaRepository;
import com.balance.beacon.backend.Repositories.GoalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AchievementsService {

    @Autowired
    AssessAreaRepository assessAreaRepository;

//    @Autowired
//    GoalRepository goalRepository;
    @Autowired
    private AssessAreaService assessAreaService;
    @Autowired
    private GoalService goalService;

    public Achievements getAchievements(int userId) {
        System.out.println("----- getAchievements function is calling -----");
        Achievements achievements = new Achievements();
        List<AssessmentAreas> assessmentAreas = new ArrayList<>();
        List<Goals> goals = new ArrayList<>();
        int goalCompletionCount = 0;

        try {
            // getting number of achievements that user has findTopByOrderByAssessmentIdDesc findByUserIdAndAssessmentIdAndTipStatus
            UserAssessResponse userAssessResponse = new UserAssessResponse();
//            userAssessResponse = assessAreaService.getAllUserAreas(userId);
            assessmentAreas = assessAreaRepository.findAllByUserId(userId);

            // get assessmentCount for the user
            if (assessmentAreas.size() > 0) {
                achievements.setAssessmentCount(assessmentAreas.size());
            }
            System.out.println("Assessment count received: " + assessmentAreas.size());

            // check created goal count
            goals = goalService.getAllGoals(userId);
//            goals = goalRepository.findAll();

            if (goals.size() > 0) {
                achievements.setGoalCount(goals.size());
            }
            System.out.println("Goal count received: " + goals.size());

            // check completed goal count
            for (int i = 0; i < goals.size(); i++) {
                if (goals.get(i).getTipStatus() == 2) {
                    goalCompletionCount++;
                }
            }
            achievements.setGoalCompletionCount(goalCompletionCount);
            System.out.println("Goal Completion count received: " + goalCompletionCount);
        } catch (Exception e) {
            System.out.println("Achievements service call failed");
            e.printStackTrace();
        }
        return achievements;
    }
}
