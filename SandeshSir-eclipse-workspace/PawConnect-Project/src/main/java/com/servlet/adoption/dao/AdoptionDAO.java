package com.servlet.adoption.dao;

import java.util.List;

import com.servlet.adoption.model.Adoption;

public interface AdoptionDAO {
		boolean saveAdoption(Adoption adoption);
		List<Adoption> getCertificatesByEmail(String email);
		List<Adoption> getAdoptionsByEmail(String email);

}