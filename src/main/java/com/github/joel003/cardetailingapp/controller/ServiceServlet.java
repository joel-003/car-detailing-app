package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.model.WashPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;  

@WebServlet(value = "/service")
public class ServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String packageName = req.getParameter("package");
            if(packageName == null) {
                throw new RuntimeException("Please Select a Package to Order");
            }
            double price = getPrice(packageName);
            req.setAttribute("package", packageName);
            req.setAttribute("price", price);
            req.getRequestDispatcher("booking.jsp").forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("service.jsp").forward(req, resp);
        }

    }

    private static double getPrice(String packageName) {
        WashPackage washPackage = new WashPackage();
        double price = switch (packageName){
            case "basicWash" -> washPackage.getBasicWash();
            case "deluxeWash" -> washPackage.getDeluxeWash();
            case "premiumWash" -> washPackage.getPremiumWash();
            case "ultimateWash" -> washPackage.getUltimateWash();
            case "dryCleaning" -> washPackage.getDryCleaning();
            default -> throw new  RuntimeException("Please Select a Package to Order");
        };
        return price;
    }
}
