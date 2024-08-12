package com.servlet;

import com.controller.UserController;
import com.controller.UserControllerImplements;
import com.model.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("activeUser");
        
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        
        UserController userController = new UserControllerImplements();
        User user = userController.getUserByUsername(username);
        
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "User not found.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
