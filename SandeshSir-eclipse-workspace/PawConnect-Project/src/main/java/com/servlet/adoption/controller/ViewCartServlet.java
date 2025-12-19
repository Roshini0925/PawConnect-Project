package com.servlet.adoption.controller;

import java.io.IOException;
import java.util.List;
import com.servlet.adoption.dao.CartDAO;
import com.servlet.adoption.dao.CartDAOImpl;
import com.servlet.adoption.dto.CartItem;
import com.servlet.adoption.model.AddCart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewCart")
	public class ViewCartServlet extends HttpServlet {
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	    	String fullname = (String) req.getSession().getAttribute("fullname");
	        if (fullname == null) {
	            resp.sendRedirect("login.jsp");
	            return;
	        }

	        CartDAO dao = new CartDAOImpl();
	        List<CartItem> cartList = dao.getCartItems(fullname);
	        req.setAttribute("cartList", cartList);
	        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
	        rd.forward(req, resp);
	    }
	    
	}


