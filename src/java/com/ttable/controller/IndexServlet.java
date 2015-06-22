/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ttable.controller;

import com.ttable.dao.DayDAO;
import com.ttable.dao.LecturerDAO;
import com.ttable.dao.PeriodDAO;
import com.ttable.dao.TimetableDAO;
import com.ttable.model.Timetable;
import com.ttable.util.DbUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MIS
 */
@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {
    TimetableDAO timetableDAO;
    
    public IndexServlet() {
        super();
        timetableDAO = new TimetableDAO(DbUtil.getConnection());
    }  
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false); 
            List<Timetable> timetables = new ArrayList<Timetable>();
            timetables = timetableDAO.getAll();
        
            request.setAttribute("individualList", timetables);
            
            RequestDispatcher view = request.getRequestDispatcher("index");
            view.forward(request, response);
    } 
    
}
