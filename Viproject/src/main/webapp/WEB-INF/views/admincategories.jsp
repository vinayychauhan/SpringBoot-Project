<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categories</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <!-- Top Bar -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-grid text-primary"></i> Categories
        </h3>
        <a href="/admin/addcategory" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Add Category
        </a>
    </div>

    <!-- Table -->
    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 rounded-4 overflow-hidden">
                <thead style="background: linear-gradient(135deg,#1a1a2e,#16213e); color:white;">
                    <tr>
                        <th class="py-3 px-4">#ID</th>
                        <th class="py-3">Category Name</th>
                        <th class="py-3">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${categories}">
                    <tr>
                        <td class="px-4">${category.categoryId}</td>
                        <td>
                            <i class="bi bi-tag text-primary"></i>
                            ${category.categoryName}
                        </td>
                        <td>
                            <a href="/admin/editcategory/${category.categoryId}"
                               class="btn btn-sm btn-primary me-1">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                            <a href="/admin/deletecategory/${category.categoryId}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this category?')">
                                <i class="bi bi-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </c:forEach>

                    <c:if test="${empty categories}">
                    <tr>
                        <td colspan="3" class="text-center py-4 text-muted">
                            <i class="bi bi-inbox fs-3 d-block mb-2"></i>
                            No categories found!
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