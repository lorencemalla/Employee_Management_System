package com.empmanagement.servlet;

import com.empmanagement.dao.EmployeeDAO;
import com.empmanagement.dao.UserDAO;
import com.empmanagement.model.Employee;
import com.empmanagement.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/employee/*")
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        employeeDAO = new EmployeeDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();
        if (action == null) action = "/list";

        try {
            switch (action) {
                case "/list":
                    listEmployees(request, response);
                    break;
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deleteEmployee(request, response);
                    break;
                default:
                    listEmployees(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();

        try {
            if ("/insert".equals(action)) {
                insertEmployee(request, response);
            } else if ("/update".equals(action)) {
                updateEmployee(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listEmployees(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> employees = employeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employee-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employee-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int empId = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeDAO.getEmployeeById(empId);
        request.setAttribute("employee", existingEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employee-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setRole("EMPLOYEE");

        if (userDAO.createUser(user)) {
            User createdUser = userDAO.authenticateUser(request.getParameter("username"), request.getParameter("password"));

            Employee employee = new Employee();
            employee.setUserId(createdUser.getUserId());
            employee.setFirstName(request.getParameter("firstName"));
            employee.setLastName(request.getParameter("lastName"));
            employee.setPhone(request.getParameter("phone"));
            employee.setDepartment(request.getParameter("department"));
            employee.setDesignation(request.getParameter("designation"));
            employee.setDateOfJoining(Date.valueOf(request.getParameter("dateOfJoining")));
            employee.setSalary(Double.parseDouble(request.getParameter("salary")));
            employee.setAddress(request.getParameter("address"));
            employee.setCity(request.getParameter("city"));
            employee.setState(request.getParameter("state"));
            employee.setPincode(request.getParameter("pincode"));

            employeeDAO.insertEmployee(employee);
        }

        response.sendRedirect(request.getContextPath() + "/employee/list");
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int empId = Integer.parseInt(request.getParameter("empId"));

        Employee employee = new Employee();
        employee.setEmpId(empId);
        employee.setFirstName(request.getParameter("firstName"));
        employee.setLastName(request.getParameter("lastName"));
        employee.setPhone(request.getParameter("phone"));
        employee.setDepartment(request.getParameter("department"));
        employee.setDesignation(request.getParameter("designation"));
        employee.setDateOfJoining(Date.valueOf(request.getParameter("dateOfJoining")));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setAddress(request.getParameter("address"));
        employee.setCity(request.getParameter("city"));
        employee.setState(request.getParameter("state"));
        employee.setPincode(request.getParameter("pincode"));

        employeeDAO.updateEmployee(employee);
        response.sendRedirect(request.getContextPath() + "/employee/list");
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int empId = Integer.parseInt(request.getParameter("id"));
        employeeDAO.deleteEmployee(empId);
        response.sendRedirect(request.getContextPath() + "/employee/list");
    }
}