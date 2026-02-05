package com.github.joel003.cardetailingapp.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class JPAUtil {

    private static final EntityManagerFactory emf;

    static {
        try {
            Map<String, String> props = new HashMap<>();
            String dbUrl = System.getenv("DATABASE_URL");

            if (dbUrl == null || dbUrl.isEmpty()) {
                throw new RuntimeException("DATABASE_URL environment variable is missing!");
            }

            // Convert postgres:// or postgresql:// to jdbc:postgresql://
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            } else if (dbUrl.startsWith("postgresql://")) {
                dbUrl = dbUrl.replace("postgresql://", "jdbc:postgresql://");
            }

            // Ensure sslmode=require is present for Railway
            if (!dbUrl.contains("sslmode")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            // Use the persistence unit name defined in your persistence.xml
            emf = Persistence.createEntityManagerFactory("carDetailingPU", props);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("JPA Initialization Failed: " + e.getMessage());
        }
    }
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}