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

            if (dbUrl == null) {
                throw new RuntimeException("DATABASE_URL not set");
            }

            props.put("javax.persistence.jdbc.url", dbUrl);
            props.put("javax.persistence.jdbc.driver", "org.postgresql.Driver");

            emf = Persistence.createEntityManagerFactory(
                    "carDetailingPU", props
            );

        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}

