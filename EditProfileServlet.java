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

import org.apache.commons.codec.digest.DigestUtils;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int userId = Integer.parseInt(request.getParameter("id"));
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password"); 
	        String hashPassword = DigestUtils.shaHex(password.getBytes());
	        
	        UserController controller = new UserControllerImplements();
	        User user = new User();
	        user.setId(userId);
	        user.setUsername(username);
	        user.setEmail(email);
	        user.setPassword(hashPassword); // Assuming password needs to be updated
	        if (controller.updateUserProfile(user)) {
	            request.getRequestDispatcher("home.jsp").forward(request, response);	        }
	        else {
	            request.setAttribute("error", "Unable to update profile.");
	            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	        }
	    }
}
