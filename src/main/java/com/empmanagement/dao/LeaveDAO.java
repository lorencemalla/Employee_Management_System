package com.empmanagement.dao;

import com.empmanagement.model.Leave;
import com.empmanagement.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveDAO {

    public List<Leave> getAllLeaves() {
        List<Leave> leaves = new ArrayList<>();
        String query = "SELECT l.*, lt.leave_type_name, CONCAT(e.first_name, ' ', e.last_name) as employee_name " +
                      "FROM leaves l JOIN leave_types lt ON l.leave_type_id = lt.leave_type_id " +
                      "JOIN employees e ON l.emp_id = e.emp_id ORDER BY l.applied_date DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Leave leave = new Leave();
                leave.setLeaveId(rs.getInt("leave_id"));
                leave.setEmpId(rs.getInt("emp_id"));
                leave.setLeaveTypeId(rs.getInt("leave_type_id"));
                leave.setLeaveTypeName(rs.getString("leave_type_name"));
                leave.setStartDate(rs.getDate("start_date"));
                leave.setEndDate(rs.getDate("end_date"));
                leave.setTotalDays(rs.getInt("total_days"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                leave.setAppliedDate(rs.getTimestamp("applied_date"));
                leave.setEmployeeName(rs.getString("employee_name"));
                leaves.add(leave);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaves;
    }

    public List<Leave> getLeavesByEmployeeId(int empId) {
        List<Leave> leaves = new ArrayList<>();
        String query = "SELECT l.*, lt.leave_type_name, CONCAT(e.first_name, ' ', e.last_name) as employee_name " +
                      "FROM leaves l JOIN leave_types lt ON l.leave_type_id = lt.leave_type_id " +
                      "JOIN employees e ON l.emp_id = e.emp_id WHERE l.emp_id = ? ORDER BY l.applied_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, empId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Leave leave = new Leave();
                leave.setLeaveId(rs.getInt("leave_id"));
                leave.setEmpId(rs.getInt("emp_id"));
                leave.setLeaveTypeName(rs.getString("leave_type_name"));
                leave.setStartDate(rs.getDate("start_date"));
                leave.setEndDate(rs.getDate("end_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                leave.setEmployeeName(rs.getString("employee_name"));
                leaves.add(leave);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaves;
    }

    public boolean applyLeave(Leave leave) {
        String query = "INSERT INTO leaves (emp_id, leave_type_id, start_date, end_date, total_days, reason) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, leave.getEmpId());
            pstmt.setInt(2, leave.getLeaveTypeId());
            pstmt.setDate(3, leave.getStartDate());
            pstmt.setDate(4, leave.getEndDate());
            pstmt.setInt(5, leave.getTotalDays());
            pstmt.setString(6, leave.getReason());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateLeaveStatus(int leaveId, String status, int approvedBy, String remarks) {
        String query = "UPDATE leaves SET status = ?, approved_by = ?, approved_date = ?, remarks = ? WHERE leave_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, approvedBy);
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(4, remarks);
            pstmt.setInt(5, leaveId);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<String> getAllLeaveTypes() {
        List<String> leaveTypes = new ArrayList<>();
        String query = "SELECT leave_type_name FROM leave_types";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                leaveTypes.add(rs.getString("leave_type_name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaveTypes;
    }
}