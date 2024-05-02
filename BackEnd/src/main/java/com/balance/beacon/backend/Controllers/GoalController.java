package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Goals;
import com.balance.beacon.backend.Services.GoalService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GoalController {

    private final GoalService goalService;

    public GoalController(GoalService goalService) {
        this.goalService = goalService;
    }

    @GetMapping(value = "/goals/get/all")
    public List<Goals> getAllGoals() {
        return goalService.getAllGoals();
    }
}
