package com.servlet.adoption.dao;

import com.servlet.adoption.util.DBConnection;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderDAOImpl {

    public void saveOrder(String orderId, double total, JSONArray cart) {

        try (Connection con = DBConnection.getConnector()) {

            // Save order
            String orderSql = "INSERT INTO orders(order_id, total_amount) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(orderSql);
            ps.setString(1, orderId);
            ps.setDouble(2, total);
            ps.executeUpdate();

            // Save order items
            String itemSql = "INSERT INTO order_items(order_id, product_name, price, quantity, total) VALUES (?,?,?,?,?)";
            PreparedStatement ips = con.prepareStatement(itemSql);

            for (int i = 0; i < cart.length(); i++) {
                JSONObject item = cart.getJSONObject(i);
                ips.setString(1, orderId);
                ips.setString(2, item.getString("name"));
                ips.setDouble(3, item.getDouble("price"));
                ips.setInt(4, item.getInt("quantity"));
                ips.setDouble(5, item.getDouble("total"));
                ips.addBatch();
            }
            ips.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}