package com.v.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.v.model.Category;
import com.v.model.Product;
import com.v.model.User;
import com.v.service.CategoryService;
import com.v.service.ProductService;
import com.v.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    @Value("${product.image.upload.dir}")
    private String uploadDir;

    // ========== DASHBOARD ==========
    @GetMapping("/Dashboard")
    public ModelAndView dashboard() {
        ModelAndView mv = new ModelAndView("admindashboard");
        mv.addObject("totalProducts",
                      productService.getAllProducts().size());
        mv.addObject("totalCategories",
                      categoryService.getAllCategories().size());
        mv.addObject("totalUsers",
                      userService.getAllUsers().size());
        return mv;
    }

    // ========== PRODUCTS ==========
    @GetMapping("/products")
    public ModelAndView products() {
        ModelAndView mv = new ModelAndView("adminproducts");
        mv.addObject("products", productService.getAllProducts());
        return mv;
    }

    @GetMapping("/addproduct")
    public ModelAndView addProductForm() {
        ModelAndView mv = new ModelAndView("addproduct");
        mv.addObject("product", new Product());
        mv.addObject("categories",
                      categoryService.getAllCategories());
        return mv;
    }

    // ✅ Save product with image upload
    @PostMapping("/saveproduct")
    public String saveProduct(
            @ModelAttribute Product product,
            @RequestParam("imageFile") MultipartFile imageFile) {

        try {
            // ✅ If new image uploaded
            if (!imageFile.isEmpty()) {

                // Create upload directory if not exists
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Save file with original name
                String fileName = imageFile.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                Files.write(filePath, imageFile.getBytes());

                // Set image name in product
                product.setImageName(fileName);

            } else {
                // ✅ Keep existing image if no new image uploaded
                if (product.getProductId() != 0) {
                    Product existingProduct = productService
                            .getProductById(product.getProductId());
                    product.setImageName(
                            existingProduct.getImageName());
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        productService.saveProduct(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/editproduct/{id}")
    public ModelAndView editProduct(@PathVariable int id) {
        ModelAndView mv = new ModelAndView("addproduct");
        mv.addObject("product",
                      productService.getProductById(id));
        mv.addObject("categories",
                      categoryService.getAllCategories());
        return mv;
    }

    @GetMapping("/deleteproduct/{id}")
    public String deleteProduct(@PathVariable int id) {
        productService.deleteProduct(id);
        return "redirect:/admin/products";
    }

    // ========== CATEGORIES ==========
    @GetMapping("/categories")
    public ModelAndView categories() {
        ModelAndView mv = new ModelAndView("admincategories");
        mv.addObject("categories",
                      categoryService.getAllCategories());
        return mv;
    }

    @GetMapping("/addcategory")
    public ModelAndView addCategoryForm() {
        ModelAndView mv = new ModelAndView("addcategory");
        mv.addObject("category", new Category());
        return mv;
    }

    @PostMapping("/savecategory")
    public String saveCategory(
            @ModelAttribute Category category) {
        categoryService.saveCategory(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/editcategory/{id}")
    public ModelAndView editCategory(@PathVariable int id) {
        ModelAndView mv = new ModelAndView("addcategory");
        mv.addObject("category",
                      categoryService.getCategoryById(id));
        return mv;
    }

    @GetMapping("/deletecategory/{id}")
    public String deleteCategory(@PathVariable int id) {
        categoryService.deleteCategory(id);
        return "redirect:/admin/categories";
    }

    // ========== CUSTOMERS ==========
    @GetMapping("/customers")
    public ModelAndView customers() {
        ModelAndView mv = new ModelAndView("admincustomers");
        List<User> users = userService.getAllUsers();
        mv.addObject("users", users);
        return mv;
    }

    @GetMapping("/deleteuser/{id}")
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/admin/customers";
    }
}