package com.servlet.adoption.dto;

import com.servlet.adoption.model.AddCart;

public class CartItem {
	    private int id;
	    private String fullName;
	    private String product;
	    private double price;
	    private int quantity;
	    private String addedDate;

	    // Getters and Setters
	    public int getId() { return id; }
	    public void setId(int id) { this.id = id; }

	    public String getFullName() { return fullName; }
	    public void setFullName(String fullName) { this.fullName = fullName; }

	    public String getProduct() { return product; }
	    public void setProduct(String product) { this.product = product; }

	    public double getPrice() { return price; }
	    public void setPrice(double price) { this.price = price; }

	    public int getQuantity() { return quantity; }
	    public void setQuantity(int quantity) { this.quantity = quantity; }

	    public String getAddedDate() { return addedDate; }
	    public void setAddedDate(String addedDate) { this.addedDate = addedDate; 
	    }
		public boolean addToCart(AddCart cart) {
			return false;
		}
	
	}