package com.github.joel003.cardetailingapp.dao;

import com.github.joel003.cardetailingapp.model.User;
import com.github.joel003.cardetailingapp.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class UserDAO {

    public User findUserByEmail(String email) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        try {
            List<User> users = entityManager
                                .createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                                .setParameter("email",email)
                                .getResultList();
            return users.isEmpty() ? null : users.get(0);
        }finally {
            entityManager.close();
        }
    }

    public void saveUser(User user) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try{
            transaction.begin();
            entityManager.persist(user);
            transaction.commit();
        } catch (Exception e) {
            if(transaction.isActive()) transaction.rollback();
            throw new RuntimeException("Registration Failed");
        }finally {
            entityManager.close();
        }
    }

    public boolean updatePassword(User user) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            User userFromDB = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                                            .setParameter("email",user.getEmail())
                                            .getSingleResult();
            userFromDB.setPassword(user.getPassword());
            entityManager.merge(userFromDB);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if(transaction.isActive()) transaction.rollback();
            throw new RuntimeException("Registration Failed");
        }finally {
            entityManager.close();
        }

    }
}
