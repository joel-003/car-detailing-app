package com.github.joel003.cardetailingapp.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class JPAUtil {
    private static final EntityManagerFactory emf;

    static {
        EntityManagerFactory tempEmf = null;
        try {
            Map<String, String> props = new HashMap<>();

            // 1. Fetch separate environment variables from Railway
            String dbUrl = System.getenv("JDBC_URL");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASSWORD");

            // 2. Set them explicitly in the Hibernate properties map
            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.user", dbUser);
            props.put("javax.persistence.jdbc.password", dbPass);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            tempEmf = Persistence.createEntityManagerFactory("carDetailingPU", props);
        } catch (Exception e) {
            System.err.println("CRITICAL: JPA Initialization failed.");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        } finally {
            emf = tempEmf;
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}