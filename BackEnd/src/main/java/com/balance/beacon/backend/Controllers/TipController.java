package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Models.TipResponse;
import com.balance.beacon.backend.Models.Tips;
import com.balance.beacon.backend.Services.TipService;
import com.balance.beacon.backend.Services.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
public class TipController {

    private final TipService tipService;

    public TipController(TipService tipService) {
        this.tipService = tipService;
    }

    @PostMapping(value = "/tips/add")
    private GeneralResponse addTips(@RequestBody Tips tips) {
        return tipService.addTips(tips);
    }

//    @GetMapping(value = "/tips/get/all/{userId}")
//    private TipResponse getAllTips(@PathVariable int userId) {
//        return tipService.getAllTips(userId);
//    }
}
