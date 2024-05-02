package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.Feedback;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Repositories.FeedbackRepository;
import org.springframework.stereotype.Service;

import java.security.Provider;

@Service
public class FeedbackService {

    private final FeedbackRepository feedbackRepository;

    public FeedbackService(FeedbackRepository feedbackRepository) {
        this.feedbackRepository = feedbackRepository;
    }

    public GeneralResponse addFeedback(Feedback feedback) {
        System.out.println("----- addFeedback function is starting -----");
        GeneralResponse response = new GeneralResponse();

        if (feedback != null) {
            try {
                feedbackRepository.save(feedback);
                System.out.println("Successfully added feedback");
                response.setResponseCode(200);
                response.setResponseDescription("Successfully added feedback");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error adding feedback");
                response.setResponseCode(400);
                response.setResponseDescription("Error adding feedback");
            }
        }
        else {
            System.out.println("Feedback is null");
            response.setResponseCode(400);
            response.setResponseDescription("Feedback is null");
        }
        return response;
    }
}
