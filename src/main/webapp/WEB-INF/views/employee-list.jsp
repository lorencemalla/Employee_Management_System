<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f6fa; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; margin: -20px -20px 20px; }
        .header a { color: white; text-decoration: none; padding: 10px 20px; background: rgba(255,255,255,0.2); border-radius: 5px; }
        .header a:hover { background: white; color: #667eea; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; font-weight: 600; }
        tr:hover { background: #f8f9fa; }
        .btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 14px; margin-right: 5px; display: inline-block; }
        .btn-add { background: #667eea; color: white; margin-bottom: 20px; }
        .btn-edit { background: #4facfe; color: white; }
        .btn-delete { background: #f5576c; color: white; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Employee Management</h1>
        <a href="${pageContext.request.contextPath}/dashboard.jsp">← Back to Dashboard</a>
    </div>

    <c:if test="${sessionScope.role == 'ADMIN'}">
        <a href="${pageContext.request.contextPath}/employee/new" class="btn btn-add">+ Add New Employee</a>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Date of Joining</th>
                <th>Salary</th>
                <c:if test="${sessionScope.role == 'ADMIN'}">
                    <th>Actions</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${employees}">
                <tr>
                    <td>${employee.empId}</td>
                    <td>${employee.firstName} ${employee.lastName}</td>
                    <td>${employee.phone}</td>
                    <td>${employee.department}</td>
                    <td>${employee.designation}</td>
                    <td>${employee.dateOfJoining}</td>
                    <td>₹${employee.salary}</td>
                    <c:if test="${sessionScope.role == 'ADMIN'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/employee/edit?id=${employee.empId}" class="btn btn-edit">Edit</a>
                            <a href="${pageContext.request.contextPath}/employee/delete?id=${employee.empId}" class="btn btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>