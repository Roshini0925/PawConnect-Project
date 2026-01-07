package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.adoption.dto.CartItem;
import com.servlet.adoption.util.DBConnection;

	public class CartDAOImpl implements CartDAO {

	    @Override
	    public boolean addCartItem(CartItem item) {
	        String sql = "INSERT INTO cart (fullName, product, price, quantity, added_date) VALUES (?, ?, ?, ?, NOW())";
	        try (Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setString(1, item.getFullName());
	            ps.setString(2, item.getProduct());
	            ps.setDouble(3, item.getPrice());
	            ps.setInt(4, item.getQuantity());

	            return ps.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    @Override
	    public boolean updateCartItemQuantity(int id, int quantity) {
	        String sql = "UPDATE cart SET quantity=? WHERE id=?";
	        try (Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, quantity);
	            ps.setInt(2, id);

	            return ps.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public boolean removeCartItem(int id) {
	        String sql = "DELETE FROM cart WHERE id=?";
	        try (Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, id);
	            return ps.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public List<CartItem> getCartItems(String fullName) {
	        List<CartItem> list = new ArrayList<>();
	        String sql = "SELECT * FROM cart WHERE fullName=?";
	        try (Connection con = DBConnection.getConnector();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setString(1, fullName);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                CartItem item = new CartItem();
	                item.setId(rs.getInt("id"));
	                item.setFullName(rs.getString("fullName"));
	                item.setProduct(rs.getString("product"));
	                item.setPrice(rs.getDouble("price"));
	                item.setQuantity(rs.getInt("quantity"));
	                item.setAddedDate(rs.getString("added_date"));

	                list.add(item);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return list;
	    }

		@Override
		public int getCartItemCount(String fullName) {
			String sql = "SELECT COALESCE(SUM(quantity),0) AS cnt FROM cart WHERE fullName = ?";
		    try (Connection con = DBConnection.getConnector();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setString(1, fullName);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            return rs.getInt("cnt");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
			return 0;
		}

		@Override
		public CartItem findByUserAndProduct(String fullName, String product) {
			 String sql = "SELECT * FROM cart WHERE fullName = ? AND product = ? LIMIT 1";
			    try (Connection con = DBConnection.getConnector();
			         PreparedStatement ps = con.prepareStatement(sql)) {
			        ps.setString(1, fullName);
			        ps.setString(2, product);
			        ResultSet rs = ps.executeQuery();
			        if (rs.next()) {
			            CartItem item = new CartItem();
			            item.setId(rs.getInt("id"));
			            item.setFullName(rs.getString("fullName"));
			            item.setProduct(rs.getString("product"));
			            item.setPrice(rs.getDouble("price"));
			            item.setQuantity(rs.getInt("quantity"));
			            item.setAddedDate(rs.getString("added_date"));
			            return item;
			        }
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
			return null;
		}
	}
