/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.PeriodDAO;
import com.ttable.dao.TimetableDAO;
import com.ttable.model.Period;
import com.ttable.model.Timetable;
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
@WebServlet(name = "TimetableServlet", urlPatterns = {"/TimetableServlet"})
public class TimetableServlet extends HttpServlet {
    private TimetableDAO timetableDAO;

    public TimetableServlet() {
        super();
        timetableDAO= new TimetableDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("timetableId");
            int i = Integer.parseInt(s);
            Timetable t = timetableDAO.getById(i);
            timetableDAO.delete(t);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("timetableId");
            Timetable timetable = timetableDAO.getById(s);
            request.setAttribute("timetable", timetable);
            
        //RequestDispatcher view = request.getRequestDispatcher("myperiod");
        //view.forward(request, response);
        }        
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
