<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between
                align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-box-seam text-success"></i> Products
        </h3>
        <a href="/admin/addproduct" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Add Product
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">
            <table class="table table-hover mb-0
                          rounded-4 overflow-hidden">
                <thead style="background:linear-gradient(
                              135deg,#1a1a2e,#16213e);
                              color:white;">
                    <tr>
                        <th class="py-3 px-4">#ID</th>
                        <th class="py-3">Image</th>
                        <th class="py-3">Name</th>
                        <th class="py-3">Price</th>
                        <th class="py-3">Qty</th>
                        <th class="py-3">Category</th>
                        <th class="py-3">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                    <tr>
                        <td class="px-4">
                            ${product.productId}
                        </td>

                        <!-- ✅ Product Image -->
                        <td>
                            <c:choose>
                                <c:when test="${product.imageName != null
                                          && product.imageName != ''}">
                                    <img src="/images/products/${product.imageName}"
                                         alt="${product.productName}"
                                         width="60" height="60"
                                         class="rounded"
                                         style="object-fit:cover;"
                                         onerror="this.src=''"/>
                                </c:when>
                                <c:otherwise>
                                    <div class="bg-light rounded d-flex
                                                align-items-center
                                                justify-content-center"
                                         style="width:60px;height:60px;">
                                        <i class="bi bi-image
                                                  text-muted fs-4"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="fw-bold">
                            ${product.productName}
                        </td>
                        <td>
                            <span class="badge bg-success fs-6">
                                ₹${product.price}
                            </span>
                        </td>
                        <td>
                            <span class="badge bg-secondary">
                                ${product.quantity}
                            </span>
                        </td>
                        <td>${product.category.categoryName}</td>
                        <td>
                            <a href="/admin/editproduct/${product.productId}"
                               class="btn btn-sm btn-primary me-1">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                            <a href="/admin/deleteproduct/${product.productId}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm(
                                   'Delete this product?')">
                                <i class="bi bi-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </c:forEach>

                    <c:if test="${empty products}">
                    <tr>
                        <td colspan="7"
                            class="text-center py-4 text-muted">
                            <i class="bi bi-inbox fs-3
                                      d-block mb-2"></i>
                            No products found!
                        </td>
                    </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>