package com.servlet.adoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.servlet.adoption.model.ServiceBooking;
import com.servlet.adoption.util.DBConnection;

public class ServiceDAOImpl implements ServiceDAO {

	@Override
	public boolean saveBooking(ServiceBooking booking) {
      boolean success=false;
      String sql = "INSERT INTO service_booking (service_name, customer_name, customer_email, customer_phone) VALUES (?, ?, ?, ?)";

      try (Connection conn = DBConnection.getConnector();
           PreparedStatement ps = conn.prepareStatement(sql)) {

          ps.setString(1, booking.getServiceName());
          ps.setString(2, booking.getCustomerName());
          ps.setString(3, booking.getCustomerEmail());
          ps.setString(4, booking.getCustomerPhone());

          success = ps.executeUpdate() > 0;

      } catch (Exception e) {
          e.printStackTrace();
      }
      return success;
  }


}
