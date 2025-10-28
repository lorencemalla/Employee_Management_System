package com.empmanagement.servlet;

import com.empmanagement.dao.AttendanceDAO;
import com.empmanagement.model.Attendance;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@WebServlet("/attendance/*")
public class AttendanceServlet extends HttpServlet {

    private AttendanceDAO attendanceDAO;

    @Override
    public void init() throws ServletException {
        attendanceDAO = new AttendanceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Attendance> attendanceList = attendanceDAO.getAllAttendance();
        request.setAttribute("attendanceList", attendanceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/attendance-list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        int empId = (int) session.getAttribute("empId");

        Attendance attendance = new Attendance();
        attendance.setEmpId(empId);
        attendance.setAttendanceDate(Date.valueOf(request.getParameter("attendanceDate")));
        attendance.setCheckInTime(Time.valueOf(request.getParameter("checkInTime") + ":00"));

        String checkOutTime = request.getParameter("checkOutTime");
        if (checkOutTime != null && !checkOutTime.isEmpty()) {
            attendance.setCheckOutTime(Time.valueOf(checkOutTime + ":00"));
        }

        attendance.setStatus(request.getParameter("status"));
        attendance.setRemarks(request.getParameter("remarks"));

        attendanceDAO.markAttendance(attendance);
        response.sendRedirect(request.getContextPath() + "/attendance/list");
    }
}