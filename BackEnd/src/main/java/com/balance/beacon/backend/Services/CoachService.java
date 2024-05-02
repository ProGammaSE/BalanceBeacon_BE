package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.Coaches;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Repositories.CoachRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachService {

    private final CoachRepository coachRepository;

    public CoachService(CoachRepository coachRepository) {
        this.coachRepository = coachRepository;
    }

    /**
     * function to add new coaches to the database
     */
    public GeneralResponse addCoaches(Coaches coaches) {
        System.out.println("----- addCoaches function is starting -----");
        GeneralResponse response = new GeneralResponse();

        if (coaches != null) {
            try {
                coachRepository.save(coaches);
                System.out.println("Coaches added successfully");
                response.setResponseCode(200);
                response.setResponseDescription("Coaches added successfully");
            } catch (Exception ex) {
                ex.printStackTrace();
                System.out.println("Coaches could not be added");
                response.setResponseCode(400);
                response.setResponseDescription("Coaches could not be added");
            }
        }
        return response;
    }

    public List<Coaches> getAllCoaches() {
        System.out.println("----- addCoaches function is starting -----");
        System.out.println("Coaches retrieved successfully");
        return coachRepository.findAll();
    }

}
