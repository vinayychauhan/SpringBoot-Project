<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EcomSpring Shop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
<style>
body{background:#f8f9fa;}
.tnav{background:linear-gradient(135deg,#1a1a2e,#16213e);position:sticky;top:0;z-index:9999;box-shadow:0 2px 15px rgba(0,0,0,0.3);}
.hero{background:linear-gradient(135deg,#1a1a2e,#16213e);color:white;padding:60px 0;margin-bottom:40px;}
.pcard{border:none;border-radius:15px;overflow:hidden;box-shadow:0 2px 15px rgba(0,0,0,0.08);transition:transform 0.3s;}
.pcard:hover{transform:translateY(-5px);}
.pimg{height:200px;overflow:hidden;background:#f8f9fa;display:flex;align-items:center;justify-content:center;}
.pimg img{width:100%;height:200px;object-fit:cover;}
.price{background:linear-gradient(135deg,#4CAF50,#2e7d32);color:white;padding:5px 15px;border-radius:20px;font-weight:bold;}
.catbadge{background:#e3f2fd;color:#1565c0;padding:3px 10px;border-radius:10px;font-size:12px;}
.btn-green{background:linear-gradient(135deg,#4CAF50,#2e7d32);color:white;border:none;border-radius:8px;padding:10px;text-decoration:none;display:block;text-align:center;font-size:15px;}
.btn-green:hover{background:#2e7d32;color:white;}
.btn-orange{background:linear-gradient(135deg,#FF9800,#e65100);color:white;border:none;border-radius:8px;padding:10px;text-decoration:none;display:block;text-align:center;font-size:15px;}
.btn-orange:hover{background:#e65100;color:white;}
.guestbar{background:linear-gradient(135deg,#FF9800,#e65100);color:white;padding:12px;text-align:center;font-size:15px;}
.sbox .form-control{border-radius:30px 0 0 30px;border:none;padding:12px 20px;font-size:16px;}
.sbtn{border-radius:0 30px 30px 0;background:#4CAF50;border:none;color:white;padding:12px 25px;font-size:16px;}
.sbtn:hover{background:#2e7d32;color:white;}
</style>
</head>
<body>

<%-- ✅ Guest Banner --%>
<c:if test="${pageContext.request.userPrincipal == null}">
<div class="guestbar">
    <i class="bi bi-info-circle-fill"></i>
    <strong>Welcome Guest!</strong>
    &nbsp; Login required to add products to cart. &nbsp;
    <a href="/login" class="btn btn-light btn-sm fw-bold ms-2">
        <i class="bi bi-box-arrow-in-right"></i> Login Now
    </a>
    <a href="/register" class="btn btn-outline-light btn-sm ms-1">
        <i class="bi bi-person-plus"></i> Register Free
    </a>
</div>
</c:if>

<%-- ✅ Sticky Navbar --%>
<nav class="navbar navbar-expand-lg navbar-dark tnav">
<div class="container">
    <a class="navbar-brand fw-bold fs-4" href="/publichome">
        <i class="bi bi-shop text-success"></i> EcomSpring
    </a>
    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#n1">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="n1">
        <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link active" href="/publichome">
                    <i class="bi bi-house"></i> Home
                </a>
            </li>
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/cart">
                            <i class="bi bi-cart3"></i> Cart
                        </a>
                    </li>
                    <li class="nav-item ms-2">
                        <a class="btn btn-outline-danger btn-sm" href="/logout">
                            <i class="bi bi-box-arrow-right"></i> Logout
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item ms-2">
                        <a class="btn btn-success btn-sm" href="/login">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </a>
                    </li>
                    <li class="nav-item ms-1">
                        <a class="btn btn-outline-light btn-sm" href="/register">
                            <i class="bi bi-person-plus"></i> Register
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
</nav>

<%-- ✅ Hero --%>
<div class="hero text-center">
<div class="container">
    <h1 class="fw-bold display-5 mb-2">
        <i class="bi bi-bag-heart"></i> Welcome to EcomSpring!
    </h1>
    <p class="text-white-50 mb-4">
        Discover our amazing collection of products
    </p>
    <%-- Search --%>
    <div class="sbox mx-auto" style="max-width:520px;">
        <form action="/publichome" method="get">
            <div class="input-group">
                <input type="text" name="keyword"
                       value="${keyword}"
                       class="form-control"
                       placeholder="🔍 Search products by name..."/>
                <button type="submit" class="sbtn">
                    <i class="bi bi-search"></i> Search
                </button>
            </div>
        </form>
        <c:if test="${not empty keyword}">
            <a href="/publichome"
               class="btn btn-outline-light btn-sm mt-2">
                <i class="bi bi-x-circle"></i> Clear Search
            </a>
        </c:if>
    </div>
    <div class="mt-4">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal != null}">
                <a href="/user/cart"
                   class="btn btn-success btn-lg px-4 me-2">
                    <i class="bi bi-cart3"></i> View Cart
                </a>
            </c:when>
            <c:otherwise>
                <a href="/login"
                   class="btn btn-warning btn-lg px-4 fw-bold">
                    <i class="bi bi-box-arrow-in-right"></i>
                    Login to Shop
                </a>
                <a href="/register"
                   class="btn btn-outline-light btn-lg px-4 ms-2">
                    <i class="bi bi-person-plus"></i> Register Free
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>

<%-- ✅ Products --%>
<div class="container mb-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-box-seam text-success"></i>
            <c:choose>
                <c:when test="${not empty keyword}">Search Results</c:when>
                <c:otherwise>Our Products</c:otherwise>
            </c:choose>
        </h3>
        <c:if test="${not empty searchResult}">
            <span class="badge bg-warning text-dark fs-6 p-2">
                <i class="bi bi-search"></i> ${searchResult}
            </span>
        </c:if>
    </div>

    <%-- No results --%>
    <c:if test="${not empty keyword and empty products}">
    <div class="text-center py-5">
        <i class="bi bi-search text-muted" style="font-size:4rem;"></i>
        <h4 class="text-muted mt-3">
            No results for "<strong>${keyword}</strong>"
        </h4>
        <a href="/publichome" class="btn btn-success mt-2">
            <i class="bi bi-arrow-left"></i> View All
        </a>
    </div>
    </c:if>

    <%-- Products Grid --%>
    <div class="row g-4">
    <c:forEach var="product" items="${products}">
    <div class="col-md-3">
    <div class="card pcard h-100">

        <%-- Image --%>
        <c:choose>
            <c:when test="${not empty product.imageName}">
                <div class="pimg">
                    <img src="/images/products/${product.imageName}"
                         alt="${product.productName}"/>
                </div>
            </c:when>
            <c:otherwise>
                <div class="pimg">
                    <i class="bi bi-box-seam text-success"
                       style="font-size:4rem;"></i>
                </div>
            </c:otherwise>
        </c:choose>

        <%-- Details --%>
        <div class="card-body">
            <h5 class="fw-bold mb-1">${product.productName}</h5>
            <p class="text-muted small mb-2">${product.description}</p>
            <span class="catbadge">
                <i class="bi bi-tag"></i>
                ${product.category.categoryName}
            </span>
            <div class="mt-2">
                <span class="price">&#8377;${product.price}</span>
            </div>
            <p class="text-muted small mt-2 mb-0">
                <i class="bi bi-boxes"></i>
                Stock: ${product.quantity}
            </p>
        </div>

        <%-- ✅ Button --%>
        <div class="card-footer bg-white border-0 pb-3 px-3">
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <a href="/user/addtocart/${product.productId}"
                       class="btn-green">
                        <i class="bi bi-cart-plus"></i> Add to Cart
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="/login" class="btn-orange">
                        <i class="bi bi-lock"></i> Login to Buy
                    </a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
    </div>
    </c:forEach>

    <c:if test="${empty products and empty keyword}">
    <div class="col-12 text-center py-5 text-muted">
        <i class="bi bi-inbox fs-1 d-block mb-3"></i>
        <h5>No products available!</h5>
    </div>
    </c:if>
    </div>
</div>

<%-- Footer --%>
<footer style="background:#1a1a2e;padding:20px 0;">
<p class="text-center text-white-50 mb-0">
    &#169; 2026 EcomSpring. All rights reserved.
</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>