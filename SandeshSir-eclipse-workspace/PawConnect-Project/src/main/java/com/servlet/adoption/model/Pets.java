package com.servlet.adoption.model;

public class Pets {
    private int id;
    private String name;
    private String species;
    private String breed;
    private int age;
    private String gender;
    private String imageUrl;

 
    public Pets(int id, String name, String species, String breed, int age) {
    	
        this.id = id;
        this.name = name;
        this.species = species;
        this.breed = breed;
        this.age = age;
        this.gender = gender;
        this.imageUrl = imageUrl;
    }
    
    public Pets() {
		// TODO Auto-generated constructor stub
	}

	// Getters & Setters
    public int getId() { 
    	return id; 
    }
    public void setId(int id) { 
    	this.id = id; 
    	}

    public String getName() {
    	return name; 
    	}
    public void setName(String name) { 
    	this.name = name; 
    	}

    public String getSpecies() { 
    	return species; 
    	}
    public void setSpecies(String species) { 
    	this.species = species; 
    	}

    public String getBreed() {
    	return breed; 
    	}
    public void setBreed(String breed) {
    	this.breed = breed; 
    	}

    public int getAge() { 
    	return age; 
    	}
    public void setAge(int age) { 
    	this.age = age; 
    	}

    public String getGender() { 
    	return gender;
    	}
    public void setGender(String gender) { 
    	this.gender = gender; 
    	}

    public String getImageUrl() { 
    	return imageUrl; 
    	}
    public void setImageUrl(String imageUrl) { 
    	this.imageUrl = imageUrl; 
    	}
}
