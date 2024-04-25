package com.balance.beacon.backend.Models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user_tips")
public class UserTips {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_tip_id")
    private int userTipId;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "assessment_id")
    private int assessmentId;

    @Column(name = "area_id")
    private int areaId;

    @Column(name = "tip_id")
    private int tipId;

    @Column(name = "tip_description")
    private String tipDescription;

    @Column(name = "tip_status")
    private int tipStatus;

    @Column(name = "created_date")
    private Date createdDate;

    public int getUserTipId() {
        return userTipId;
    }

    public void setUserTipId(int userTipId) {
        this.userTipId = userTipId;
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

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getTipId() {
        return tipId;
    }

    public void setTipId(int tipId) {
        this.tipId = tipId;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
