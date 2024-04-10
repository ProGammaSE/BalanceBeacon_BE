package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.*;
import com.balance.beacon.backend.Services.AssessAreaService;
import org.springframework.web.bind.annotation.*;

@RestController
public class AssessAreaController {

    private AssessAreaService assessAreaService;

    public AssessAreaController(AssessAreaService assessAreaService) {
        this.assessAreaService = assessAreaService;
    }

    @PostMapping(value = "/assess/area/request")
    public GeneralResponse addUserAreas(@RequestBody AssessAreaRequest assessAreaRequest) {
        return assessAreaService.addUserAreas(assessAreaRequest);
    }

    @GetMapping(value = "/assess/user/areas/all/{userId}")
    public UserAssessResponse getAllUserAreas(@PathVariable int userId) {
        return assessAreaService.getAllUserAreas(userId);
    }
}
