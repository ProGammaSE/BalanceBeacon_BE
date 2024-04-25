package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.*;
import com.balance.beacon.backend.Repositories.TipRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
public class TipService {

    private final TipRepository tipRepository;
    GeneralResponse response = new GeneralResponse();

    public TipService(TipRepository tipRepository) {
        this.tipRepository = tipRepository;
    }

    /**
     * function add new tips to the database
     */
    public GeneralResponse addTips(Tips tips) {
        System.out.println("----- addTips function is calling -----");
        try {
            if (tips.getAreaId() != 0 && tips.getTipDescription() != "") {
                tips.setTipCreatedDate(new Timestamp(System.currentTimeMillis()));
                tipRepository.save(tips);
                System.out.println("Tip added successfully to the area: " + tips.getAreaId());
                response.setResponseCode(200);
                response.setResponseDescription("Tip added successfully");
            }
            else {
                response.setResponseCode(400);
                response.setResponseDescription("Tip details cannot be empty");
            }
        } catch (Exception e) {
            response.setResponseCode(400);
            response.setResponseDescription("Tip details adding failed!");
        }
        return response;
    }

    /**
     * function to get all the tips which have in the areas that belongs to the User
     */
    public TipResponse getAllTips(int userId, ArrayList<Areas> areas, int assessmentId) {
        System.out.println("----- getAllTips function is calling -----");
        TipResponse tipResponse = new TipResponse();
        ArrayList<Integer> areaIdArray = new ArrayList<>();
        List<Tips> allTips = new ArrayList<>();

        // get all the areas (area Ids) of the given user
//        userAssessResponse = assessAreaService.getAllUserAreas(userId);

        // store area IDs to an array
        if (areas != null) {
            for(int i=0 ; i<areas.size() ; i++) {
                areaIdArray.add(areas.get(i).getAreaId());
            }

            // get tips available for each area ID
            if (areaIdArray.size() > 0) {
                for(int j=0 ; j<areaIdArray.size() ; j++) {
                    List<Tips> dbtTips = tipRepository.findByAreaId(areaIdArray.get(j));
                    allTips.addAll(dbtTips);
                }
                System.out.println("All the tips loaded");
                tipResponse.setResponseStatus(200);
                tipResponse.setResponseDescription("All the tips loaded");
                tipResponse.setUserId(userId);
                tipResponse.setAssessmentId(assessmentId);
                tipResponse.setTips(allTips);
                System.out.println(allTips);
            }
            else {
                System.out.println("User does not have any areas");
                tipResponse.setResponseStatus(400);
                tipResponse.setResponseDescription("User does not have any areas");
                tipResponse.setTips(allTips);
            }
        }
        else {
            System.out.println("Tip loading failed!");
            tipResponse.setResponseStatus(400);
            tipResponse.setResponseDescription("Tip loading failed!");
            tipResponse.setTips(allTips);
        }

        return tipResponse;
    }
}
