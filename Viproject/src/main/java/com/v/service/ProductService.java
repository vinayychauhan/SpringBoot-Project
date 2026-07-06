package com.v.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.v.dao.CartRepository;
import com.v.dao.ProductRepository;
import com.v.model.Product;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private CartRepository cartRepo;

    public List<Product> getAllProducts() {
        return productRepo.findAll();
    }

    public Product getProductById(int id) {
        return productRepo.findById(id).orElse(null);
    }

    public void saveProduct(Product product) {
        productRepo.save(product);
    }

    // ✅ Delete cart items first then delete product
    @Transactional
    public void deleteProduct(int id) {
        Product product = productRepo.findById(id).orElse(null);
        if (product != null) {
            // ✅ Delete all cart items for this product first
            cartRepo.deleteByProduct(product);
            // ✅ Then delete the product
            productRepo.deleteById(id);
        }
    }

    public List<Product> searchProducts(String keyword) {
        return productRepo
               .findByProductNameContainingIgnoreCase(keyword);
    }
}