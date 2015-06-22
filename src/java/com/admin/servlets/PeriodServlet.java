/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.DayDAO;
import com.ttable.dao.PeriodDAO;
import com.ttable.model.Day;
import com.ttable.model.Period;
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
@WebServlet(name = "PeriodServlet", urlPatterns = {"/PeriodServlet"})
public class PeriodServlet extends HttpServlet {
    private PeriodDAO periodDAO;

    public PeriodServlet() {
        super();
        periodDAO= new PeriodDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("periodId");
            int i = Integer.parseInt(s);
            Period p = periodDAO.getById(i);
            periodDAO.delete(p);
        } else if (action.equalsIgnoreCase("edit")){
            String s = request.getParameter("periodId");
            int i = Integer.parseInt(s);
            Period period = periodDAO.getById(i);
            request.setAttribute("period", period);
            
        //RequestDispatcher view = request.getRequestDispatcher("myperiod");
        //view.forward(request, response);
        }        
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
