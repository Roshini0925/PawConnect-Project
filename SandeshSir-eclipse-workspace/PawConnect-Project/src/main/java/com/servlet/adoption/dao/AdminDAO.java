package com.servlet.adoption.dao;

import com.servlet.adoption.dto.Admin;

public interface AdminDAO {
	boolean registerAdmin(Admin admin);
	boolean loginAdmin(String email,String hashedpassword);
	boolean emailExists(String email);
	
}