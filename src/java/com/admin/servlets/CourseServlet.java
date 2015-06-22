/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.CourseDAO;
import com.ttable.dao.LevelDAO;
import com.ttable.model.Course;
import com.ttable.model.Level;
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
@WebServlet(name = "CourseServlet", urlPatterns = {"/CourseServlet"})
public class CourseServlet extends HttpServlet {
    CourseDAO courseDAO;
    
    public CourseServlet() {
        super();
        courseDAO = new CourseDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("courseCode");
            
            Course c = courseDAO.getById(s);
            courseDAO.delete(c);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("courseCode");
            Course course = courseDAO.getById(s);
            request.setAttribute("course", course);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
