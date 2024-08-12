package com.servlet;

import java.io.IOException;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.controller.UserController;
import com.controller.UserControllerImplements;
import com.model.Product;


@WebServlet("/editProduct")
@MultipartConfig
public class editProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        UserController uc = new UserControllerImplements();
        Product product = uc.getProductById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        float price = Float.parseFloat(request.getParameter("price"));
        
        Part filePart = request.getPart("productImage"); // Get the file part
        String fileName = getFileName(filePart); // Extract file name from the part

        String productImage = null;
        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
            File file = new File(uploadDir, fileName);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            productImage = fileName; // Use new image
        } else {
            productImage = request.getParameter("currentImage"); // Fallback to current image if no new image was uploaded
        }
        
        Product product = new Product();
        product.setId(productId);
        product.setProductName(productName);
        product.setCategory(category);
        product.setPrice(price);
        product.setProductImage(productImage);

        UserController uc = new UserControllerImplements();
        boolean success = uc.updateProduct(product);

        if (success) {
            response.sendRedirect("showAllProducts");
        } else {
            request.setAttribute("message", "Product update failed");
            request.setAttribute("product", product);
            request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
        }
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            for (String cd : contentDisp.split(";")) {
                if (cd.trim().startsWith("filename")) {
                    return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }
}
