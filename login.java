package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.controller.UserController;
import com.controller.UserControllerImplements;


@WebServlet("/login")
public class login extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String un=request.getParameter("username");
		String pwd= request.getParameter("password");
		
		
		String hashPwd= DigestUtils.shaHex(pwd.getBytes());
		
		UserController uc= new UserControllerImplements();
		
		if(un.equals("admin") && pwd.equals("admin")) {
			request.getRequestDispatcher("adminDash.jsp").forward(request, response);
		}
		
		if(uc.userLogin(un, hashPwd)==true)
		{
			HttpSession session= request.getSession();
			session.setMaxInactiveInterval(1800);
			session.setAttribute("activeUser", un);
			request.setAttribute("user", un);
			response.sendRedirect("home");
		}
		
		else
		{
			request.setAttribute("errorMessage","Username/Password Incorrect");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
	}

}
