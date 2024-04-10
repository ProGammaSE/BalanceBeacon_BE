package com.balance.beacon.backend.Models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "assessment_areas")
public class AssessmentAreas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "assess_area_id")
    int assessAreaId;

    @Column(name = "user_id")
    int userId;

    @Column(name = "area_id")
    int areaId;

    @Column(name = "assessment_id")
    int assessmentId;

    @Column(name = "assess_area_percentage")
    int assessAreaPercentage;

    @Column(name = "area_status")
    boolean areaStatus;

    @Column(name = "assess_area_created_date")
    Date assessAreaCreatedDate;

    public int getAssessAreaId() {
        return assessAreaId;
    }

    public void setAssessAreaId(int assessAreaId) {
        this.assessAreaId = assessAreaId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(int assessmentId) {
        this.assessmentId = assessmentId;
    }

    public int getAssessAreaPercentage() {
        return assessAreaPercentage;
    }

    public void setAssessAreaPercentage(int assessAreaPercentage) {
        this.assessAreaPercentage = assessAreaPercentage;
    }

    public boolean isAreaStatus() {
        return areaStatus;
    }

    public void setAreaStatus(boolean areaStatus) {
        this.areaStatus = areaStatus;
    }

    public Date getAssessAreaCreatedDate() {
        return assessAreaCreatedDate;
    }

    public void setAssessAreaCreatedDate(Date assessAreaCreatedDate) {
        this.assessAreaCreatedDate = assessAreaCreatedDate;
    }
}
