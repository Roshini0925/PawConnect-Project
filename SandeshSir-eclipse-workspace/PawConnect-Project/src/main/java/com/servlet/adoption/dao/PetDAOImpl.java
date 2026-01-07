package com.servlet.adoption.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.servlet.adoption.model.Pets;
import com.servlet.adoption.util.DBConnection;

public class PetDAOImpl implements PetDAO {
	  @Override
	    public boolean addPet(Pets pet) {
	        boolean isSuccess = false;

	        String sql = "INSERT INTO pets (petname, species, breed, age, gender, location, imageUrl) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        try {
	            Connection con = DBConnection.getConnector();
	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, pet.getPetName());
	            ps.setString(2, pet.getSpecies());
	            ps.setString(3, pet.getBreed());
	            ps.setInt(4, pet.getAge());
	            ps.setString(5, pet.getGender());
	            ps.setString(6, pet.getLocation());
	            ps.setString(7, pet.getImageUrl());

	            int rows = ps.executeUpdate();

	            if (rows > 0) {
	                isSuccess = true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace(); 
	        }

	        return isSuccess;
	    }

    @Override
    public List<Pets> getAllPets() {

        List<Pets> list = new ArrayList<>();
        String sql = "SELECT * FROM pets";

        try (Connection conn = DBConnection.getConnector();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Pets p = new Pets();
                p.setPet_Id(rs.getInt("pet_id"));
                p.setPetName(rs.getString("petname"));
                p.setSpecies(rs.getString("species"));
                p.setBreed(rs.getString("breed"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setImageUrl(rs.getString("imageUrl"));
                p.setLocation(rs.getString("location"));

                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("Fetched pets count: " + list.size()); // 🔥 DEBUG
        return list;
    }


  
    @Override
    public Pets getPetById(int petId) {

        String sql = "SELECT * FROM pets WHERE pet_id=?";
        Pets pet = null;

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, petId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                pet = new Pets();
                pet.setPet_Id(rs.getInt("pet_id"));
                pet.setPetName(rs.getString("petname"));
                pet.setSpecies(rs.getString("species"));
                pet.setBreed(rs.getString("breed"));
                pet.setAge(rs.getInt("age"));
                pet.setGender(rs.getString("gender"));
                pet.setImageUrl(rs.getString("imageUrl"));
                pet.setLocation(rs.getString("location"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pet;
    }

    @Override
    public boolean updatePet(Pets pet) {

        String sql = "UPDATE pets SET petname=?, species=?, breed=?, age=?, gender=?, imageUrl=?, location=? "
                   + "WHERE pet_id=?";

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, pet.getPetName());
            ps.setString(2, pet.getSpecies());
            ps.setString(3, pet.getBreed());
            ps.setInt(4, pet.getAge());
            ps.setString(5, pet.getGender());
            ps.setString(6, pet.getImageUrl());
            ps.setString(7, pet.getLocation());
            ps.setInt(8, pet.getPet_Id());

            int rows = ps.executeUpdate();
            System.out.println("UPDATE ROWS: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deletePet(int petId) {

        String sql = "DELETE FROM pets WHERE pet_id=?";

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, petId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

}