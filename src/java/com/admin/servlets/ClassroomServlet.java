/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.ClassroomDAO;
import com.ttable.dao.LevelDAO;
import com.ttable.model.Classroom;
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
@WebServlet(name = "ClassroomServlet", urlPatterns = {"/ClassroomServlet"})
public class ClassroomServlet extends HttpServlet {

    private ClassroomDAO classroomDAO;

    public ClassroomServlet() {
        super();
        classroomDAO= new ClassroomDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("classroomId");
            Classroom c = classroomDAO.getById(s);
            classroomDAO.delete(c);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("classroomId");
            Classroom classroom = classroomDAO.getById(s);
            request.setAttribute("classroom", classroom);
            
        RequestDispatcher view = request.getRequestDispatcher("myclassroom");
        view.forward(request, response);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
