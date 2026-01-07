package com.servlet.adoption.controller;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import org.json.JSONArray;
import org.json.JSONObject;
import com.servlet.adoption.dao.OrderDAOImpl;
@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        JSONObject data = new JSONObject(sb.toString());
        JSONArray cart = data.getJSONArray("cart");
        double total = data.getDouble("total");

        String orderId = "ORD" + System.currentTimeMillis();

        new OrderDAOImpl().saveOrder(orderId, total, cart);

        res.setContentType("application/json");
        res.getWriter().write(
            new JSONObject().put("orderId", orderId).toString()
        );
    }
}