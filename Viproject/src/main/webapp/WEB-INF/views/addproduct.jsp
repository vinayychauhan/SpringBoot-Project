<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between
                align-items-center mb-4">
        <h3 class="fw-bold mb-0">
            <i class="bi bi-plus-circle text-success"></i>
            ${product.productId == 0 ?
              'Add Product' : 'Edit Product'}
        </h3>
        <a href="/admin/products" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> Back
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-4">

            <!-- ✅ enctype for file upload -->
            <form action="/admin/saveproduct"
                  method="post"
                  enctype="multipart/form-data">

                <input type="hidden"
                       name="productId"
                       value="${product.productId}"/>

                <div class="row g-3">

                    <!-- Product Name -->
                    <div class="col-md-6">
                        <label class="form-label fw-bold">
                            <i class="bi bi-box"></i> Product Name
                        </label>
                        <input type="text"
                               name="productName"
                               value="${product.productName}"
                               class="form-control form-control-lg"
                               placeholder="Enter product name"
                               required/>
                    </div>

                    <!-- Category -->
                    <div class="col-md-6">
                        <label class="form-label fw-bold">
                            <i class="bi bi-grid"></i> Category
                        </label>
                        <select name="category.categoryId"
                                class="form-select form-select-lg"
                                required>
                            <option value="">
                                -- Select Category --
                            </option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}"
                                    ${product.category != null &&
                                      product.category.categoryId ==
                                      cat.categoryId ?
                                      'selected' : ''}>
                                    ${cat.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Price -->
                    <div class="col-md-6">
                        <label class="form-label fw-bold">
                            <i class="bi bi-currency-rupee"></i> Price
                        </label>
                        <input type="number"
                               name="price"
                               value="${product.price}"
                               class="form-control form-control-lg"
                               placeholder="Enter price"
                               min="0" step="0.01"
                               required/>
                    </div>

                    <!-- Quantity -->
                    <div class="col-md-6">
                        <label class="form-label fw-bold">
                            <i class="bi bi-123"></i> Quantity
                        </label>
                        <input type="number"
                               name="quantity"
                               value="${product.quantity}"
                               class="form-control form-control-lg"
                               placeholder="Enter quantity"
                               min="0"
                               required/>
                    </div>

                    <!-- Description -->
                    <div class="col-md-12">
                        <label class="form-label fw-bold">
                            <i class="bi bi-text-paragraph"></i>
                            Description
                        </label>
                        <input type="text"
                               name="description"
                               value="${product.description}"
                               class="form-control form-control-lg"
                               placeholder="Enter description"/>
                    </div>

                    <!-- ✅ Image Upload -->
                    <div class="col-md-12">
                        <label class="form-label fw-bold">
                            <i class="bi bi-image"></i>
                            Product Image
                        </label>

                        <!-- Show existing image -->
                        <c:if test="${product.imageName != null &&
                                      product.imageName != ''}">
                        <div class="mb-2">
                            <img src="/images/products/${product.imageName}"
                                 alt="Current Image"
                                 width="100"
                                 height="100"
                                 class="rounded border"
                                 style="object-fit: cover;"
                                 onerror="this.src='/images/no-image.png'"/>
                            <p class="text-muted small mt-1">
                                Current: ${product.imageName}
                            </p>
                        </div>
                        </c:if>

                        <input type="file"
                               name="imageFile"
                               class="form-control form-control-lg"
                               accept="image/*"
                               onchange="previewImage(this)"/>

                        <!-- Image Preview -->
                        <div class="mt-2">
                            <img id="imagePreview"
                                 src="#"
                                 alt="Preview"
                                 width="100"
                                 height="100"
                                 class="rounded border d-none"
                                 style="object-fit: cover;"/>
                        </div>

                        <small class="text-muted">
                            Accepted: JPG, PNG, GIF (Max 10MB)
                            <br/>Leave empty to keep existing image.
                        </small>
                    </div>

                    <!-- Submit -->
                    <div class="col-12 mt-2">
                        <button type="submit"
                                class="btn btn-success btn-lg px-5">
                            <i class="bi bi-check-circle"></i>
                            ${product.productId == 0 ?
                              'Save Product' : 'Update Product'}
                        </button>
                        <a href="/admin/products"
                           class="btn btn-outline-secondary btn-lg ms-2">
                            Cancel
                        </a>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<!-- ✅ Image Preview Script -->
<script>
function previewImage(input) {
    const preview = document.getElementById('imagePreview');
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.classList.remove('d-none');
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>

</body>
</html>