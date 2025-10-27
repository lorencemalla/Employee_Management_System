<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 30px 20px;
            color: #333;
        }
        h1, h2 {
            text-align: center;
            color: #667eea;
            margin-bottom: 15px;
        }
        a {
            display: inline-block;
            margin-bottom: 30px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            padding: 6px 14px;
            border: 2px solid #667eea;
            border-radius: 6px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #667eea;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 14px rgba(102, 126, 234, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }
        th {
            background-color: #667eea;
            color: white;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #efefef;
        }
        /* Responsive */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            tr {
                margin-bottom: 20px;
            }
            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            td {
                padding-left: 50%;
                position: relative;
            }
            td:before {
                position: absolute;
                top: 14px;
                left: 16px;
                width: 45%;
                white-space: nowrap;
                font-weight: 700;
                content: attr(data-label);
                color: #667eea;
            }
        }
    </style>
</head>
<body>
    <h1>Attendance Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">← Back to Dashboard</a>
    <h2>Attendance Records</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee</th>
                <th>Date</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="attendance" items="${attendanceList}">
            <tr>
                <td data-label="ID">${attendance.attendanceId}</td>
                <td data-label="Employee">${attendance.employeeName}</td>
                <td data-label="Date">${attendance.attendanceDate}</td>
                <td data-label="Check-In">${attendance.checkInTime}</td>
                <td data-label="Check-Out">${attendance.checkOutTime}</td>
                <td data-label="Status">${attendance.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
