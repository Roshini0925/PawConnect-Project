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
			PreparedStatement ps=con.prepareStatement("insert into adoption_applications(pet_id, full_name, email, phone, address, message) values (?, ?, ?, ?, ?, ?)");
			  ps.setInt(1, adoption.getPetId());
	            ps.setString(2, adoption.getFullName());
	            ps.setString(3, adoption.getEmail());
	            ps.setLong(4, adoption.getPhone());
	            ps.setString(5, adoption.getAddress());
	            ps.setString(6, adoption.getMessage());
                return ps.executeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
