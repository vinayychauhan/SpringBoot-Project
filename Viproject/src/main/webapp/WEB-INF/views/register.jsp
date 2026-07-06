<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            width: 450px;
        }
        .card-header {
            background: linear-gradient(135deg, #2196F3, #1565c0);
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
            text-align: center;
        }
        .btn-register {
            background: linear-gradient(135deg, #2196F3, #1565c0);
            border: none;
            color: white;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
        }
        .btn-register:hover {
            background: linear-gradient(135deg, #1565c0, #0d47a1);
            color: white;
        }
        .form-control:focus {
            border-color: #2196F3;
            box-shadow: 0 0 0 0.2rem rgba(33,150,243,0.25);
        }
    </style>
</head>
<body>

<div class="card register-card">

    <!-- Header -->
    <div class="card-header">
        <h3 class="text-white mb-0">
            <i class="bi bi-person-plus"></i> Register
        </h3>
        <p class="text-white-50 mb-0 mt-1">
            Create your account
        </p>
    </div>

    <!-- Body -->
    <div class="card-body p-4">

        <!-- ✅ Username already exists error -->
        <% if("exists".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger d-flex align-items-center">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            Username already exists! Try a different one.
        </div>
        <% } %>

        <!-- ✅ General error -->
        <% if("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger d-flex align-items-center">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            Registration failed! Please try again.
        </div>
        <% } %>

        <!-- ✅ Success message from login page -->
        <% if(request.getParameter("registered") != null) { %>
        <div class="alert alert-success d-flex align-items-center">
            <i class="bi bi-check-circle-fill me-2"></i>
            Registration successful! Please login.
        </div>
        <% } %>

        <!-- Register Form -->
        <form action="/registeruser" method="post">

            <div class="mb-3">
                <label class="form-label fw-bold">
                    <i class="bi bi-person"></i> Username
                </label>
                <input type="text"
                       name="username"
                       class="form-control form-control-lg"
                       placeholder="Enter username"
                       required/>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">
                    <i class="bi bi-envelope"></i> Email
                </label>
                <input type="email"
                       name="email"
                       class="form-control form-control-lg"
                       placeholder="Enter email"
                       required/>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold">
                    <i class="bi bi-lock"></i> Password
                </label>
                <input type="password"
                       name="password"
                       class="form-control form-control-lg"
                       placeholder="Enter password"
                       required/>
            </div>

            <button type="submit" class="btn btn-register w-100">
                <i class="bi bi-check-circle"></i> Register
            </button>

        </form>

        <hr/>
        <p class="text-center mb-0">
            Already have account?
            <a href="/login" class="text-primary fw-bold">
                Login here
            </a>
        </p>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>