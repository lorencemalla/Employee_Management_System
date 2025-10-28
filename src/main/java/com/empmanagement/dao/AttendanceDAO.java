package com.empmanagement.dao;

import com.empmanagement.model.Attendance;
import com.empmanagement.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    public List<Attendance> getAllAttendance() {
        List<Attendance> attendanceList = new ArrayList<>();
        String query = "SELECT a.*, CONCAT(e.first_name, ' ', e.last_name) as employee_name " +
                      "FROM attendance a JOIN employees e ON a.emp_id = e.emp_id ORDER BY a.attendance_date DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Attendance attendance = new Attendance();
                attendance.setAttendanceId(rs.getInt("attendance_id"));
                attendance.setEmpId(rs.getInt("emp_id"));
                attendance.setAttendanceDate(rs.getDate("attendance_date"));
                attendance.setCheckInTime(rs.getTime("check_in_time"));
                attendance.setCheckOutTime(rs.getTime("check_out_time"));
                attendance.setStatus(rs.getString("status"));
                attendance.setEmployeeName(rs.getString("employee_name"));
                attendanceList.add(attendance);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return attendanceList;
    }

    public boolean markAttendance(Attendance attendance) {
        String query = "INSERT INTO attendance (emp_id, attendance_date, check_in_time, check_out_time, status, remarks) " +
                      "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, attendance.getEmpId());
            pstmt.setDate(2, attendance.getAttendanceDate());
            pstmt.setTime(3, attendance.getCheckInTime());
            pstmt.setTime(4, attendance.getCheckOutTime());
            pstmt.setString(5, attendance.getStatus());
            pstmt.setString(6, attendance.getRemarks());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}