package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Tips;
import com.balance.beacon.backend.Models.UserTips;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTipRepository extends JpaRepository<UserTips, Integer> {
    List<UserTips> findByUserIdAndAssessmentIdAndTipStatus(int userId, int assessmentId, int status);
}
