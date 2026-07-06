<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <h3 class="mb-4 fw-bold">
        <i class="bi bi-speedometer2 text-success"></i> Dashboard
    </h3>

    <!-- Stat Cards -->
    <div class="row g-4">

        <!-- Products Card -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="rounded-circle bg-success bg-opacity-10 p-3 me-3">
                        <i class="bi bi-box-seam text-success fs-2"></i>
                    </div>
                    <div>
                        <h2 class="fw-bold mb-0">${totalProducts}</h2>
                        <p class="text-muted mb-0">Total Products</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Categories Card -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="rounded-circle bg-primary bg-opacity-10 p-3 me-3">
                        <i class="bi bi-grid text-primary fs-2"></i>
                    </div>
                    <div>
                        <h2 class="fw-bold mb-0">${totalCategories}</h2>
                        <p class="text-muted mb-0">Total Categories</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Customers Card -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="rounded-circle bg-warning bg-opacity-10 p-3 me-3">
                        <i class="bi bi-people text-warning fs-2"></i>
                    </div>
                    <div>
                        <h2 class="fw-bold mb-0">${totalUsers}</h2>
                        <p class="text-muted mb-0">Total Customers</p>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Quick Links -->
    <div class="row g-4 mt-2">
        <div class="col-md-4">
            <a href="/admin/products" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 
                            text-center p-3 bg-success text-white">
                    <i class="bi bi-plus-circle fs-3"></i>
                    <p class="mb-0 mt-1 fw-bold">Manage Products</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/admin/categories" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 
                            text-center p-3 bg-primary text-white">
                    <i class="bi bi-grid-plus fs-3"></i>
                    <p class="mb-0 mt-1 fw-bold">Manage Categories</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/admin/customers" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 
                            text-center p-3 bg-warning text-white">
                    <i class="bi bi-person-lines-fill fs-3"></i>
                    <p class="mb-0 mt-1 fw-bold">Manage Customers</p>
                </div>
            </a>
        </div>
    </div>

</div>
</body>
</html>