<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
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
        .login-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            width: 420px;
        }
        .card-header {
            background: linear-gradient(135deg, #4CAF50, #2e7d32);
            border-radius: 15px 15px 0 0 !important;
            padding: 25px;
            text-align: center;
        }
        .btn-login {
            background: linear-gradient(135deg, #4CAF50, #2e7d32);
            border: none;
            color: white;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            width: 100%;
        }
        .btn-login:hover {
            background: #2e7d32;
            color: white;
        }
    </style>
</head>
<body>

<div class="card login-card">
    <div class="card-header">
        <h3 class="text-white mb-0">
            <i class="bi bi-shop"></i> EcomSpring
        </h3>
        <p class="text-white-50 mb-0 mt-1">Admin Panel Login</p>
    </div>
    <div class="card-body p-4">

        <% if("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            Invalid username or password!
        </div>
        <% } %>

        <% if(request.getParameter("logout") != null) { %>
        <div class="alert alert-success">
            <i class="bi bi-check-circle-fill me-2"></i>
            Logged out successfully!
        </div>
        <% } %>

        <form action="/doLogin" method="post">
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
            <button type="submit" class="btn-login">
                <i class="bi bi-box-arrow-in-right"></i> Login
            </button>
        </form>

        <hr/>
        <p class="text-center mb-0">
            New user?
            <a href="/register" class="text-success fw-bold">
                Register here
            </a>
        </p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>