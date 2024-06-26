package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.AssessmentAreas;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssessAreaRepository extends JpaRepository<AssessmentAreas, Integer> {
    AssessmentAreas findTopByOrderByAssessmentIdDesc();

    List<AssessmentAreas> findAll();

    List<AssessmentAreas> findAllByUserId(int userId);
}
