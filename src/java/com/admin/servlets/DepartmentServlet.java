/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.DayDAO;
import com.ttable.dao.DepartmentDAO;
import com.ttable.model.Day;
import com.ttable.model.Department;
import com.ttable.util.DbUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MIS
 */
@WebServlet(name = "DepartmentServlet", urlPatterns = {"/DepartmentServlet"})
public class DepartmentServlet extends HttpServlet {
    DepartmentDAO departmentDAO;
    
    public DepartmentServlet() {
        super();
        departmentDAO = new DepartmentDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("dptId");
            Department d = departmentDAO.getById(s);
            departmentDAO.delete(d);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("dptId");
            Department department = departmentDAO.getById(s);
            request.setAttribute("department", department);
            
        //RequestDispatcher view = request.getRequestDispatcher("mydepartment");
        //view.forward(request, response);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
