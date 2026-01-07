package com.servlet.adoption.model;

public class Adoption {
	    private int petId;
	    private String petName;
	    private String petImage;
	    private String fullName;
	    private String email;
	    private Long phone;
	    private String address;
	    private String message;

	    
		public Adoption(int petId,String petName,String petImage,String fullName,String email,Long phone,String address,String message) 
	    {
		
			this.petId = petId;
			this.petName=petName;
			this.petImage=petImage;
			this.fullName = fullName;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.message = message;
		}
		
	
		
	    public Adoption() {
	
		}



		public int getPetId() { return petId; }
	    public void setPetId(int petId) { this.petId = petId; }

	    public String getPetName() { return petName; }
	    public void setPetName(String petName) { this.petName = petName; }
	    
	    public String getPetImage() {return petImage;}
        public void setPetImage(String petImage) {this.petImage = petImage;}

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

