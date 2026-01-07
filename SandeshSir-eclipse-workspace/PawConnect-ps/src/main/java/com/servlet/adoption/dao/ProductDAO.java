package com.servlet.adoption.dao;

import java.util.List;

import com.servlet.adoption.model.Product;

public interface ProductDAO {
	public List<Product> getAllProducts();
}