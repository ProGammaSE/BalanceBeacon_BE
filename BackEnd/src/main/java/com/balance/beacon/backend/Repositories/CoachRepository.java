package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Coaches;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoachRepository extends JpaRepository<Coaches, Integer> {
}
