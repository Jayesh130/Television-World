package com.servlet;

import java.io.File;
import java.io.IOException;
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

/**
 * Servlet implementation class addNewProduct
 */
@WebServlet("/addNewProduct")
@MultipartConfig
public class addNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewProduct() {
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addNewProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String productName = request.getParameter("name");
		String category = request.getParameter("category");
		Float price = Float.parseFloat(request.getParameter("price"));
		
		Part filePart = request.getPart("image");
		String fileName = getFileName(filePart);
		String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
		System.out.println(fileName);
		System.out.println(uploadDir);
		File uploadDirFile = new File(uploadDir);
		if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs(); // Create directory if it doesn't exist
        }
        File file = new File(uploadDir + File.separator + fileName);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        Product p = new Product();
        p.setProductName(productName);
        p.setPrice(price);
        p.setCategory(category);;
        p.setProductImage(fileName);
        
        UserController uc = new UserControllerImplements();
        uc.addNewProduct(p);
        
        request.setAttribute("message", "Product added successfully");
		request.getRequestDispatcher("adminDash.jsp").forward(request, response);
		
		
	}
	
	 private String getFileName(Part part) {
	        for (String content : part.getHeader("content-disposition").split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
			return null;
	}

}
