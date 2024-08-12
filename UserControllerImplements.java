package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Product;
import com.model.User;

public class UserControllerImplements  implements UserController{

	Connection conn=null;
	public UserControllerImplements()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");

		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tvworld","root","");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	@Override
	public boolean addUser(User u) {
		String sql="insert into usertable(username,password,email,utype) values(?,?,?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, u.getUsername());
			pstm.setString(2, u.getPassword());
			pstm.setString(3, u.getEmail());
			pstm.setString(4, u.getUtype());
			pstm.execute();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}


	@Override
	public boolean userLogin(String un, String pwd) {
	boolean answer=false;
		
		String sql="select * from usertable where username=? and password=?";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, un);
			pstm.setString(2, pwd);
			ResultSet rs=pstm.executeQuery();
			
			if(rs.next())
			{
				answer=true;
			}
			else {
				answer=false;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return answer;
	}


	@Override
	public List<User> getAllData() {
		List<User> userList= new ArrayList<>();
		String sql="select * from usertable";
		try {
			Statement stm= conn.createStatement();
			ResultSet rs= stm.executeQuery(sql);
			
			while(rs.next())
			{
				User u= new User();
				u.setId(rs.getInt("id"));
		
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));			
				userList.add(u);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return userList;
	}


	@Override
	public boolean deleteAUser(int id) {
		String sql="delete from usertable where id="+id;
		
		try {
			Statement stm=conn.createStatement();
			stm.execute(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}


	@Override
	public List<User> getUserById(int id) {
		List<User> userList= new ArrayList<>();
		String sql="select * from usertable where id="+id;
		try {
			Statement stm= conn.createStatement();
			ResultSet rs= stm.executeQuery(sql);
			
			while(rs.next())
			{
				User u= new User();
				u.setId(rs.getInt("id"));
		
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));			
				userList.add(u);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return userList;
	}


	@Override
	public boolean editUser(User u) {
		String sql="update usertable set username=? where id=?";
		try {
			PreparedStatement pstm= conn.prepareStatement(sql);
			pstm.setString(1, u.getUsername());
			pstm.setInt(2, u.getId());
			pstm.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
		
		
	}


	@Override
	public boolean addNewProduct(Product p) {
		String sql="insert into product(productName,price,category,productImage) values(?,?,?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, p.getProductName());
			pstm.setFloat(2, p.getPrice());
			pstm.setString(3, p.getCategory());
			pstm.setString(4, p.getProductImage());
			
			pstm.execute();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}


	@Override
	public List<Product> getProductData() {
	    List<Product> productList = new ArrayList<>();
	    String sql = "SELECT * FROM product";
	    try (Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(sql)) {
	        while (rs.next()) {
	            Product p = new Product();
	            p.setId(rs.getInt("id"));
	            p.setProductName(rs.getString("productName"));
	            p.setCategory(rs.getString("category"));
	            p.setPrice(rs.getFloat("price"));
	            p.setProductImage(rs.getString("productImage"));
	            productList.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	    return productList;
	}
	
	@Override
	public boolean deleteProduct(int productId) {
	    String sql = "DELETE FROM product WHERE id = ?";
	    try (PreparedStatement pstm = conn.prepareStatement(sql)) {
	        pstm.setInt(1, productId);
	        int rowsAffected = pstm.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public Product getProductById(int productId) {
	    String sql = "SELECT * FROM product WHERE id = ?";
	    Product product = null;
	    try (PreparedStatement pstm = conn.prepareStatement(sql)) {
	        pstm.setInt(1, productId);
	        ResultSet rs = pstm.executeQuery();
	        if (rs.next()) {
	            product = new Product();
	            product.setId(rs.getInt("id"));
	            product.setProductName(rs.getString("productName"));
	            product.setCategory(rs.getString("category"));
	            product.setPrice(rs.getFloat("price"));
	            product.setProductImage(rs.getString("productImage"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return product;
	}

	@Override
	public boolean updateProduct(Product p) {
	    String sql = "UPDATE product SET productName=?, price=?, category=?, productImage=? WHERE id=?";
	    try (PreparedStatement pstm = conn.prepareStatement(sql)) {
	        pstm.setString(1, p.getProductName());
	        pstm.setFloat(2, p.getPrice());
	        pstm.setString(3, p.getCategory());
	        pstm.setString(4, p.getProductImage());
	        pstm.setInt(5, p.getId());
	        return pstm.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public User getUserByUsername(String username) {
	    String sql = "SELECT * FROM usertable WHERE username = ?";
	    try (PreparedStatement pstm = conn.prepareStatement(sql)) {
	        pstm.setString(1, username);
	        ResultSet rs = pstm.executeQuery();
	        if (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setUsername(rs.getString("username"));
	            user.setPassword(rs.getString("password"));
	            user.setEmail(rs.getString("email"));
	            user.setUtype(rs.getString("utype"));
	            return user;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	public boolean updateUserProfile(User u) {
	    String sql = "UPDATE usertable SET username=?, email=?, password=? WHERE id=?";
	    try {
	        PreparedStatement pstm = conn.prepareStatement(sql);
	        pstm.setString(1, u.getUsername());
	        pstm.setString(2, u.getEmail());
	        pstm.setString(3, u.getPassword());
	        pstm.setInt(4, u.getId());
	        int rowsAffected = pstm.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
