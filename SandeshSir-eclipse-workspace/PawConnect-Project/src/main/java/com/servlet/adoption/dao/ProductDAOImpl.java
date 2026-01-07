package com.servlet.adoption.dao;

import com.servlet.adoption.model.Product;
import com.servlet.adoption.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO{

	@Override
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();

        try {
        	Connection con = DBConnection.getConnector();
        	String sql = "SELECT * FROM products";
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(sql);

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));
                list.add(p);
                System.out.println("Fetched product: " + p.getProductName()+ " " + p.getPrice());
            }

            System.out.println("TOTAL PRODUCTS: " + list.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}