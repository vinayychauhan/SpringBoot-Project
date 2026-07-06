package com.v.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.v.dao.UserRepository;
import com.v.model.User;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    // Get all users
    public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    // Get user by username
    public User getUserByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    // Save or Register new user
    public void saveUser(User user) {
        userRepo.save(user);
    }

    // Delete user
    public void deleteUser(int id) {
        userRepo.deleteById(id);
    }
}