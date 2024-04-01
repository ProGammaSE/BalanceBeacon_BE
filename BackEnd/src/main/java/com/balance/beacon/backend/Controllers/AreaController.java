package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Areas;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Services.AreaService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AreaController {

    private AreaService areaService;

    // constructor
    public AreaController(AreaService areaService) {
        this.areaService = areaService;
    }

    /**
     * function to insert new areas into the database
     */
    @PostMapping(value = "/area/create")
     private GeneralResponse createArea(@RequestBody Areas area) {
        return areaService.createArea(area);
    }

    /**
     * function to get all areas in the database
     */
    @GetMapping(value = "/area/all")
    private List<Areas>getAllAreas() {
        return areaService.getAllAreas();
    }

    /**
     * function to delete area from the database by passing the Area ID
     */
    @DeleteMapping(value = "/area/delete/{areaId}")
    private GeneralResponse deleteArea(@PathVariable int areaId) {
        return areaService.deleteArea(areaId);
    }
}
