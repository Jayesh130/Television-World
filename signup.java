package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.controller.UserController;
import com.controller.UserControllerImplements;
import com.model.User;


@WebServlet("/signup")
public class signup extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String utype = request.getParameter("utype");
		
		String hashPassword=DigestUtils.shaHex(password.getBytes());
		
		User u= new User();
	
		u.setUsername(username);
		u.setPassword(hashPassword);
		u.setEmail(email);
		u.setUtype(utype);
		
		
		UserController uc=new UserControllerImplements();
		uc.addUser(u);
		
		request.setAttribute("errorMessage", "User has been created! Please sign in!!!");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}
