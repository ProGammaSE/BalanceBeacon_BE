package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Models.TipResponse;
import com.balance.beacon.backend.Models.UpdateUserTips;
import com.balance.beacon.backend.Models.UserTips;
import com.balance.beacon.backend.Services.UserTipService;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping(value = "/user/tips/update")
    public GeneralResponse updateUserTips(@RequestBody UpdateUserTips updateUserTips) {
        return userTipService.updateUserTips(updateUserTips);
    }
}
