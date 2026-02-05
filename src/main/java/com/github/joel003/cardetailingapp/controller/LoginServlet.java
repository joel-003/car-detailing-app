package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.model.User;
import com.github.joel003.cardetailingapp.service.UserService;
import com.github.joel003.cardetailingapp.util.InputValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService;
    public LoginServlet() {
        this.userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = new User();

            user.setEmail(InputValidator.validateEmail(req.getParameter("email")));
            user.setPassword(InputValidator.validatePassword(req.getParameter("password")));

            User userFromDB = userService.loginUser(user);
            if (userFromDB == null) {
                req.setAttribute("error", "Not Registered");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            HttpSession old = req.getSession(false);
            if (old != null) old.invalidate();
            HttpSession session = req.getSession(true);

            session.setAttribute("USER_ID", userFromDB.getUserId());
            session.setAttribute("USER_NAME", userFromDB.getName());
            session.setAttribute("MEMBERSHIP", userFromDB.getMembershipType().name());
            session.setAttribute("ROLE", userFromDB.getRole().name());
            session.setMaxInactiveInterval(30 * 60);

            if ("ADMIN".equals(userFromDB.getRole().name())) {
                resp.sendRedirect(req.getContextPath() + "/service.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/service.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
