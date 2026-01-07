package com.servlet.adoption.dao;

import com.servlet.adoption.model.Delivery;

public interface DeliveryDAO {

	public boolean placeOrder(Delivery order); 
	boolean updateStatus(int id, String status);
}