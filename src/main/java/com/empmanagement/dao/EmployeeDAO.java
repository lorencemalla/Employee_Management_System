package com.empmanagement.dao;

import com.empmanagement.model.Employee;
import com.empmanagement.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        String query = "SELECT * FROM employees ORDER BY emp_id DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Employee emp = extractEmployeeFromResultSet(rs);
                employees.add(emp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public Employee getEmployeeById(int empId) {
        Employee employee = null;
        String query = "SELECT * FROM employees WHERE emp_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, empId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                employee = extractEmployeeFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employee;
    }

    public Employee getEmployeeByUserId(int userId) {
        Employee employee = null;
        String query = "SELECT * FROM employees WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                employee = extractEmployeeFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employee;
    }

    public boolean insertEmployee(Employee employee) {
        String query = "INSERT INTO employees (user_id, first_name, last_name, phone, " +
                      "department, designation, date_of_joining, salary, address, city, state, pincode) " +
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, employee.getUserId());
            pstmt.setString(2, employee.getFirstName());
            pstmt.setString(3, employee.getLastName());
            pstmt.setString(4, employee.getPhone());
            pstmt.setString(5, employee.getDepartment());
            pstmt.setString(6, employee.getDesignation());
            pstmt.setDate(7, employee.getDateOfJoining());
            pstmt.setDouble(8, employee.getSalary());
            pstmt.setString(9, employee.getAddress());
            pstmt.setString(10, employee.getCity());
            pstmt.setString(11, employee.getState());
            pstmt.setString(12, employee.getPincode());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateEmployee(Employee employee) {
        String query = "UPDATE employees SET first_name = ?, last_name = ?, phone = ?, " +
                      "department = ?, designation = ?, date_of_joining = ?, salary = ?, " +
                      "address = ?, city = ?, state = ?, pincode = ? WHERE emp_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, employee.getFirstName());
            pstmt.setString(2, employee.getLastName());
            pstmt.setString(3, employee.getPhone());
            pstmt.setString(4, employee.getDepartment());
            pstmt.setString(5, employee.getDesignation());
            pstmt.setDate(6, employee.getDateOfJoining());
            pstmt.setDouble(7, employee.getSalary());
            pstmt.setString(8, employee.getAddress());
            pstmt.setString(9, employee.getCity());
            pstmt.setString(10, employee.getState());
            pstmt.setString(11, employee.getPincode());
            pstmt.setInt(12, employee.getEmpId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEmployee(int empId) {
        String query = "DELETE FROM employees WHERE emp_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, empId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Employee extractEmployeeFromResultSet(ResultSet rs) throws SQLException {
        Employee emp = new Employee();
        emp.setEmpId(rs.getInt("emp_id"));
        emp.setUserId(rs.getInt("user_id"));
        emp.setFirstName(rs.getString("first_name"));
        emp.setLastName(rs.getString("last_name"));
        emp.setPhone(rs.getString("phone"));
        emp.setDepartment(rs.getString("department"));
        emp.setDesignation(rs.getString("designation"));
        emp.setDateOfJoining(rs.getDate("date_of_joining"));
        emp.setSalary(rs.getDouble("salary"));
        emp.setAddress(rs.getString("address"));
        emp.setCity(rs.getString("city"));
        emp.setState(rs.getString("state"));
        emp.setPincode(rs.getString("pincode"));
        emp.setCreatedAt(rs.getTimestamp("created_at"));
        emp.setUpdatedAt(rs.getTimestamp("updated_at"));
        return emp;
    }
}