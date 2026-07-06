package com.v.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.v.model.Cart;
import com.v.model.Product;
import com.v.model.User;
import com.v.service.CartService;
import com.v.service.ProductService;
import com.v.service.UserService;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    // ✅ Add to Cart
    @GetMapping("/user/addtocart/{productId}")
    public String addToCart(
            @PathVariable int productId,
            Authentication authentication) {

        // Get logged in user
        String username = authentication.getName();
        User user = userService.getUserByUsername(username);

        // Get product
        Product product = productService.getProductById(productId);

        // Create cart item
        Cart cart = new Cart();
        cart.setProduct(product);
        cart.setUser(user);
        cart.setQuantity(1);

        cartService.addToCart(cart);

        return "redirect:/user/cart";
    }

    // ✅ View Cart
    @GetMapping("/user/cart")
    public ModelAndView viewCart(Authentication authentication) {
        ModelAndView mv = new ModelAndView("usercart");

        String username = authentication.getName();
        User user = userService.getUserByUsername(username);

        List<Cart> cartItems = cartService.getCartByUser(user);
        double total = cartService.getCartTotal(cartItems);

        mv.addObject("cartItems", cartItems);
        mv.addObject("total", total);
        return mv;
    }

    // ✅ Remove from Cart
    @GetMapping("/user/removecart/{cartId}")
    public String removeFromCart(@PathVariable int cartId) {
        cartService.removeFromCart(cartId);
        return "redirect:/user/cart";
    }

    // ✅ Clear Cart
    @GetMapping("/user/clearcart")
    public String clearCart(Authentication authentication) {
        String username = authentication.getName();
        User user = userService.getUserByUsername(username);
        cartService.clearCart(user);
        return "redirect:/user/cart";
    }
}