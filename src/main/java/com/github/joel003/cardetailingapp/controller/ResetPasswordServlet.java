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

@WebServlet(value = "/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    private final UserService userService;
    public ResetPasswordServlet() {
        this.userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("RESET-EMAIL") == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password.jsp");
            return;
        }
        try {
            User user = new User();
            user.setEmail(session.getAttribute("RESET-EMAIL").toString());
            user.setPassword(InputValidator.validatePassword(req.getParameter("newPassword")));

            session.removeAttribute("RESET_EMAIL");

            boolean success = userService.updatePassword(user);
            if (success) {
                req.setAttribute("resetSuccess", "Password updated successfully! Please log in.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
            else  {
                req.setAttribute("error", "Failed to Update Password!");
                req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);
            }

        }catch (Exception e){
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }


    }
}
