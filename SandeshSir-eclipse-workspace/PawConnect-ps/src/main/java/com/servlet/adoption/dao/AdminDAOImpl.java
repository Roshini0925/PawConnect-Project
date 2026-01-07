package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.servlet.adoption.dto.Admin;
import com.servlet.adoption.util.DBConnection;


public class AdminDAOImpl implements AdminDAO {
Connection con = null;
	@Override
	public boolean registerAdmin(Admin admin) {
		// TODO Auto-generated method stub
		con=DBConnection.getConnector();
		String register="INSERT into admin values(?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(register);
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getEmail());
			ps.setString(3, admin.getPassword());

	            return ps.executeUpdate() > 0;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	
	    @Override
	    public boolean emailExists(String email) {
	        String sql= "SELECT email FROM admin WHERE email=?";
	        try {
	        Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();

	            return rs.next(); // email already exists

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

		@Override
		public boolean loginAdmin(String email, String hashedPassword) {
	
			    String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";

			    try {
			    	Connection con = DBConnection.getConnector();
			    	Admin admin=null;
			         PreparedStatement ps = con.prepareStatement(sql);

			        ps.setString(1, email);
			        ps.setString(2, hashedPassword);
			        ResultSet rs = ps.executeQuery();
			        
			        if(rs.next()) {
			        	admin=new Admin();
			        	admin.setName(rs.getString("1"));
			        	admin.setEmail(rs.getString("2"));
			        	admin.setPassword(rs.getString("3"));
			        	
			        }

			        return rs.next(); // True if match found

			    } catch (Exception e) {
			        e.printStackTrace();
			    }
		
			return false;
		}
	}

	