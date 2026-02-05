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
                throw new RuntimeException("DATABASE_URL variable is missing from Railway settings.");
            }

            // Convert protocol: postgres:// -> jdbc:postgresql://
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            }

            // Cloud databases often require SSL
            if (!dbUrl.contains("sslmode")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            // Match the name exactly from your persistence.xml
            emf = Persistence.createEntityManagerFactory("carDetailingPU", props);
        } catch (Exception e) {
            // Log the error to the console so it appears in Railway logs
            System.err.println("JPA Initialization Failed: " + e.getMessage());
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}