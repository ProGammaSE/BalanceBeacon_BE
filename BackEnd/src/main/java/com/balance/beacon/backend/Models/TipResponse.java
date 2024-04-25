package com.balance.beacon.backend.Models;

import java.util.List;

public class TipResponse {
    private int responseStatus;
    private String responseDescription;
    private int userId;
    private int assessmentId;
    private List<Tips> tips;

    public int getResponseStatus() {
        return responseStatus;
    }

    public void setResponseStatus(int responseStatus) {
        this.responseStatus = responseStatus;
    }

    public String getResponseDescription() {
        return responseDescription;
    }

    public void setResponseDescription(String responseDescription) {
        this.responseDescription = responseDescription;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(int assessmentId) {
        this.assessmentId = assessmentId;
    }

    public List<Tips> getTips() {
        return tips;
    }

    public void setTips(List<Tips> tips) {
        this.tips = tips;
    }
}
