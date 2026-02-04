package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.model.User;
import com.github.joel003.cardetailingapp.service.UserService;
import com.github.joel003.cardetailingapp.util.InputValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {

    private final UserService userService;
    public RegisterServlet(){
        this.userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try{
            User user = new User();

            user.setName(InputValidator.validateName(req.getParameter("name")));
            user.setEmail(InputValidator.validateEmail(req.getParameter("email")));
            user.setPassword(InputValidator.validatePassword(req.getParameter("password")));
            user.setPhone(InputValidator.validatePhone(req.getParameter("phone")));
            user.setAddress(InputValidator.validateAddress(req.getParameter("address")));

            boolean success = userService.registerUser(user);

            if(success) {
                resp.sendRedirect("login.jsp?regSuccess=true");
                return;
            }
            else
                req.setAttribute("error","email already exists");

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }
        req.getRequestDispatcher("register-user.jsp").forward(req, resp);
    }

}
