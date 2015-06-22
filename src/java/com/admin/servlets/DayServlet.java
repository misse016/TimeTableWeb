/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.ClassroomDAO;
import com.ttable.dao.DayDAO;
import com.ttable.model.Classroom;
import com.ttable.model.Day;
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
@WebServlet(name = "DayServlet", urlPatterns = {"/DayServlet"})
public class DayServlet extends HttpServlet {
    private DayDAO dayDAO;

    public DayServlet() {
        super();
        dayDAO= new DayDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("dayName");
            Day d = dayDAO.getById(s);
            dayDAO.delete(d);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("dayName");
            Day day = dayDAO.getById(s);
            request.setAttribute("day", day);
            
        //RequestDispatcher view = request.getRequestDispatcher("myday");
        //view.forward(request, response);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
}
