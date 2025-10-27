<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Leave Management</title></head>
<body>
    <h1>Leave Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">Back to Dashboard</a>
    <h2>Leave Requests</h2>
    <table border="1">
        <tr><th>ID</th><th>Employee</th><th>Type</th><th>Start Date</th><th>End Date</th><th>Status</th><th>Actions</th></tr>
        <c:forEach var="leave" items="${leaves}">
            <tr>
                <td>${leave.leaveId}</td>
                <td>${leave.employeeName}</td>
                <td>${leave.leaveTypeName}</td>
                <td>${leave.startDate}</td>
                <td>${leave.endDate}</td>
                <td>${leave.status}</td>
                <td>
                    <c:if test="${sessionScope.role == 'ADMIN' && leave.status == 'PENDING'}">
                        <a href="${pageContext.request.contextPath}/leave/approve?id=${leave.leaveId}">Approve</a>
                        <a href="${pageContext.request.contextPath}/leave/reject?id=${leave.leaveId}">Reject</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>