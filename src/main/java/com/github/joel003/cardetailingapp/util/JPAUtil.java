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

            // 1. Fetch separate variables you set in Railway
            String dbUrl = System.getenv("JDBC_URL");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASSWORD");

            // 2. Ensure the URL uses the jdbc: protocol prefix
            if (dbUrl != null && dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            } else if (dbUrl != null && dbUrl.startsWith("postgresql://")) {
                dbUrl = dbUrl.replace("postgresql://", "jdbc:postgresql://");
            }

            // 3. Add SSL (Mandatory for Railway public networking)
            if (dbUrl != null && !dbUrl.contains("sslmode")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.user", dbUser);
            props.put("javax.persistence.jdbc.password", dbPass);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            tempEmf = Persistence.createEntityManagerFactory("carDetailingPU", props);
        } catch (Exception e) {
            System.err.println("FATAL: JPA Initializer failed.");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        } finally {
            // Final assignment to satisfies the 'final' keyword requirement
            emf = tempEmf;
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}