package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.service.BookingService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/mark-completed")
public class MarkCompletedServlet extends HttpServlet {

    public final BookingService bookingService;
    public MarkCompletedServlet() {
        this.bookingService = new BookingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            HttpSession session = request.getSession(false);

            if (session == null || !"ADMIN".equals(session.getAttribute("ROLE"))) {
                response.sendRedirect("login.jsp");
                return;
            }

            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            bookingService.markCompleted(bookingId);

            response.sendRedirect(request.getContextPath() + "/admin/dashboard");

        }
        catch(Exception e){
            request.setAttribute("error", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin-dashboard.jsp");
            dispatcher.forward(request, response);
        }

    }
}

