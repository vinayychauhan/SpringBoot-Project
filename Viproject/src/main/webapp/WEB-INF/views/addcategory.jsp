<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-plus-circle text-primary"></i>
            ${category.categoryId == 0 ?
              'Add Category' : 'Edit Category'}
        </h3>
        <a href="/admin/categories" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> Back
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-4">

            <form action="/admin/savecategory" method="post">

                <input type="hidden"
                       name="categoryId"
                       value="${category.categoryId}"/>

                <div class="mb-3">
                    <label class="form-label fw-bold">
                        <i class="bi bi-tag"></i> Category Name
                    </label>
                    <input type="text"
                           name="categoryName"
                           value="${category.categoryName}"
                           class="form-control form-control-lg"
                           placeholder="Enter category name"
                           required/>
                </div>

                <button type="submit"
                        class="btn btn-primary btn-lg px-5">
                    <i class="bi bi-check-circle"></i>
                    ${category.categoryId == 0 ?
                      'Save Category' : 'Update Category'}
                </button>
                <a href="/admin/categories"
                   class="btn btn-outline-secondary btn-lg ms-2">
                    Cancel
                </a>

            </form>
        </div>
    </div>
</div>

</body>
</html>