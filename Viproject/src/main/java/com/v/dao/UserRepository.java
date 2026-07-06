package com.v.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.v.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // Find user by username (used in login)
    User findByUsername(String username);

    // Find user by email
    User findByEmail(String email);
}