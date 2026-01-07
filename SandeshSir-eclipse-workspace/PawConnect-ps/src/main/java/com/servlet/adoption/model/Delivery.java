package com.servlet.adoption.model;

public class Delivery {
 
	private int id;
    private String fullName;
    private long phone;
    private String email;
    private String address;
    private String product;
    private int quantity;
    private String status;
    

    public Delivery() {}

    public Delivery(String fullName, long phone, String email, String address, String product, int quantity) {
        this.fullName = fullName;
        this.phone = phone;
        this.email= email; 
        this.address = address;
        this.product = product;
        this.quantity = quantity;
        this.status = "Ordered";
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
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() { 
		return status; 
	}
    public void setStatus(String status) {
    	this.status = status; 
     }
}
