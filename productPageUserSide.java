package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.UserController;
import com.controller.UserControllerImplements;
import com.model.Product;

@WebServlet("/productPageUser")
public class productPageUserSide extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        UserController userController = new UserControllerImplements();
	        List<Product> products = userController.getProductData();
	        request.setAttribute("products", products);
	        request.getRequestDispatcher("productPageUser.jsp").forward(request, response);
	    }
}
