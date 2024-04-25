package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.TipResponse;
import com.balance.beacon.backend.Models.UserTips;
import com.balance.beacon.backend.Services.UserTipService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserTipsController {

    private final UserTipService userTipService;

    public UserTipsController(UserTipService userTipService) {
        this.userTipService = userTipService;
    }

    @GetMapping(value = "/user/tips/{userId}/{assessmentId}/{status}")
    private List<UserTips> getAllUserTips(@PathVariable int userId, @PathVariable int assessmentId, @PathVariable int status) {
        return userTipService.getAllUserTips(userId, assessmentId, status);
    }
}
