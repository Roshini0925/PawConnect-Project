package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.servlet.adoption.model.Adoption;
import com.servlet.adoption.util.DBConnection;

public class AdoptionDAOImpl implements AdoptionDAO {

	@Override
	public boolean saveAdoption(Adoption adoption) {
		try {
			Connection con=DBConnection.getConnector();
			PreparedStatement ps=con.prepareStatement("insert into adoption_applications(full_name, email, phone, address, message) values (?, ?, ?, ?, ?, ?)");
	            ps.setString(1, adoption.getFullName());
	            ps.setString(2, adoption.getEmail());
	            ps.setLong(3, adoption.getPhone());
	            ps.setString(4, adoption.getAddress());
	            ps.setString(5, adoption.getMessage());
                return ps.executeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
