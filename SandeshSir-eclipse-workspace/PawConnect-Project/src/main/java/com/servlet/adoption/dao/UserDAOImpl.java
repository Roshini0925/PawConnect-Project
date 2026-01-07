package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.adoption.dto.User;
import com.servlet.adoption.util.DBConnection;


	public class UserDAOImpl implements UserDAO {

	    @Override
	    public boolean registerUser(User user) {
	        String sql=("INSERT INTO user(fullName, email, phone, password) VALUES (?, ?, ?, ?)");

	        try {
	        	Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, user.getFullName());
	            ps.setString(2, user.getEmail());
	            ps.setLong(3, user.getPhone());
	            ps.setString(4, user.getPassword());

	            return ps.executeUpdate() > 0;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	
	    @Override
	    public boolean emailExists(String email) {
	        String sql=("SELECT email FROM user WHERE email=?");
	        try {
	        Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();
	            if(rs.next()) {
	            	User user = new User();
	            	user.setFullName(rs.getString("fullName"));
	            	user.setEmail(rs.getString("email"));
	            	user.setPhone(rs.getLong("phone"));
	            	user.setPassword(rs.getString("password"));
	            	
	            	return true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    @Override
	    public User loginUser(String email, String hashedPassword) {
	        User user = null;
	        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

	        try {
	            Connection con = DBConnection.getConnector();
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, email);
	            ps.setString(2, hashedPassword);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                user = new User();
	                user.setFullName(rs.getString("fullName"));   // ✅ IMPORTANT
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }
	    @Override
	    public List<User> getAllUsers() {
	        List<User> list = new ArrayList<>();
	        String sql = "SELECT * FROM user";

	        try {
	            Connection con = DBConnection.getConnector();
	            PreparedStatement ps = con.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                User u = new User();
	                
	                u.setFullName(rs.getString("fullName"));
	                u.setEmail(rs.getString("email"));
	                u.setPhone(rs.getLong("phone"));
	                list.add(u);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	}
	