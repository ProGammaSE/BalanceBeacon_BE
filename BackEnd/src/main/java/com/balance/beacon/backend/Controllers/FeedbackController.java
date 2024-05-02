package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Feedback;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Services.FeedbackService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FeedbackController {

    private final FeedbackService feedbackService;

    public FeedbackController(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @PostMapping(value = "/feedback/add")
    public GeneralResponse addFeedback(@RequestBody Feedback feedback) {
        return feedbackService.addFeedback(feedback);
    }
}
