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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Employee Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 24px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info span {
            font-size: 14px;
        }

        .btn-logout {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 8px 20px;
            border: 1px solid white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            background: white;
            color: #667eea;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .welcome-section {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .welcome-section h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .welcome-section p {
            color: #666;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .dashboard-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        .card-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            margin-bottom: 20px;
        }

        .card-employee { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
        .card-leave { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); color: white; }
        .card-attendance { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); color: white; }
        .card-helpdesk { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); color: white; }

        .card-title {
            color: #333;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .card-description {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Employee Management System</h1>
        <div class="user-info">
            <span>Welcome, <strong><%= username %></strong> (<%= role %>)</span>
            <a href="logout" class="btn-logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="welcome-section">
            <h2>Dashboard</h2>
            <p>Select a module below to get started</p>
        </div>

        <div class="dashboard-grid">
            <a href="employee/list" class="dashboard-card">
                <div class="card-icon card-employee">👥</div>
                <div class="card-title">Employee</div>
                <div class="card-description">
                    Manage employee records, add new employees, update information, and view employee details
                </div>
            </a>

            <a href="leave/list" class="dashboard-card">
                <div class="card-icon card-leave">📅</div>
                <div class="card-title">Leave</div>
                <div class="card-description">
                    Apply for leave, view leave history, and manage leave approval requests
                </div>
            </a>

            <a href="attendance/list" class="dashboard-card">
                <div class="card-icon card-attendance">✓</div>
                <div class="card-title">Attendance</div>
                <div class="card-description">
                    Mark attendance, view attendance records, and track employee presence
                </div>
            </a>

            <a href="helpdesk/list" class="dashboard-card">
                <div class="card-icon card-helpdesk">🎫</div>
                <div class="card-title">HelpDesk</div>
                <div class="card-description">
                    Create support tickets, view complaints, and track issue resolution
                </div>
            </a>
        </div>
    </div>
</body>
</html>