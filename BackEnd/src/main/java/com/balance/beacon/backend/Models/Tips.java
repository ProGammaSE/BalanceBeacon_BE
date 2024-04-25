package com.balance.beacon.backend.Models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tips")
public class Tips {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tip_id")
    private int tipId;

    @Column(name = "area_id")
    private int areaId = 0;

    @Column(name = "tip_description")
    private String tipDescription = "";

    @Column(name = "tip_created_date")
    private Date tipCreatedDate;

    public int getTipId() {
        return tipId;
    }

    public void setTipId(int tipId) {
        this.tipId = tipId;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getTipDescription() {
        return tipDescription;
    }

    public void setTipDescription(String tipDescription) {
        this.tipDescription = tipDescription;
    }

    public Date getTipCreatedDate() {
        return tipCreatedDate;
    }

    public void setTipCreatedDate(Date tipCreatedDate) {
        this.tipCreatedDate = tipCreatedDate;
    }
}
