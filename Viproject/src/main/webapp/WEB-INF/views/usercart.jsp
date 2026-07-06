<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        body { background: #f8f9fa; }
        .navbar {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
        }
        .cart-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
        }
        .total-card {
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4" href="/user/home">
            <i class="bi bi-shop text-success"></i> EcomSpring
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/user/home">
                        <i class="bi bi-house"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/user/cart">
                        <i class="bi bi-cart"></i> Cart
                    </a>
                </li>
                <li class="nav-item ms-2">
                    <a class="btn btn-outline-danger btn-sm mt-1"
                       href="/logout">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">

    <!-- Top Bar -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-cart text-success"></i> My Cart
        </h3>
        <a href="/user/home" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Continue Shopping
        </a>
    </div>

    <!-- Empty Cart -->
    <c:if test="${empty cartItems}">
    <div class="text-center py-5">
        <i class="bi bi-cart-x text-muted"
           style="font-size: 5rem;"></i>
        <h4 class="text-muted mt-3">Your cart is empty!</h4>
        <a href="/user/home" class="btn btn-success mt-3">
            <i class="bi bi-shop"></i> Start Shopping
        </a>
    </div>
    </c:if>

    <!-- Cart Items -->
    <c:if test="${not empty cartItems}">
    <div class="row g-4">

        <!-- Cart Table -->
        <div class="col-md-8">
            <div class="card cart-card">
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead style="background:#f8f9fa;">
                            <tr>
                                <th class="py-3 px-4">Product</th>
                                <th class="py-3">Price</th>
                                <th class="py-3">Qty</th>
                                <th class="py-3">Subtotal</th>
                                <th class="py-3">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td class="px-4 py-3">
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-box-seam text-success fs-4 me-3"></i>
                                        <div>
                                            <h6 class="mb-0 fw-bold">
                                                ${item.product.productName}
                                            </h6>
                                            <small class="text-muted">
                                                ${item.product.category.categoryName}
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="py-3">
                                    ₹${item.product.price}
                                </td>
                                <td class="py-3">
                                    <span class="badge bg-secondary fs-6">
                                        ${item.quantity}
                                    </span>
                                </td>
                                <td class="py-3 fw-bold text-success">
                                    ₹${item.product.price * item.quantity}
                                </td>
                                <td class="py-3">
                                    <a href="/user/removecart/${item.cartId}"
                                       class="btn btn-sm btn-outline-danger"
                                       onclick="return confirm('Remove item?')">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Clear Cart Button -->
            <div class="mt-3">
                <a href="/user/clearcart"
                   class="btn btn-outline-danger"
                   onclick="return confirm('Clear entire cart?')">
                    <i class="bi bi-trash"></i> Clear Cart
                </a>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="col-md-4">
            <div class="card total-card p-4">
                <h5 class="fw-bold mb-3">
                    <i class="bi bi-receipt"></i> Order Summary
                </h5>
                <hr class="border-secondary"/>
                <div class="d-flex justify-content-between mb-2">
                    <span>Items:</span>
                    <span>${cartItems.size()}</span>
                </div>
                <div class="d-flex justify-content-between mb-3">
                    <span>Total:</span>
                    <span class="fw-bold fs-5">₹${total}</span>
                </div>
                <hr class="border-secondary"/>
                <button class="btn btn-success w-100 btn-lg">
                    <i class="bi bi-bag-check"></i> Checkout
                </button>
            </div>
        </div>

    </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>