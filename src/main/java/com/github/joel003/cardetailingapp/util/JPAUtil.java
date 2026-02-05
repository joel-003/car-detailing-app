package com.github.joel003.cardetailingapp.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class JPAUtil {
    // The variable must be assigned exactly once
    private static final EntityManagerFactory emf;

    static {
        EntityManagerFactory tempEmf = null;
        try {
            Map<String, String> props = new HashMap<>();
            String dbUrl = System.getenv("DATABASE_URL");

            if (dbUrl == null || dbUrl.isEmpty()) {
                throw new RuntimeException("DATABASE_URL is missing! Check Railway environment variables.");
            }

            // Convert protocol: postgres:// or postgresql:// to jdbc:postgresql://
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            } else if (dbUrl.startsWith("postgresql://")) {
                dbUrl = dbUrl.replace("postgresql://", "jdbc:postgresql://");
            }

            // Standardize SSL for cloud deployment
            if (!dbUrl.contains("sslmode")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            // Initialize the factory into a temporary variable
            tempEmf = Persistence.createEntityManagerFactory("carDetailingPU", props);

        } catch (Exception e) {
            System.err.println("CRITICAL: JPA Initialization failed.");
            e.printStackTrace();
            // If it fails, the app should probably not start
            throw new ExceptionInInitializerError(e);
        } finally {
            // Final assignment to the 'final' variable
            emf = tempEmf;
        }
    }

    public static EntityManager getEntityManager() {
        if (emf == null) {
            throw new IllegalStateException("EntityManagerFactory was not initialized.");
        }
        return emf.createEntityManager();
    }
}