package com.balance.beacon.backend.Models;

import java.util.List;

public class GoalPayload {
    int statusCode;
    String statusDescription;
    List<UserTips> activeGoals;
    List<UserTips> completedGoals;

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getStatusDescription() {
        return statusDescription;
    }

    public void setStatusDescription(String statusDescription) {
        this.statusDescription = statusDescription;
    }

    public List<UserTips> getActiveGoals() {
        return activeGoals;
    }

    public void setActiveGoals(List<UserTips> activeGoals) {
        this.activeGoals = activeGoals;
    }

    public List<UserTips> getCompletedGoals() {
        return completedGoals;
    }

    public void setCompletedGoals(List<UserTips> completedGoals) {
        this.completedGoals = completedGoals;
    }
}
