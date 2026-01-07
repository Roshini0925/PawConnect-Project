package com.servlet.adoption.dao;

import jakarta.json.JsonArray;

public interface OrderDAO {

	 public void saveOrder(String orderId, double total, JsonArray cart);
}