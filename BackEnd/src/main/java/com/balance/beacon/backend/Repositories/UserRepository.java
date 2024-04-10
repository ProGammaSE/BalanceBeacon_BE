package com.balance.beacon.backend.Repositories;

import com.balance.beacon.backend.Models.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer> {

    Users findByUserEmail(String userName);
    Users findByUserId(int userId);
}
