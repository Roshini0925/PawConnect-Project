package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.servlet.adoption.model.Delivery;
import com.servlet.adoption.util.DBConnection;

public class DeliveryDAOImpl implements DeliveryDAO{

     public boolean placeOrder(Delivery order) {
    	 try{
        	Connection con=DBConnection.getConnector();
			PreparedStatement ps=con.prepareStatement("INSERT INTO delivery_orders(fullName, phone, email, address, product, quantity, status) VALUES (?, ?, ?, ?, ?, ?,?)");
            ps.setString(1, order.getFullName());
            ps.setLong(2, order.getPhone());
            ps.setString(3, order.getAddress());
            ps.setString(4, order.getAddress());
            ps.setString(5, order.getProduct());
            ps.setInt(6, order.getQuantity());
            ps.setString(7, order.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean updateStatus(int id, String status) {
    	 try{
         	Connection con=DBConnection.getConnector();
 			PreparedStatement ps=con.prepareStatement("UPDATE delivery_orders SET status=? WHERE id=?");
         
 			ps.setString(1, status);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}