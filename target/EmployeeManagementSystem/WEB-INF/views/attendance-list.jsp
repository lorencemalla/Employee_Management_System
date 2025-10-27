<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Attendance Management</title></head>
<body>
    <h1>Attendance Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">Back to Dashboard</a>
    <h2>Attendance Records</h2>
    <table border="1">
        <tr><th>ID</th><th>Employee</th><th>Date</th><th>Check-In</th><th>Check-Out</th><th>Status</th></tr>
        <c:forEach var="attendance" items="${attendanceList}">
            <tr>
                <td>${attendance.attendanceId}</td>
                <td>${attendance.employeeName}</td>
                <td>${attendance.attendanceDate}</td>
                <td>${attendance.checkInTime}</td>
                <td>${attendance.checkOutTime}</td>
                <td>${attendance.status}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>