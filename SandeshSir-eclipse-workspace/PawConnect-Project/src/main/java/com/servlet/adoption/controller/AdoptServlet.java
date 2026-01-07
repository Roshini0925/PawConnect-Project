package com.servlet.adoption.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Properties;

import com.servlet.adoption.dao.AdoptionDAO;
import com.servlet.adoption.dao.AdoptionDAOImpl;
import com.servlet.adoption.model.Adoption;
import com.servlet.adoption.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/AdoptServlet")
public class AdoptServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    // Your Gmail credentials
    private static final String FROM_EMAIL = "roshini0925@gmail.com";
    private static final String APP_PASSWORD = "kpea kcet zjav idwm"
    		+ "";
    
	private AdoptionDAO adoptionDAO = new AdoptionDAOImpl();

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

		 HttpSession session = req.getSession();
		 try {
	            int petId = Integer.parseInt(req.getParameter("petId"));
	            String petName = req.getParameter("petName");
	            String fullName = req.getParameter("fullName");
	            String email = req.getParameter("email");
	            long phone = Long.parseLong(req.getParameter("phone"));
	            String address = req.getParameter("address");
	            String message = req.getParameter("message");
	            
	            Adoption adoption = new Adoption();
	            adoption.setPetId(petId);
	            adoption.setPetName(petName);
	            adoption.setFullName(fullName);
	            adoption.setEmail(email);
	            adoption.setPhone(phone);
	            adoption.setAddress(address);
	            adoption.setMessage(message);
	            
	            boolean saved = adoptionDAO.saveAdoption(adoption);

	            System.out.println("SAVE RESULT: " + saved);

	            if (saved) {
	                req.getSession().setAttribute("petName", petName);
	                req.getSession().setAttribute("fullName", fullName);
	                req.getSession().setAttribute("email", email);
	                req.getSession().setAttribute("phone", phone);
	                req.getSession().setAttribute("address", address);
	                req.getSession().setAttribute("message", message);

	                res.sendRedirect("adoption-success.jsp?request=sent");
	            } else {
	            	res.sendRedirect("pets.jsp?error=notSaved");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            res.sendRedirect("pets.jsp?error=exception");
	        }

	    String petName = req.getParameter("petName");
	    String fullName = req.getParameter("fullName");
	    String email = req.getParameter("email");
	    String phone = req.getParameter("phone");
	    String address = req.getParameter("address");
	    String message = req.getParameter("message");

	    try {
	        Connection con = DBConnection.getConnector();
	        String sql = "INSERT INTO adoptions (pet_name, full_name, email, phone, address, message) VALUES (?, ?, ?, ?, ?, ?)";
	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, petName);
	        ps.setString(2, fullName);
	        ps.setString(3, email);
	        ps.setString(4, phone);
	        ps.setString(5, address);
	        ps.setString(6, message);

	        ps.executeUpdate();
	        sendConfirmationEmail(email, fullName, petName);
	        // store email in session for My-Adoptions
	        req.getSession().setAttribute("email", email);

	        res.sendRedirect("My-adoptions.jsp");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	private void sendConfirmationEmail(String toemail, String fullName, String petName) {
		Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
                    }
                });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toemail));
            message.setSubject("🐾 Adoption Request Submitted – PawConnect");

            message.setText(
            		"Hello " + fullName + ",\n\n" +
                            "You have been successfully adopted \"" + petName + "\" " +
                            "Please Download Your Adoption Certificate .\n\n" +
                            "Thank you for choosing PawConnect 🐶🐱\n\n" +
                            "Regards,\n PawConnect Team"
                        );

                        Transport.send(message);
                        System.out.println("User confirmation email sent");

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
	}