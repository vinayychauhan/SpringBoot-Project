<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customers</title>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <h3 class="fw-bold mb-4">
        <i class="bi bi-people text-warning"></i> Customers
    </h3>

    <!-- Table -->
    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 rounded-4 overflow-hidden">
                <thead style="background: linear-gradient(135deg,#1a1a2e,#16213e); color:white;">
                    <tr>
                        <th class="py-3 px-4">#ID</th>
                        <th class="py-3">Username</th>
                        <th class="py-3">Email</th>
                        <th class="py-3">Role</th>
                        <th class="py-3">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                    <tr>
                        <td class="px-4">${user.userId}</td>
                        <td>
                            <i class="bi bi-person-circle text-secondary"></i>
                            ${user.username}
                        </td>
                        <td>${user.email}</td>
                        <td>
                            <span class="badge ${user.role == 'ROLE_ADMIN' ? 'bg-danger' : 'bg-success'}">
                                ${user.role}
                            </span>
                        </td>
                        <td>
                            <a href="/admin/deleteuser/${user.userId}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this user?')">
                                <i class="bi bi-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </c:forEach>

                    <c:if test="${empty users}">
                    <tr>
                        <td colspan="5" class="text-center py-4 text-muted">
                            <i class="bi bi-inbox fs-3 d-block mb-2"></i>
                            No customers found!
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