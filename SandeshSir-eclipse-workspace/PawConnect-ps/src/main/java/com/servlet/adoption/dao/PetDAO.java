package com.servlet.adoption.dao;

import java.util.List;

import com.servlet.adoption.model.Pets;

public interface PetDAO {
boolean addPet(Pets pets);
	List<Pets>getAllPets();
	Pets getPetById(int petId);
	boolean updatePet(Pets pet);
	boolean deletePet(int petId);
	    
	}


