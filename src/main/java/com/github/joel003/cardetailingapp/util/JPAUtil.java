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

            // 1. Get the raw DATABASE_URL provided by Railway
            String dbUrl = System.getenv("DATABASE_URL");

            if (dbUrl == null || dbUrl.isEmpty()) {
                throw new RuntimeException("DATABASE_URL environment variable is missing!");
            }

            // 2. Convert postgres:// to jdbc:postgresql://
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            }

            // 3. Append SSL mode (Required for most cloud-hosted DBs)
            if (!dbUrl.contains("?")) {
                dbUrl += "?sslmode=require";
            } else if (!dbUrl.contains("sslmode")) {
                dbUrl += "&sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);

            // Note: Since DATABASE_URL already contains the username and password,
            // the driver will extract them automatically.

            emf = Persistence.createEntityManagerFactory("carDetailingPU", props);

        } catch (Exception e) {
            e.printStackTrace(); // This will show in Railway logs
            throw new ExceptionInInitializerError("JPA Initialization Failed: " + e.getMessage());
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}