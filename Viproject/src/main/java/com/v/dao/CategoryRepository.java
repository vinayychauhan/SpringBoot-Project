package com.v.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.v.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    // Find category by name
    Category findByCategoryName(String categoryName);
}