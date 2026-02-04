package com.github.joel003.cardetailingapp.service;

import com.github.joel003.cardetailingapp.dao.UserDAO;
import com.github.joel003.cardetailingapp.model.Role;
import com.github.joel003.cardetailingapp.model.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public boolean registerUser(User user) {

        User exists = userDAO.findUserByEmail(user.getEmail());
        if (exists != null) {
            return false;
        }
        user.setRole(Role.USER);

        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashedPassword);

        userDAO.saveUser(user);
        return true;
    }

    public User loginUser(User user) {
        User userFromDB = userDAO.findUserByEmail(user.getEmail());
        if (userFromDB == null) {
            return null;
        }

        // BCrypt validation
        if (BCrypt.checkpw(user.getPassword(), userFromDB.getPassword())) {
            return userFromDB;
        } else {
            throw new RuntimeException("Incorrect Password");
        }
    }

    public User getUser(User user) {
        User userFromDB = userDAO.findUserByEmail(user.getEmail());
        if (userFromDB != null) {
            return userFromDB;
        }
        return null;
    }

    public boolean updatePassword(User user) {
        return userDAO.updatePassword(user);
    }
}
