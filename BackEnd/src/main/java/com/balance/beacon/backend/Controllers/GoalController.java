package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Goals;
import com.balance.beacon.backend.Services.GoalService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GoalController {

    private final GoalService goalService;

    public GoalController(GoalService goalService) {
        this.goalService = goalService;
    }

    @GetMapping(value = "/goals/get/all/{userId}")
    public List<Goals> getAllGoals(@PathVariable int userId) {
        return goalService.getAllGoals(userId);
    }
}
