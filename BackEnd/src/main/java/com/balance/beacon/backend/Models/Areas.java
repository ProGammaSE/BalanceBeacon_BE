package com.balance.beacon.backend.Models;

import javax.persistence.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "areas")
public class Areas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "area_id")
    private int areaId;

    @Column(name = "area_description")
    private String areaDescription;

    @JsonFormat(pattern="yyyy-MM-dd'T'HH:mm:ss")
    @Column(name = "area_created_date")
    private Date areaCreatedDate;

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getAreaDescription() {
        return areaDescription;
    }

    public void setAreaDescription(String areaDescription) {
        this.areaDescription = areaDescription;
    }

    public Date getAreaCreatedDate() {
        return areaCreatedDate;
    }

    public void setAreaCreatedDate(Date areaCreatedDate) {
        this.areaCreatedDate = areaCreatedDate;
    }
}
