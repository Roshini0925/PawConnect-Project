package com.servlet.adoption.dao;

import java.util.List;

import com.servlet.adoption.dto.CartItem;
import com.servlet.adoption.model.AddCart;

public interface CartDAO {
    boolean addCartItem(CartItem item);
    boolean updateCartItemQuantity(int id, int quantity);
    boolean removeCartItem(int id);
    List<CartItem> getCartItems(String fullName);

    int getCartItemCount(String fullName);
    CartItem findByUserAndProduct(String fullName, String product); // returns existing item if any
}

