package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.adoption.model.Adoption;
import com.servlet.adoption.util.DBConnection;

public class AdoptionDAOImpl implements AdoptionDAO {

	@Override
	public boolean saveAdoption(Adoption adoption) {
	    System.out.println("DAO METHOD CALLED");

	    try {
	        Connection con = DBConnection.getConnector();

	        if (con == null) {
	            System.out.println("DB CONNECTION IS NULL");
	            return false;
	        }

	        PreparedStatement ps = con.prepareStatement(
	            "insert into adoption_applications(pet_id, pet_name, full_name, email, phone, address, message) values (?,?,?,?,?,?,?)"
	        );

	        ps.setInt(1, adoption.getPetId());
	        ps.setString(2, adoption.getPetName());
	        ps.setString(3, adoption.getFullName());
	        ps.setString(4, adoption.getEmail());
	        ps.setLong(5, adoption.getPhone());
	        ps.setString(6, adoption.getAddress());
	        ps.setString(7, adoption.getMessage());

	        int rows = ps.executeUpdate();
	        System.out.println("ROWS INSERTED: " + rows);

	        return rows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	@Override
	public List<Adoption> getCertificatesByEmail(String email) {
	    List<Adoption> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnector();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM adoption_applications WHERE email=?"
	        );
	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Adoption a = new Adoption();
	            a.setPetName(rs.getString("pet_name"));
	            a.setFullName(rs.getString("full_name"));
	            a.setEmail(rs.getString("email"));
	            a.setPhone(rs.getLong("phone"));
	            list.add(a);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	@Override
	public List<Adoption> getAdoptionsByEmail(String email) {

	    List<Adoption> list = new ArrayList<>();

	    String sql = "SELECT pet_id, pet_name, full_name, email, pet_image " +
	                 "FROM adoption_applications WHERE email = ?";

	    try (Connection con = DBConnection.getConnector();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Adoption a = new Adoption();

	            a.setPetId(rs.getInt("pet_id"));
	            a.setPetName(rs.getString("pet_name"));
	            a.setFullName(rs.getString("full_name"));
	            a.setEmail(rs.getString("email"));
	            a.setPetImage(rs.getString("pet_image"));

	            list.add(a);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}