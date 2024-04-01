package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Areas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AreaRepository extends JpaRepository<Areas, Integer> {

    Areas findByAreaDescription(String areaDescription);
    Areas findByAreaId(int findByAreaId);
}
