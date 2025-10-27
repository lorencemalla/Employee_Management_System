<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>HelpDesk Management</title></head>
<body>
    <h1>HelpDesk Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">Back to Dashboard</a>
    <h2>Support Tickets</h2>
    <table border="1">
        <tr><th>Ticket ID</th><th>Employee</th><th>Subject</th><th>Category</th><th>Priority</th><th>Status</th><th>Created At</th></tr>
        <c:forEach var="ticket" items="${tickets}">
            <tr>
                <td>${ticket.ticketId}</td>
                <td>${ticket.employeeName}</td>
                <td>${ticket.subject}</td>
                <td>${ticket.category}</td>
                <td>${ticket.priority}</td>
                <td>${ticket.status}</td>
                <td>${ticket.createdAt}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>