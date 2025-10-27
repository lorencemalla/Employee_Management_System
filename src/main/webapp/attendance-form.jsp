<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        body { font-family: Arial; background: #f5f6fa; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #4facfe; }
        label { display: block; margin: 15px 0 5px; font-weight: bold; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { background: #4facfe; color: white; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; margin-top: 20px; }
        button:hover { background: #3d8ad4; }
        .back { color: #4facfe; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.jsp" class="back">← Back to Dashboard</a>
        <h2>Mark Attendance</h2>
        <form action="<%= request.getContextPath() %>/attendance/mark" method="post">
            <label>Date *</label>
            <input type="date" name="attendanceDate" required>
            
            <label>Check-In Time *</label>
            <input type="time" name="checkInTime" required>
            
            <label>Check-Out Time</label>
            <input type="time" name="checkOutTime">
            
            <label>Status *</label>
            <select name="status" required>
                <option value="PRESENT">Present</option>
                <option value="HALF_DAY">Half Day</option>
                <option value="ABSENT">Absent</option>
                <option value="WORK_FROM_HOME">Work From Home</option>
            </select>
            
            <label>Remarks</label>
            <input type="text" name="remarks">
            
            <button type="submit">Mark Attendance</button>
        </form>
    </div>
</body>
</html>
