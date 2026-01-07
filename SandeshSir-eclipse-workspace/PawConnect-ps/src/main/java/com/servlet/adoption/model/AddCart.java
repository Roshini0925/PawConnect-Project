package com.servlet.adoption.model;

public class AddCart {

	private int id;
    private String fullName;
    private String product;
    private double price;
    private int quantity;
    
	public AddCart() {	}

	public AddCart( String fullName, String product, double price, int quantity) {
		this.fullName = fullName;
		this.product = product;
		this.price = price;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setAddedDate(String string) {
		// TODO Auto-generated method stub
		
	}

    
}