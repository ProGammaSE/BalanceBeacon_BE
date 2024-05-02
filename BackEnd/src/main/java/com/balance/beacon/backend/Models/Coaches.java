package com.balance.beacon.backend.Models;

import javax.persistence.*;

@Entity
@Table(name = "coachers")
public class Coaches {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "coach_id")
    private int coachId;

    @Column(name = "coach_name")
    private String coachName;

    @Column(name = "coach_gender")
    private String coachGender;

    @Column(name = "coach_speciality")
    private String coachSpeciality;

    @Column(name = "phone_number")
    private String phoneNumber;

    public int getCoachId() {
        return coachId;
    }

    public void setCoachId(int coachId) {
        this.coachId = coachId;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public String getCoachGender() {
        return coachGender;
    }

    public void setCoachGender(String coachGender) {
        this.coachGender = coachGender;
    }

    public String getCoachSpeciality() {
        return coachSpeciality;
    }

    public void setCoachSpeciality(String coachSpeciality) {
        this.coachSpeciality = coachSpeciality;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
