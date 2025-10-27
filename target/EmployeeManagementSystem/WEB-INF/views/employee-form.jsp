<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>${employee != null ? 'Edit' : 'Add'} Employee</title></head>
<body>
    <h1>${employee != null ? 'Edit Employee' : 'Add New Employee'}</h1>
    <form action="${employee != null ? '../employee/update' : '../employee/insert'}" method="post">
        <c:if test="${employee != null}">
            <input type="hidden" name="empId" value="${employee.empId}">
        </c:if>
        <c:if test="${employee == null}">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            Email: <input type="email" name="email" required><br>
        </c:if>
        First Name: <input type="text" name="firstName" value="${employee.firstName}" required><br>
        Last Name: <input type="text" name="lastName" value="${employee.lastName}" required><br>
        Phone: <input type="text" name="phone" value="${employee.phone}" required><br>
        Department: <select name="department" required>
            <option value="IT" ${employee.department == 'IT' ? 'selected' : ''}>IT</option>
            <option value="HR" ${employee.department == 'HR' ? 'selected' : ''}>HR</option>
            <option value="Finance" ${employee.department == 'Finance' ? 'selected' : ''}>Finance</option>
        </select><br>
        Designation: <input type="text" name="designation" value="${employee.designation}" required><br>
        Date of Joining: <input type="date" name="dateOfJoining" value="${employee.dateOfJoining}" required><br>
        Salary: <input type="number" step="0.01" name="salary" value="${employee.salary}" required><br>
        Address: <input type="text" name="address" value="${employee.address}"><br>
        City: <input type="text" name="city" value="${employee.city}"><br>
        State: <input type="text" name="state" value="${employee.state}"><br>
        Pincode: <input type="text" name="pincode" value="${employee.pincode}"><br>
        <button type="submit">${employee != null ? 'Update' : 'Add'} Employee</button>
        <a href="${pageContext.request.contextPath}/employee/list">Cancel</a>
    </form>
</body>
</html>