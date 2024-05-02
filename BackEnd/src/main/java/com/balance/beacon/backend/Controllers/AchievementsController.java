package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Achievements;
import com.balance.beacon.backend.Services.AchievementsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AchievementsController {

    private final AchievementsService achievementsService;

    public AchievementsController(AchievementsService achievementsService) {
        this.achievementsService = achievementsService;
    }

    @GetMapping(value = "/achievements/get/all/{userId}")
    public Achievements getAchievements(@PathVariable int userId) {
        return achievementsService.getAchievements(userId);
    }
}
