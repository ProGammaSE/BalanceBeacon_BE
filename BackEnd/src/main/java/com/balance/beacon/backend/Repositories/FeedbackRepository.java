package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackRepository extends JpaRepository <Feedback, Integer> {
}
