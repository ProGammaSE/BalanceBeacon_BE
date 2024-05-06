package com.balance.beacon.backend.Models;

import javax.persistence.*;

@Entity
@Table(name = "goals")
public class Goals {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "goal_id")
    private int goalId;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "user_tip_id")
    private int userTipId;

    @Column(name = "area_description")
    private String areaDescription;

    @Column(name = "tip_description")
    private String tipDescription;

    @Column(name = "tip_status")
    private int tipStatus;

    @Column(name = "goal_days")
    private String goalDays;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoalId() {
        return goalId;
    }

    public void setGoalId(int goalId) {
        this.goalId = goalId;
    }

    public int getUserTipId() {
        return userTipId;
    }

    public void setUserTipId(int userTipId) {
        this.userTipId = userTipId;
    }

    public String getAreaDescription() {
        return areaDescription;
    }

    public void setAreaDescription(String areaDescription) {
        this.areaDescription = areaDescription;
    }

    public String getTipDescription() {
        return tipDescription;
    }

    public void setTipDescription(String tipDescription) {
        this.tipDescription = tipDescription;
    }

    public int getTipStatus() {
        return tipStatus;
    }

    public void setTipStatus(int tipStatus) {
        this.tipStatus = tipStatus;
    }

    public String getGoalDays() {
        return goalDays;
    }

    public void setGoalDays(String goalDays) {
        this.goalDays = goalDays;
    }
}
