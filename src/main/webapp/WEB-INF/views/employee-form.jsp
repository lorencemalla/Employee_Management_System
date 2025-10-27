<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${employee != null ? 'Edit' : 'Add'} Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 24px 20px;
            color: #333;
        }
        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 24px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 28px 30px;
            border-radius: 12px;
            box-shadow: 0 2px 14px rgba(102, 126, 234, 0.15);
        }
        label {
            display: block;
            margin: 18px 0 6px;
            font-weight: 600;
            color: #4a4a7a;
        }
        input[type=text],
        input[type=password],
        input[type=email],
        input[type=date],
        input[type=number],
        select {
            width: 100%;
            padding: 10px 14px;
            border: 1.5px solid #b5b8e8;
            border-radius: 6px;
            font-size: 14px;
            color: #444;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type=text]:focus,
        input[type=password]:focus,
        input[type=email]:focus,
        input[type=date]:focus,
        input[type=number]:focus,
        select:focus {
            border-color: #667eea;
            outline: none;
        }
        button {
            display: block;
            margin: 28px auto 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 14px 48px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 5px 16px rgba(102, 126, 234, 0.4);
            transition: background 0.3s, box-shadow 0.3s;
        }
        button:hover {
            background: linear-gradient(135deg, #5369db 0%, #633ba8 100%);
            box-shadow: 0 7px 20px rgba(77, 102, 212, 0.6);
        }
        a {
            display: block;
            text-align: center;
            margin-top: 18px;
            font-size: 15px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        a:hover {
            text-decoration: underline;
        }
        /* Responsive Form Fields */
        @media (min-width: 500px) {
            form>label {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <h1>${employee != null ? 'Edit Employee' : 'Add New Employee'}</h1>
    <form action="${employee != null ? '../employee/update' : '../employee/insert'}" method="post">
        <c:if test="${employee != null}">
            <input type="hidden" name="empId" value="${employee.empId}" />
        </c:if>
        <c:if test="${employee == null}">
            <label>Username</label>
            <input type="text" name="username" required />
            <label>Password</label>
            <input type="password" name="password" required />
            <label>Email</label>
            <input type="email" name="email" required />
        </c:if>
        <label>First Name</label>
        <input type="text" name="firstName" value="${employee.firstName}" required />
        <label>Last Name</label>
        <input type="text" name="lastName" value="${employee.lastName}" required />
        <label>Phone</label>
        <input type="text" name="phone" value="${employee.phone}" required />
        <label>Department</label>
        <select name="department" required>
            <option value="IT" <c:if test="${employee.department == 'IT'}">selected</c:if>>IT</option>
            <option value="HR" <c:if test="${employee.department == 'HR'}">selected</c:if>>HR</option>
            <option value="Finance" <c:if test="${employee.department == 'Finance'}">selected</c:if>>Finance</option>
        </select>
        <label>Designation</label>
        <input type="text" name="designation" value="${employee.designation}" required />
        <label>Date of Joining</label>
        <input type="date" name="dateOfJoining" value="${employee.dateOfJoining}" required />
        <label>Salary</label>
        <input type="number" step="0.01" name="salary" value="${employee.salary}" required />
        <label>Address</label>
        <input type="text" name="address" value="${employee.address}" />
        <label>City</label>
        <input type="text" name="city" value="${employee.city}" />
        <label>State</label>
        <input type="text" name="state" value="${employee.state}" />
        <label>Pincode</label>
        <input type="text" name="pincode" value="${employee.pincode}" />
        <button type="submit">${employee != null ? 'Update' : 'Add'} Employee</button>
        <a href="${pageContext.request.contextPath}/employee/list">Cancel</a>
    </form>
</body>
</html>
