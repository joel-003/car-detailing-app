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
                throw new RuntimeException("DATABASE_URL is missing from environment variables.");
            }

            // 1. Convert protocol for JDBC compatibility
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            }

            // 2. Append SSL requirements for Railway/Cloud DBs
            if (!dbUrl.contains("sslmode")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            // 3. Initialize the Factory with overridden properties
            emf = Persistence.createEntityManagerFactory("carDetailingPU", props);

        } catch (Exception e) {
            // Log to System.err to ensure it appears in Railway's console
            System.err.println("CRITICAL: JPA Initialization Failed");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}