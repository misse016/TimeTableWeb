/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.FacultyDAO;
import com.ttable.dao.LecturerDAO;
import com.ttable.model.Faculty;
import com.ttable.model.Lecturer;
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
@WebServlet(name = "LecturerServlet", urlPatterns = {"/LecturerServlet"})
public class LecturerServlet extends HttpServlet {
    LecturerDAO lecturerDAO;
    
    public LecturerServlet() {
        super();
        lecturerDAO = new LecturerDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("lecturerId");
            Lecturer l = lecturerDAO.getById(s);
            lecturerDAO.delete(l);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("lecturerId");
            Lecturer lecturer = lecturerDAO.getById(s);
            request.setAttribute("lecturer", lecturer);
            
        //RequestDispatcher view = request.getRequestDispatcher("mylecturer");
        //view.forward(request, response);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
