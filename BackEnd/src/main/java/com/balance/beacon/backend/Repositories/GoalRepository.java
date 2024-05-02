package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Goals;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;

@Repository
public interface GoalRepository extends JpaRepository <Goals, Integer> {
    Goals findByUserTipId(int userTipId);
}
