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
import com.ttable.model.Lecturer;
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
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Lecturer lecturer;

    private LecturerDAO lecturerDAO;
    private TimetableDAO timetableDAO;
    private DayDAO dayDAO;
    private PeriodDAO periodDAO;

    public HomeServlet() {
        super();
        lecturerDAO = new LecturerDAO(DbUtil.getConnection());
        timetableDAO = new TimetableDAO(DbUtil.getConnection());
        dayDAO = new DayDAO(DbUtil.getConnection());
        periodDAO = new PeriodDAO(DbUtil.getConnection());
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String lecturerId = (String) session.getAttribute("lecturer");
        lecturer = lecturerDAO.getById(lecturerId);

        if (session != null && session.getAttribute("lecturer") != null) {
            //String lecturerId = (String)session.getAttribute("lecturer");
            //lecturer = lecturerDAO.getById(lecturerId);

            if (!lecturer.getPosition().equals("3")) {
                request.setAttribute("currentLecturer", lecturer);
                request.setAttribute("lecturers", lecturerDAO.getAll());
                request.setAttribute("individualList", timetableDAO.getIndividualList(lecturer));

                request.setAttribute("days", dayDAO.getAll());
                request.setAttribute("periods", periodDAO.getAll());

                RequestDispatcher view = request.getRequestDispatcher("home");
                view.forward(request, response);
            } else {
                out.print("ACCESS DENIED");
            }
        } else {
            response.sendRedirect("login");
        }
        out.close();
    }
}
