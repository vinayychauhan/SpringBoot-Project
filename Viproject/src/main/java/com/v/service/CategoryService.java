package com.v.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.v.dao.CategoryRepository;
import com.v.model.Category;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepo;

    // Get all categories
    public List<Category> getAllCategories() {
        return categoryRepo.findAll();
    }

    // Get single category by ID
    public Category getCategoryById(int id) {
        return categoryRepo.findById(id).orElse(null);
    }

    // Save or Update category
    public void saveCategory(Category category) {
        categoryRepo.save(category);
    }

    // Delete category
    public void deleteCategory(int id) {
        categoryRepo.deleteById(id);
    }
}