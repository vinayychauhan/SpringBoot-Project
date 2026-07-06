package com.v.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.v.model.Category;
import com.v.model.Product;

@Repository
public interface ProductRepository 
                 extends JpaRepository<Product, Integer> {

    List<Product> findByCategory(Category category);

    // ✅ Search by product name (case insensitive)
    List<Product> findByProductNameContainingIgnoreCase(
                                            String keyword);
}