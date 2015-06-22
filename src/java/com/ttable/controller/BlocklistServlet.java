/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ttable.controller;

import com.ttable.dao.DayDAO;
import com.ttable.dao.PeriodDAO;
import com.ttable.dao.TimetableDAO;
import com.ttable.model.Day;
import com.ttable.model.Period;
import com.ttable.model.Timetable;
import com.ttable.util.DbUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MIS
 */
public class BlocklistServlet extends HttpServlet {

    TimetableDAO timetableDAO;
    DayDAO dayDAO;
    PeriodDAO periodDAO;

    public BlocklistServlet() {
        super();
        timetableDAO = new TimetableDAO(DbUtil.getConnection());
        dayDAO = new DayDAO(DbUtil.getConnection());
        periodDAO = new PeriodDAO(DbUtil.getConnection());
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dayName = request.getParameter("dayName");
        String p = request.getParameter("myPeriod");
        int periodId = Integer.parseInt(p);
        
        Day day = dayDAO.getById(dayName);
        Period period = periodDAO.getById(periodId);
        List<Timetable> timetables = new ArrayList<Timetable>();
        timetables = timetableDAO.getBlockedList(day, period);
        
        request.setAttribute("day", day);
        request.setAttribute("period", period);  
        request.setAttribute("timetables", timetables);
        
        RequestDispatcher view = request.getRequestDispatcher("blocklist");
        view.forward(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("blocklist");
        view.forward(request, response);
    }
}
