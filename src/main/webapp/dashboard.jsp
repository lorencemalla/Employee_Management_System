<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.empmanagement.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Employee Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
            margin: 0;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 28px 44px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 30px;
            letter-spacing: 1px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .role-badge {
            background: rgba(255,255,255,0.3);
            padding: 6px 14px;
            border-radius: 16px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .8px;
        }

        .btn-logout {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 10px 22px;
            border: 1px solid white;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: .3s;
        }

        .btn-logout:hover {
            background: white;
            color: #667eea;
        }

        .container {
            max-width: 1220px;
            margin: 40px auto;
            padding: 0 22px;
        }

        /* EMPLOYEE QUICK ACTIONS */
        .employee-actions {
            background: #fffbea;
            padding: 30px 40px;
            border-radius: 12px;
            margin-bottom: 42px;
            border-left: 6px solid #ffd54f;
            box-shadow: 0 4px 12px rgba(255, 213, 79, 0.3);
        }

        .employee-actions h3 {
            color: #d97706;
            font-size: 1.4rem;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 24px;
            font-weight: 700;
        }

        .quick-grid {
            display: flex;
            gap: 26px;
            flex-wrap: wrap;
        }

        .quick-card {
            flex: 1;
            min-width: 230px;
            max-width: 280px;
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: #402d2d;
            border-radius: 14px;
            padding: 36px 26px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(246,156,65,0.15);
            text-decoration: none;
            transition: .3s;
        }

        .quick-card:hover {
            transform: translateY(-4px) scale(1.03);
            box-shadow: 0 8px 24px rgba(251,188,5,0.18);
            background: linear-gradient(135deg, #ffc837 0%, #ff8008 100%);
            color: #3b2a00;
        }

        .quick-icon {
            font-size: 2.6rem;
            margin-bottom: 10px;
        }

        .quick-title {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .quick-desc {
            font-size: 13px;
            color: #5a4630;
        }

        /* SYSTEM MODULES */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 26px;
        }

        .dashboard-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 42px 24px;
            border-radius: 12px;
            text-align: center;
            text-decoration: none;
            transition: .3s;
            box-shadow: 0 2px 14px rgba(98,24,184,0.09);
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            background: linear-gradient(135deg, #5a4de0, #945cf2);
            box-shadow: 0 6px 22px rgba(120,70,255,0.18);
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .card-description {
            color: #f3ebfc;
            font-size: 14px;
        }

        @media (max-width: 700px) {
            .quick-grid, .dashboard-grid { flex-direction: column; grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
    <div class="header">
        <h1>Employee Management System</h1>
        <div class="user-info">
            <span>Welcome, <strong><%= username %></strong></span>
            <span class="role-badge"><%= role %></span>
            <a href="logout" class="btn-logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <% if ("EMPLOYEE".equals(role)) { %>
        <!-- EMPLOYEE QUICK ACTIONS -->
        <div class="employee-actions">
            <h3>🎯 Quick Actions</h3>
            <div class="quick-grid">
                <a href="<%= request.getContextPath() %>/leave-form.jsp" class="quick-card">
                    <div class="quick-icon">📝</div>
                    <div class="quick-title">Request Leave</div>
                    <div class="quick-desc">Apply for leave easily</div>
                </a>
                <a href="<%= request.getContextPath() %>/attendance-form.jsp" class="quick-card">
                    <div class="quick-icon">⏱️</div>
                    <div class="quick-title">Mark Attendance</div>
                    <div class="quick-desc">Record your daily work hours</div>
                </a>
                <a href="<%= request.getContextPath() %>/helpdesk-form.jsp" class="quick-card">
                    <div class="quick-icon">➕</div>
                    <div class="quick-title">Create Ticket</div>
                    <div class="quick-desc">Submit your support request</div>
                </a>
            </div>
        </div>
        <% } %>

        <!-- SYSTEM MODULES -->
        <div class="dashboard-grid">
            <a href="employee/list" class="dashboard-card">
                <div class="card-title">Employee</div>
                <div class="card-description">Directory or manage staff</div>
            </a>
            <a href="leave/list" class="dashboard-card">
                <div class="card-title">Leave Management</div>
                <div class="card-description">Track all leave requests</div>
            </a>
            <a href="attendance/list" class="dashboard-card">
                <div class="card-title">Attendance</div>
                <div class="card-description">View attendance records</div>
            </a>
            <a href="helpdesk/list" class="dashboard-card">
                <div class="card-title">HelpDesk</div>
                <div class="card-description">Manage employee support tickets</div>
            </a>
        </div>
    </div>
</body>
</html>
