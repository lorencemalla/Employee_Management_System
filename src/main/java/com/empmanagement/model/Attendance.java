package com.empmanagement.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Attendance {
    private int attendanceId;
    private int empId;
    private Date attendanceDate;
    private Time checkInTime;
    private Time checkOutTime;
    private String status;
    private String remarks;
    private Timestamp createdAt;
    private String employeeName;

    public Attendance() {}

    // Getters and Setters
    public int getAttendanceId() { return attendanceId; }
    public void setAttendanceId(int attendanceId) { this.attendanceId = attendanceId; }

    public int getEmpId() { return empId; }
    public void setEmpId(int empId) { this.empId = empId; }

    public Date getAttendanceDate() { return attendanceDate; }
    public void setAttendanceDate(Date attendanceDate) { this.attendanceDate = attendanceDate; }

    public Time getCheckInTime() { return checkInTime; }
    public void setCheckInTime(Time checkInTime) { this.checkInTime = checkInTime; }

    public Time getCheckOutTime() { return checkOutTime; }
    public void setCheckOutTime(Time checkOutTime) { this.checkOutTime = checkOutTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
}