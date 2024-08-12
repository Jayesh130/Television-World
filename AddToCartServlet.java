package com.servlet;

import com.controller.UserControllerImplements;
import com.model.Cart;
import com.model.CartItem;
import com.model.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session but do not create a new one if it doesn't exist
        HttpSession session = request.getSession(false);

        // Redirect user to login page if there is no session or if the session has no "activeUser" attribute
        if (session == null || session.getAttribute("activeUser") == null) {
            response.sendRedirect("login"); // Assuming "login.jsp" is your login page
            return;
        }

        // Proceed with adding items to the cart
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        UserControllerImplements productController = new UserControllerImplements();
        Product product = productController.getProductById(productId);

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        cart.addItem(new CartItem(product, quantity));
        session.setAttribute("cart", cart);

        // Redirect to cart page to display the cart
        response.sendRedirect("cart.jsp"); // Assuming you have a "cart.jsp" that displays the cart
    }
}
