package com.servlet.adoption.dao;

import java.util.List;

import com.servlet.adoption.dto.User;

	public interface UserDAO {
	    boolean registerUser(User user);
	    boolean emailExists(String email);
	    User loginUser(String email, String hashedPassword);
	    List<User> getAllUsers();
		}
	

	
