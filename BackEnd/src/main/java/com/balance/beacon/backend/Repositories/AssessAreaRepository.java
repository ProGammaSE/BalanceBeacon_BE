package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Areas;
import com.balance.beacon.backend.Models.AssessmentAreas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssessAreaRepository extends JpaRepository<AssessmentAreas, Integer> {
    AssessmentAreas findTopByOrderByAssessmentIdDesc();

    @Override
    List<AssessmentAreas> findAll();

    List<AssessmentAreas> findAllByUserId(int userId);
}
