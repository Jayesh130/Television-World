package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.UserController;
import com.controller.UserControllerImplements;

/**
 * Servlet implementation class delete
 */
@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        UserController uc = new UserControllerImplements();
        boolean success = uc.deleteProduct(productId);
        
        if (success) {
            request.setAttribute("message", "Product deleted successfully");
            System.out.println("Product deleted successfully");
        } else {
            request.setAttribute("message", "Product deletion failed");
            System.out.println("Product not deleted");
        }
        response.sendRedirect("showAllProducts"); // Redirect to the product list page
    }

}