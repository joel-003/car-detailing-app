package com.github.joel003.cardetailingapp.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession(false);

        if(session == null || !"ADMIN".equals(session.getAttribute("ROLE"))) {
            ((HttpServletResponse)res).sendRedirect("../login.jsp");
            return;
        }
        chain.doFilter(req, res);
    }
}

