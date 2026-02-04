package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.model.User;
import com.github.joel003.cardetailingapp.service.UserService;
import com.github.joel003.cardetailingapp.util.InputValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private final UserService userService;
    public ForgotPasswordServlet() {
        this.userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            User user = new User();
            user.setEmail(InputValidator.validateEmail(req.getParameter("email")));

            User userFromDB = userService.getUser(user);
            if (userFromDB == null) {
                req.setAttribute("error", "Email not found");
                req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("RESET-EMAIL", userFromDB.getEmail());

            req.setAttribute("message","Email verified! You may now reset the password");
            req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);

        }catch (Exception e){
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);
        }
    }
}
