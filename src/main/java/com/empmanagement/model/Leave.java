package com.empmanagement.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Leave {
    private int leaveId;
    private int empId;
    private int leaveTypeId;
    private String leaveTypeName;
    private Date startDate;
    private Date endDate;
    private int totalDays;
    private String reason;
    private String status;
    private Timestamp appliedDate;
    private Integer approvedBy;
    private Timestamp approvedDate;
    private String remarks;
    private String employeeName;

    public Leave() {}

    // Getters and Setters
    public int getLeaveId() { return leaveId; }
    public void setLeaveId(int leaveId) { this.leaveId = leaveId; }

    public int getEmpId() { return empId; }
    public void setEmpId(int empId) { this.empId = empId; }

    public int getLeaveTypeId() { return leaveTypeId; }
    public void setLeaveTypeId(int leaveTypeId) { this.leaveTypeId = leaveTypeId; }

    public String getLeaveTypeName() { return leaveTypeName; }
    public void setLeaveTypeName(String leaveTypeName) { this.leaveTypeName = leaveTypeName; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public int getTotalDays() { return totalDays; }
    public void setTotalDays(int totalDays) { this.totalDays = totalDays; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getAppliedDate() { return appliedDate; }
    public void setAppliedDate(Timestamp appliedDate) { this.appliedDate = appliedDate; }

    public Integer getApprovedBy() { return approvedBy; }
    public void setApprovedBy(Integer approvedBy) { this.approvedBy = approvedBy; }

    public Timestamp getApprovedDate() { return approvedDate; }
    public void setApprovedDate(Timestamp approvedDate) { this.approvedDate = approvedDate; }

    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }

    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
}