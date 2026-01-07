package com.servlet.adoption.controller;

import com.servlet.adoption.dao.ProductDAO;
import com.servlet.adoption.dao.ProductDAOImpl;
import com.servlet.adoption.model.Product;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO dao = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Product> products = dao.getAllProducts();
        System.out.println("Products fetched: " + products.size());
        req.setAttribute("products", products);
        RequestDispatcher rd = req.getRequestDispatcher("delivery.jsp");
        rd.forward(req, res);
    }
}