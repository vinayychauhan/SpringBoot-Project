package com.v.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.v.service.CategoryService;
import com.v.service.ProductService;

@Controller
public class UserHomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    // ✅ Home + Search
    @GetMapping("/user/home")
    public ModelAndView userHome(
            @RequestParam(value = "keyword",
                          required = false,
                          defaultValue = "") String keyword) {

        ModelAndView mv = new ModelAndView("userhome");

        List products;

        // ✅ If keyword entered → search
        // ✅ If no keyword → show all
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productService.searchProducts(keyword);
            mv.addObject("keyword", keyword);
            mv.addObject("searchResult",
                          products.size() + " result(s) for: "
                          + keyword);
        } else {
            products = productService.getAllProducts();
        }

        mv.addObject("products", products);
        mv.addObject("categories",
                      categoryService.getAllCategories());
        return mv;
    }
}