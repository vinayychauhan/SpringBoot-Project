package com.v.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.v.model.Product;
import com.v.service.CategoryService;
import com.v.service.ProductService;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    // ✅ Root URL → redirect to publichome
    @GetMapping("/")
    @ResponseBody
    public String home() {
        return "<script>window.location='/publichome'</script>";
    }

    // ✅ Login Page
    @GetMapping("/login")
    @ResponseBody
    public String login() {
        return "<!DOCTYPE html><html><head><meta charset='UTF-8'><title>Login</title>"
            + "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'/>"
            + "<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'/>"
            + "<style>"
            + "body{background:linear-gradient(135deg,#1a1a2e,#16213e);min-height:100vh;display:flex;align-items:center;justify-content:center;}"
            + ".box{background:white;border-radius:15px;padding:40px;width:420px;box-shadow:0 10px 40px rgba(0,0,0,0.3);}"
            + ".hdr{background:linear-gradient(135deg,#4CAF50,#2e7d32);border-radius:12px;padding:20px;text-align:center;margin-bottom:25px;}"
            + ".btn-go{background:linear-gradient(135deg,#4CAF50,#2e7d32);color:white;border:none;padding:12px;border-radius:8px;width:100%;font-size:16px;cursor:pointer;}"
            + ".btn-go:hover{background:#2e7d32;}"
            + "</style></head>"
            + "<body><div class='box'>"
            + "<div class='hdr'>"
            + "<h3 class='text-white mb-0'><i class='bi bi-shop'></i> EcomSpring</h3>"
            + "<p class='text-white-50 mb-0 mt-1'>Login to continue</p>"
            + "</div>"
            + "<form action='/doLogin' method='post'>"
            + "<div class='mb-3'>"
            + "<label class='form-label fw-bold'><i class='bi bi-person'></i> Username</label>"
            + "<input type='text' name='username' class='form-control form-control-lg' placeholder='Enter username' required/>"
            + "</div>"
            + "<div class='mb-4'>"
            + "<label class='form-label fw-bold'><i class='bi bi-lock'></i> Password</label>"
            + "<input type='password' name='password' class='form-control form-control-lg' placeholder='Enter password' required/>"
            + "</div>"
            + "<button type='submit' class='btn-go'>"
            + "<i class='bi bi-box-arrow-in-right'></i> Login"
            + "</button>"
            + "</form>"
            + "<hr/>"
            + "<div class='text-center'>"
            + "<a href='/publichome' class='text-muted me-3'>"
            + "<i class='bi bi-arrow-left'></i> Back to Shop"
            + "</a>"
            + "<a href='/register' class='text-success fw-bold'>"
            + "<i class='bi bi-person-plus'></i> Register"
            + "</a>"
            + "</div>"
            + "</div>"
            + "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>"
            + "</body></html>";
    }

    // ✅ Public Home Page - No Login Required
    @GetMapping("/publichome")
    @ResponseBody
    public String publicHome(
            @RequestParam(value = "keyword",
                          required = false,
                          defaultValue = "") String keyword) {

        // Get products
        List<Product> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productService.searchProducts(keyword);
        } else {
            products = productService.getAllProducts();
        }

        // Build product cards
        StringBuilder cards = new StringBuilder();
        for (Product p : products) {

            // Image
            String img = (p.getImageName() != null
                          && !p.getImageName().isEmpty())
                ? "<img src='/images/products/" + p.getImageName()
                  + "' style='width:100%;height:200px;object-fit:cover;' alt='"
                  + p.getProductName() + "'/>"
                : "<div style='height:200px;display:flex;align-items:center;"
                  + "justify-content:center;background:#f8f9fa;'>"
                  + "<i class='bi bi-box-seam text-success' style='font-size:4rem;'></i></div>";

            // Category name
            String catName = (p.getCategory() != null)
                ? p.getCategory().getCategoryName() : "";

            // Description
            String desc = (p.getDescription() != null)
                ? p.getDescription() : "";

            // Card
            cards.append(
                "<div class='col-md-3'>"
                + "<div class='card h-100' style='border:none;border-radius:15px;"
                + "overflow:hidden;box-shadow:0 2px 15px rgba(0,0,0,0.08);"
                + "transition:transform 0.3s;'>"
                + img
                + "<div class='card-body'>"
                + "<h5 class='fw-bold mb-1'>" + p.getProductName() + "</h5>"
                + "<p class='text-muted small mb-2'>" + desc + "</p>"
                + "<span style='background:#e3f2fd;color:#1565c0;padding:3px 10px;"
                + "border-radius:10px;font-size:12px;'>"
                + "<i class='bi bi-tag'></i> " + catName + "</span>"
                + "<div class='mt-2'>"
                + "<span style='background:linear-gradient(135deg,#4CAF50,#2e7d32);"
                + "color:white;padding:5px 15px;border-radius:20px;font-weight:bold;'>"
                + "&#8377;" + p.getPrice() + "</span>"
                + "</div>"
                + "<p class='text-muted small mt-2 mb-0'>"
                + "<i class='bi bi-boxes'></i> Stock: " + p.getQuantity() + "</p>"
                + "</div>"
                + "<div class='card-footer bg-white border-0 pb-3 px-3'>"
                + "<a href='/login' style='background:linear-gradient(135deg,#FF9800,#e65100);"
                + "color:white;border:none;border-radius:8px;padding:10px;"
                + "text-decoration:none;display:block;text-align:center;font-size:15px;'>"
                + "<i class='bi bi-lock'></i> Login to Buy"
                + "</a>"
                + "</div>"
                + "</div></div>"
            );
        }

        // Search result text
        String searchResultText = (!keyword.isEmpty())
            ? "<span class='badge bg-warning text-dark fs-6 p-2'>"
              + "<i class='bi bi-search'></i> "
              + products.size() + " result(s) for: " + keyword
              + "</span>"
            : "";

        // No results
        String noResults = "";
        if (!keyword.isEmpty() && products.isEmpty()) {
            noResults = "<div class='col-12 text-center py-5'>"
                + "<i class='bi bi-search text-muted' style='font-size:4rem;'></i>"
                + "<h4 class='text-muted mt-3'>No results for <strong>"
                + keyword + "</strong></h4>"
                + "<a href='/publichome' class='btn btn-success mt-2'>"
                + "<i class='bi bi-arrow-left'></i> View All</a>"
                + "</div>";
        }

        return "<!DOCTYPE html><html><head>"
            + "<meta charset='UTF-8'>"
            + "<title>EcomSpring Shop</title>"
            + "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'/>"
            + "<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'/>"
            + "<style>"
            + "body{background:#f8f9fa;}"
            + ".tnav{background:linear-gradient(135deg,#1a1a2e,#16213e);"
            + "position:sticky;top:0;z-index:9999;"
            + "box-shadow:0 2px 15px rgba(0,0,0,0.3);}"
            + ".hero{background:linear-gradient(135deg,#1a1a2e,#16213e);"
            + "color:white;padding:60px 0;margin-bottom:40px;}"
            + ".card:hover{transform:translateY(-5px);}"
            + ".gbar{background:linear-gradient(135deg,#FF9800,#e65100);"
            + "color:white;padding:12px;text-align:center;font-size:15px;}"
            + "</style></head>"
            + "<body>"

            // ✅ Guest Banner
            + "<div class='gbar'>"
            + "<i class='bi bi-info-circle-fill'></i>"
            + " <strong>Welcome Guest!</strong>"
            + " &nbsp; Login required to add products to cart. &nbsp;"
            + "<a href='/login' class='btn btn-light btn-sm fw-bold ms-2'>"
            + "<i class='bi bi-box-arrow-in-right'></i> Login Now</a>"
            + "<a href='/register' class='btn btn-outline-light btn-sm ms-1'>"
            + "<i class='bi bi-person-plus'></i> Register Free</a>"
            + "</div>"

            // ✅ Sticky Navbar
            + "<nav class='navbar navbar-expand-lg navbar-dark tnav'>"
            + "<div class='container'>"
            + "<a class='navbar-brand fw-bold fs-4' href='/publichome'>"
            + "<i class='bi bi-shop text-success'></i> EcomSpring</a>"
            + "<button class='navbar-toggler' type='button'"
            + " data-bs-toggle='collapse' data-bs-target='#nav1'>"
            + "<span class='navbar-toggler-icon'></span></button>"
            + "<div class='collapse navbar-collapse' id='nav1'>"
            + "<ul class='navbar-nav ms-auto align-items-center'>"
            + "<li class='nav-item'>"
            + "<a class='nav-link active' href='/publichome'>"
            + "<i class='bi bi-house'></i> Home</a></li>"
            + "<li class='nav-item ms-2'>"
            + "<a class='btn btn-success btn-sm' href='/login'>"
            + "<i class='bi bi-box-arrow-in-right'></i> Login</a></li>"
            + "<li class='nav-item ms-1'>"
            + "<a class='btn btn-outline-light btn-sm' href='/register'>"
            + "<i class='bi bi-person-plus'></i> Register</a></li>"
            + "</ul></div></div></nav>"

            // ✅ Hero Section
            + "<div class='hero text-center'><div class='container'>"
            + "<h1 class='fw-bold display-5 mb-2'>"
            + "<i class='bi bi-bag-heart'></i> Welcome to EcomSpring!</h1>"
            + "<p class='text-white-50 mb-4'>"
            + "Discover our amazing collection of products</p>"

            // Search Bar
            + "<div class='mx-auto' style='max-width:520px;'>"
            + "<form action='/publichome' method='get'>"
            + "<div class='input-group'>"
            + "<input type='text' name='keyword' value='" + keyword + "'"
            + " class='form-control'"
            + " style='border-radius:30px 0 0 30px;border:none;padding:12px 20px;'"
            + " placeholder='&#128269; Search products by name...'/>"
            + "<button type='submit' class='btn'"
            + " style='border-radius:0 30px 30px 0;background:#4CAF50;"
            + "color:white;padding:12px 25px;border:none;'>"
            + "<i class='bi bi-search'></i> Search</button>"
            + "</div></form>"
            + (!keyword.isEmpty()
                ? "<a href='/publichome' class='btn btn-outline-light btn-sm mt-2'>"
                  + "<i class='bi bi-x-circle'></i> Clear</a>"
                : "")
            + "</div>"

            // Hero Buttons
            + "<div class='mt-4'>"
            + "<a href='/login' class='btn btn-warning btn-lg px-4 fw-bold me-2'>"
            + "<i class='bi bi-box-arrow-in-right'></i> Login to Shop</a>"
            + "<a href='/register' class='btn btn-outline-light btn-lg px-4'>"
            + "<i class='bi bi-person-plus'></i> Register Free</a>"
            + "</div></div></div>"

            // ✅ Products Section
            + "<div class='container mb-5'>"
            + "<div class='d-flex justify-content-between align-items-center mb-4'>"
            + "<h3 class='fw-bold mb-0'>"
            + "<i class='bi bi-box-seam text-success'></i> "
            + (!keyword.isEmpty() ? "Search Results" : "Our Products")
            + "</h3>"
            + searchResultText
            + "</div>"
            + "<div class='row g-4'>"
            + noResults
            + cards
            + (products.isEmpty() && keyword.isEmpty()
                ? "<div class='col-12 text-center py-5 text-muted'>"
                  + "<i class='bi bi-inbox fs-1 d-block mb-3'></i>"
                  + "<h5>No products available!</h5></div>"
                : "")
            + "</div></div>"

            // ✅ Footer
            + "<footer style='background:#1a1a2e;padding:20px 0;'>"
            + "<p class='text-center text-white-50 mb-0'>"
            + "&#169; 2026 EcomSpring. All rights reserved.</p>"
            + "</footer>"
            + "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>"
            + "</body></html>";
    }
}