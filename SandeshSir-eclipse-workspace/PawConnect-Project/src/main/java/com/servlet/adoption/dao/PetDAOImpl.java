package com.servlet.adoption.dao;
	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;
    import com.servlet.adoption.model.Pets;
    import com.servlet.adoption.util.DBConnection;
    
	public class PetDAOImpl implements PetDAO {

	@Override
	public List getAllPets() {
		
		 List<Pets> petList = new ArrayList<>();
	        String sql = "SELECT * FROM pets";

	        try (Connection conn = DBConnection.getConnector();
	             PreparedStatement pstmt = conn.prepareStatement(sql);
	             ResultSet rs = pstmt.executeQuery()) {

	            while (rs.next()) {
	                Pets pet = new Pets();
	                pet.setId(rs.getInt("id"));
	                pet.setName(rs.getString("name"));
	                pet.setSpecies(rs.getString("species"));
	                pet.setBreed(rs.getString("breed"));
	                pet.setAge(rs.getInt("age"));
	                pet.setGender(rs.getString("gender"));
	                pet.setImageUrl(rs.getString("image_url"));
	                petList.add(pet);
	            }
	            } catch (SQLException e) {
	            	e.printStackTrace();
	            }
	
		return petList;
	}

	@Override
	public boolean addPet(Pets pet) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO pets (name, species, breed, age, gender,image_url) VALUES (?, ?, ?, ?, ?, ?)";
		Connection con=DBConnection.getConnector();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, pet.getName());
			ps.setString(2, pet.getSpecies());
			ps.setString(3, pet.getBreed());
			ps.setInt(4, pet.getAge());
			ps.setString(5, pet.getGender());
			ps.setString(6, pet.getImageUrl());
			
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Pets getPetById(int petId) {
		String sql="SELECT * FROM pets WHERE id=?";
		Connection con=DBConnection.getConnector();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, petId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Pets pet=new Pets();
				pet.setId(rs.getInt("id"));
				pet.setName(rs.getString("name"));
				pet.setSpecies(rs.getString("species"));
				pet.setBreed(rs.getString("breed"));
				pet.setAge(rs.getInt("age"));
				pet.setGender(rs.getString("gender"));
				pet.setImageUrl(rs.getString("image_url"));
             	return pet;
			} 
		}
			catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean updatePet(Pets pet) {
		String sql="UPDATE pets SET name=?, species=?,breed=?, age=?,gender=?, image_url=? WHERE id=?";
		Connection con=DBConnection.getConnector();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, pet.getName());
			ps.setString(2, pet.getSpecies());
			ps.setString(3, pet.getBreed());
			ps.setInt(4, pet.getAge());
			ps.setString(5, pet.getGender());
			ps.setString(6, pet.getImageUrl());
			ps.setInt(7, pet.getId());
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public boolean deletePet(int petId) {
		String sql="DELETE FROM pets WHERE id=?";
		Connection con=DBConnection.getConnector();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, petId);
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}