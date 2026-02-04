package com.github.joel003.cardetailingapp;

import org.apache.catalina.startup.Tomcat;

public class Main {
    public static void main(String[] args) throws Exception {

        String port = System.getenv("PORT");
        if (port == null) port = "8080";

        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(port));
        tomcat.getConnector();

        tomcat.addWebapp("", System.getProperty("java.io.tmpdir"));

        tomcat.start();
        tomcat.getServer().await();
    }
}
