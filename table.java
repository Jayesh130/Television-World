package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.UserController;
import com.controller.UserControllerImplements;
import com.model.User;

@WebServlet("/table")
public class table extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		
		if(session.getAttribute("activeUser")==null)
		{
			request.setAttribute("error", "Please Login First!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		else {
		
		UserController uc= new UserControllerImplements();
		List<User>userList=uc.getAllData();
		
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("table.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id= Integer.valueOf(request.getParameter("id"));
		String fname= request.getParameter("fname");
		String lname= request.getParameter("lname");
		String username= request.getParameter("username");
		
		UserController uc= new UserControllerImplements();
		
		User u = new User();
		u.setId(id);
	
		u.setUsername(username);
		
		uc.editUser(u);
		
		request.setAttribute("userList", uc.getAllData());
		request.setAttribute("notify", "Row Number"+id+" Has Been Updated");
		request.getRequestDispatcher("table.jsp").forward(request, response);
		
		
		
		
	}

}
