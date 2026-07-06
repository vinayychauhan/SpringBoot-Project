<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EcomSpring - Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        body { background: #f8f9fa; }

        /* ✅ Sticky Navbar */
        .navbar {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            position: sticky;
            top: 0;
            z-index: 9999;
            box-shadow: 0 2px 15px rgba(0,0,0,0.3);
        }

        .hero {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        /* ✅ Search Bar */
        .search-box {
            max-width: 550px;
            margin: 0 auto;
        }

        .search-box .form-control {
            border-radius: 30px 0 0 30px;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
        }

        .search-box .form-control:focus {
            box-shadow: none;
            border: none;
        }

        .search-box .btn-search {
            border-radius: 0 30px 30px 0;
            background: #4CAF50;
            border: none;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
        }

        .search-box .btn-search:hover {
            background: #2e7d32;
            color: white;
        }

        .product-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .product-img-box {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .product-img-box img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .product-card:hover .product-img-box img {
            transform: scale(1.05);
        }

        .no-image-box {
            width: 100%;
            height: 200px;
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .price-badge {
            background: linear-gradient(135deg, #4CAF50, #2e7d32);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 15px;
        }

        .btn-cart {
            background: linear-gradient(135deg, #4CAF50, #2e7d32);
            border: none;
            color: white;
            border-radius: 8px;
            padding: 10px;
            font-size: 15px;
            transition: all 0.2s;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .btn-cart:hover {
            background: linear-gradient(135deg, #2e7d32, #1b5e20);
            color: white;
            transform: scale(1.02);
        }

        .category-badge {
            background: #e3f2fd;
            color: #1565c0;
            padding: 3px 10px;
            border-radius: 10px;
            font-size: 12px;
        }

        .search-result-badge {
            background: #fff3cd;
            border: 1px solid #ffc107;
            color: #856404;
            padding: 8px 18px;
            border-radius: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- ✅ Sticky Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container">

        <!-- Brand -->
        <a class="navbar-brand fw-bold fs-4" href="/user/home">
            <i class="bi bi-shop text-success"></i> EcomSpring
        </a>

        <!-- Toggle for mobile -->
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">

                <li class="nav-item">
                    <a class="nav-link active" href="/user/home">
                        <i class="bi bi-house"></i> Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/user/cart">
                        <i class="bi bi-cart3"></i> Cart
                    </a>
                </li>

                <li class="nav-item ms-2">
                    <a class="btn btn-outline-danger btn-sm"
                       href="/logout">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ✅ Hero Section with Search -->
<div class="hero text-center">
    <div class="container">
        <h1 class="fw-bold display-5 mb-2">
            <i class="bi bi-bag-heart"></i> Welcome to EcomSpring!
        </h1>
        <p class="lead text-white-50 mb-4">
            Discover our amazing collection of products
        </p>

        <!-- ✅ Search Bar -->
        <div class="search-box">
            <form action="/user/home" method="get">
                <div class="input-group">
                    <input type="text"
                           name="keyword"
                           value="${keyword}"
                           class="form-control"
                           placeholder="🔍 Search products by name..."
                           autocomplete="off"/>
                    <button type="submit" class="btn-search">
                        <i class="bi bi-search"></i> Search
                    </button>
                </div>
            </form>

            <!-- Clear Search -->
            <c:if test="${keyword != null && keyword != ''}">
                <a href="/user/home"
                   class="btn btn-outline-light btn-sm mt-2">
                    <i class="bi bi-x-circle"></i> Clear Search
                </a>
            </c:if>
        </div>

        <div class="mt-3">
            <a href="/user/cart"
               class="btn btn-success btn-lg px-4">
                <i class="bi bi-cart3"></i> View Cart
            </a>
        </div>
    </div>
</div>

<!-- ✅ Products Section -->
<div class="container mb-5">

    <!-- Title + Search Result -->
    <div class="d-flex justify-content-between
                align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-box-seam text-success"></i>
            <c:choose>
                <c:when test="${keyword != null && keyword != ''}">
                    Search Results
                </c:when>
                <c:otherwise>
                    Our Products
                </c:otherwise>
            </c:choose>
        </h3>

        <c:if test="${searchResult != null}">
            <span class="search-result-badge">
                <i class="bi bi-search"></i> ${searchResult}
            </span>
        </c:if>
    </div>

    <!-- No Results Found -->
    <c:if test="${keyword != null && keyword != ''
                  && empty products}">
        <div class="text-center py-5">
            <i class="bi bi-search text-muted"
               style="font-size: 4rem;"></i>
            <h4 class="text-muted mt-3">
                No products found for
                "<strong>${keyword}</strong>"
            </h4>
            <p class="text-muted">
                Try searching with different keywords
            </p>
            <a href="/user/home" class="btn btn-success mt-2">
                <i class="bi bi-arrow-left"></i>
                View All Products
            </a>
        </div>
    </c:if>

    <!-- ✅ Products Grid -->
    <div class="row g-4">

        <c:forEach var="product" items="${products}">
        <div class="col-md-3">
            <div class="card product-card h-100">

                <!-- Product Image -->
                <c:choose>
                    <c:when test="${product.imageName != null
                              && product.imageName != ''}">
                        <div class="product-img-box">
                            <img src="/images/products/${product.imageName}"
                                 alt="${product.productName}"
                                 onerror="this.parentElement.innerHTML=
                                 '<div class=\'no-image-box\'><i class=\'bi bi-image text-muted\' style=\'font-size:4rem;\'></i></div>'"/>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="no-image-box">
                            <i class="bi bi-box-seam text-success"
                               style="font-size: 4rem;"></i>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Product Details -->
                <div class="card-body">
                    <h5 class="card-title fw-bold mb-1">
                        ${product.productName}
                    </h5>
                    <p class="text-muted small mb-2">
                        ${product.description}
                    </p>
                    <span class="category-badge">
                        <i class="bi bi-tag"></i>
                        ${product.category.categoryName}
                    </span>
                    <div class="mt-3">
                        <span class="price-badge">
                            ₹${product.price}
                        </span>
                    </div>
                    <p class="text-muted small mt-2 mb-0">
                        <i class="bi bi-boxes"></i>
                        Stock: ${product.quantity}
                    </p>
                </div>

                <!-- Add to Cart -->
                <div class="card-footer bg-white border-0 pb-3 px-3">
                    <a href="/user/addtocart/${product.productId}"
                       class="btn-cart">
                        <i class="bi bi-cart-plus"></i> Add to Cart
                    </a>
                </div>

            </div>
        </div>
        </c:forEach>

        <!-- No Products at All -->
        <c:if test="${empty products &&
                     (keyword == null || keyword == '')}">
        <div class="col-12 text-center py-5 text-muted">
            <i class="bi bi-inbox fs-1 d-block mb-3"></i>
            <h5>No products available right now!</h5>
            <p>Check back later for new arrivals.</p>
        </div>
        </c:if>

    </div>
</div>

<!-- ✅ Footer -->
<footer style="background: #1a1a2e; padding: 20px 0;">
    <p class="text-center text-white-50 mb-0">
        © 2026 EcomSpring. All rights reserved.
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>