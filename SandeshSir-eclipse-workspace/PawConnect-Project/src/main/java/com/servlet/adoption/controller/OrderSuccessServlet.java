package com.servlet.adoption.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/orderSuccess")
public class OrderSuccessServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        String orderId = request.getParameter("orderId");
        String amount = request.getParameter("amount");
        System.out.println("OrderId: " + orderId);
        System.out.println("Amount: " + amount);

        if (email != null ) {
            sendMail(email, orderId, amount);
        }

        request.setAttribute("orderId", orderId);
        request.setAttribute("amount", amount);

        request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
    }

    private void sendMail(String to, String orderId, String amount) {

        final String from = "nikhithaks2004@gmail.com";
        final String password = "jygj tzfh lchm jyov"; // NOT gmail password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, password);
                }
            });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from, "PawConnect 🐾"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject("Order Confirmed - PawConnect 🐾");

            String body =
                "Hi,\n\n" +
                "Your order has been placed successfully!\n\n" +
                "Order ID: " + orderId + "\n" +
                "Total Amount: ₹" + amount + "\n\n" +
                "Thank you for shopping with PawConnect 🐾\n\n" +
                "Regards,\nPawConnect Team";

            msg.setText(body);

            Transport.send(msg);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}