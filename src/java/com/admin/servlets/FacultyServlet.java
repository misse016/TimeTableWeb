/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.DepartmentDAO;
import com.ttable.dao.FacultyDAO;
import com.ttable.model.Department;
import com.ttable.model.Faculty;
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
@WebServlet(name = "FacultyServlet", urlPatterns = {"/FacultyServlet"})
public class FacultyServlet extends HttpServlet {
    FacultyDAO facultyDAO;
    
    public FacultyServlet() {
        super();
        facultyDAO = new FacultyDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("facultyId");
            Faculty f = facultyDAO.getById(s);
            facultyDAO.delete(f);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("facultyId");
            Faculty faculty = facultyDAO.getById(s);
            request.setAttribute("faculty", faculty);
            
        //RequestDispatcher view = request.getRequestDispatcher("myfaculty");
        //view.forward(request, response);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
