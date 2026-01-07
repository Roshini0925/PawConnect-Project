package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.DeliveryDAO;
import com.servlet.adoption.dao.DeliveryDAOImpl;
import com.servlet.adoption.model.AddCart;
import com.servlet.adoption.model.Delivery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delivery")
public class DeliveryServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null) {
            resp.sendRedirect("error.jsp");
            return;
        }

        switch (action) {
            case "placeOrder":
                placeOrder(req, resp);
                break;

            case "updateStatus":
                updateStatus(req, resp);
                break;

            case "addToCart":
                addToCart(req, resp);
                break;

            default:
                resp.sendRedirect("error.jsp");
        }
    }

    // PLACE ORDER
    private void placeOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Delivery order = new Delivery(
                req.getParameter("fullName"),
                Long.parseLong(req.getParameter("phone")),
                req.getParameter("email"),
                req.getParameter("address"),
                req.getParameter("product"),
                Integer.parseInt(req.getParameter("quantity"))
        );

        DeliveryDAO dao = new DeliveryDAOImpl();

        if (dao.placeOrder(order)) {
            resp.sendRedirect("delivery.jsp?order=success");
        }else {
            resp.sendRedirect("delivery.jsp?order=fail");
    }
    }
    
    private void updateStatus(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("orderId"));
        String status = req.getParameter("status");

        DeliveryDAO dao = new DeliveryDAOImpl();

        if (dao.updateStatus(id, status)) {
            resp.sendRedirect("deliver.jsp?status=success");
        } else {
               resp.sendRedirect("delivery.jsp?status=fail");
    }
    }

    // ADD TO CART
    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        AddCart cart = new AddCart(
                req.getParameter("fullName"),
                req.getParameter("product"),
                Double.parseDouble(req.getParameter("price")),
                Integer.parseInt(req.getParameter("quantity"))
        );

        //AddCartDAO dao = new AddCartDAOImpl();

        //if (dao.addToCart(cart))
            resp.sendRedirect("delivery.jsp?added=success");
        //else
            resp.sendRedirect("delivery.jsp?added=fail");
    }
}