package com.v.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.v.dao.CartRepository;
import com.v.model.Cart;
import com.v.model.User;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepo;

    // Add item to cart
    public void addToCart(Cart cart) {
        cartRepo.save(cart);
    }

    // Get all cart items for user
    public List<Cart> getCartByUser(User user) {
        return cartRepo.findByUser(user);
    }

    // Remove single item
    public void removeFromCart(int cartId) {
        cartRepo.deleteById(cartId);
    }

    // Clear entire cart
    public void clearCart(User user) {
        cartRepo.deleteByUser(user);
    }

    // Get total price
    public double getCartTotal(List<Cart> cartItems) {
        double total = 0;
        for (Cart item : cartItems) {
            total += item.getProduct().getPrice()
                     * item.getQuantity();
        }
        return total;
    }
}