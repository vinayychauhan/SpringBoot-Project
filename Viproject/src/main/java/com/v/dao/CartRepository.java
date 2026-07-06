package com.v.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.v.model.Cart;
import com.v.model.Product;
import com.v.model.User;

@Repository
public interface CartRepository 
                 extends JpaRepository<Cart, Integer> {

    List<Cart> findByUser(User user);
    void deleteByUser(User user);

    // ✅ Add this method
    void deleteByProduct(Product product);
}