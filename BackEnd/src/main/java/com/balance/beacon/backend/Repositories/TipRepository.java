package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Tips;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipRepository extends JpaRepository<Tips, Integer> {
    List<Tips> findByAreaId(int areaId);
}
