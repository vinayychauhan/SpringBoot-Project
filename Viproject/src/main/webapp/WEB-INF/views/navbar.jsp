<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>

<nav class="navbar navbar-expand-lg navbar-dark" 
     style="background: linear-gradient(135deg, #1a1a2e, #16213e);">
    <div class="container-fluid px-4">

        <!-- Brand -->
        <a class="navbar-brand fw-bold fs-4" href="/admin/Dashboard">
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
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/Dashboard">
                        <i class="bi bi-speedometer2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/products">
                        <i class="bi bi-box-seam"></i> Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/categories">
                        <i class="bi bi-grid"></i> Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/customers">
                        <i class="bi bi-people"></i> Customers
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>