package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Coaches;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Services.CoachService;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CoachController {

    private final CoachService coachService;

    public CoachController(CoachService coachService) {
        this.coachService = coachService;
    }

    @PostMapping(value = "/coach/add")
    public GeneralResponse addCoaches(@RequestBody Coaches coaches) {
        return coachService.addCoaches(coaches);
    }

    @GetMapping(value = "/coach/get/all")
    public List<Coaches> getAllCoaches() {
        return coachService.getAllCoaches();
    }
}
