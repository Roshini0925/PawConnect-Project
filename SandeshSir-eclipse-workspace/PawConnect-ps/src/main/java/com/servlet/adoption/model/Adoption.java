package com.servlet.adoption.model;

public class Adoption {
	    private int id;
	    private int petId;
	    private String fullName;
	    private String email;
	    private Long phone;
	    private String address;
	    private String message;

	    
		public Adoption(int id,int petId,String fullName,String email,Long phone,String address,String message) 
	    {
		
			this.id = id;
			this.petId = petId;
			this.fullName = fullName;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.message = message;
		}
		
	
		public int getId() { return id; }
	    public void setId(int id) { this.id = id; }

	    public int getPetId() { return petId; }
	    public void setPetId(int petId) { this.petId = petId; }

	    public String getFullName() { return fullName; }
	    public void setFullName(String fullName) { this.fullName = fullName; }

	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }

	    public Long getPhone() { return phone; }
	    public void setPhone(Long phone) { this.phone = phone; }

	    public String getAddress() { return address; }
	    public void setAddress(String address) { this.address = address; }

	    public String getMessage() { return message; }
	    public void setMessage(String message) { this.message = message; }
	}



