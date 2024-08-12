package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/viewCart")
public class viewCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get session but do not create if it doesn't exist
        if (session == null || session.getAttribute("activeUser") == null) {
            response.sendRedirect("login"); // Redirect to login page if there's no session or "activeUser" attribute
            return;
        }
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}

