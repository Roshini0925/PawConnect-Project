package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.CartDAO;
import com.servlet.adoption.dao.CartDAOImpl;
import com.servlet.adoption.dto.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);
        String fullName = (session != null) ? (String) session.getAttribute("user") : null;

        if (fullName == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // defaults for redirect and messages
        String redirect = "cart.jsp";
        String message = null;

        try {
        	if (action.equals("add")) {
                String product = req.getParameter("product");
                String priceStr = req.getParameter("price");
                String qtyStr = req.getParameter("quantity");

                // Backend validation
                if (product == null || product.trim().isEmpty()) {
                    message = "Product name is required.";
                    resp.sendRedirect(redirect + "?error=" + encode(message));
                    return;
                }

                double price;
                int quantity;
                try {
                    price = Double.parseDouble(priceStr);
                    if (price <= 0) throw new NumberFormatException();
                } catch (NumberFormatException e) {
                    message = "Invalid price.";
                    resp.sendRedirect(redirect + "?error=" + encode(message));
                    return;
                }

                try {
                    quantity = Integer.parseInt(qtyStr);
                    if (quantity <= 0) throw new NumberFormatException();
                } catch (NumberFormatException e) {
                    message = "Quantity must be a positive integer.";
                    resp.sendRedirect(redirect + "?error=" + encode(message));
                    return;
                }

                // check if product already in cart for this user
                CartItem existing = cartDAO.findByUserAndProduct(fullName, product);
                if (existing != null) {
                    // merge: increase quantity and update
                    int newQty = existing.getQuantity() + quantity;
                    cartDAO.updateCartItemQuantity(existing.getId(), newQty);
                    message = "Updated quantity for " + product + " in your cart.";
                } else {
                    // create new cart item
                    CartItem item = new CartItem();
                    item.setFullName(fullName);
                    item.setProduct(product);
                    item.setPrice(price);
                    item.setQuantity(quantity);
                    cartDAO.addCartItem(item);
                    message = product + " added to cart.";
                }

                resp.sendRedirect(redirect + "?success=" + encode(message));
                return;

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));

                if (quantity <= 0) {
                    message = "Quantity must be at least 1.";
                    resp.sendRedirect(redirect + "?error=" + encode(message));
                    return;
                }

                cartDAO.updateCartItemQuantity(id, quantity);
                message = "Quantity updated.";
                resp.sendRedirect(redirect + "?success=" + encode(message));
                return;

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                cartDAO.removeCartItem(id);
                message = "Item removed.";
                resp.sendRedirect(redirect + "?success=" + encode(message));
                return;
            } else {
                resp.sendRedirect(redirect);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(redirect + "?error=Server+error");
        }
    }

    private String encode(String s) {
        try {
            return java.net.URLEncoder.encode(s, "UTF-8");
        } catch (Exception e) {
            return s;
        }
    }
}