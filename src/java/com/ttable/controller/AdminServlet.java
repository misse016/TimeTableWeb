/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ttable.controller;

import com.ttable.dao.ClassroomDAO;
import com.ttable.dao.CourseDAO;
import com.ttable.dao.DayDAO;
import com.ttable.dao.DepartmentDAO;
import com.ttable.dao.FacultyDAO;
import com.ttable.dao.LecturerDAO;
import com.ttable.dao.LevelDAO;
import com.ttable.dao.PeriodDAO;
import com.ttable.dao.TimetableDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author MIS
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    Lecturer lecturer;
    ClassroomDAO classroomDAO;
    CourseDAO courseDAO;
    DayDAO dayDAO;
    DepartmentDAO departmentDAO;
    FacultyDAO facultyDAO;
    LecturerDAO lecturerDAO;
    LevelDAO levelDAO;
    PeriodDAO periodDAO;
    TimetableDAO timetableDAO;

    public AdminServlet() {
        super();
        classroomDAO = new ClassroomDAO(DbUtil.getConnection());
        courseDAO = new CourseDAO(DbUtil.getConnection());
        dayDAO = new DayDAO(DbUtil.getConnection());
        departmentDAO = new DepartmentDAO(DbUtil.getConnection());
        facultyDAO = new FacultyDAO(DbUtil.getConnection());
        lecturerDAO = new LecturerDAO(DbUtil.getConnection());
        levelDAO = new LevelDAO(DbUtil.getConnection());
        periodDAO = new PeriodDAO(DbUtil.getConnection());
        timetableDAO = new TimetableDAO(DbUtil.getConnection());

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String lecturerId = (String) session.getAttribute("lecturer");
        lecturer = lecturerDAO.getById(lecturerId);

        if (session != null && session.getAttribute("lecturer") != null) {
            //String lecturerId = (String)session.getAttribute("lecturer");
            //Lecturer lecturer = lecturerDAO.getById(lecturerId);
            if (lecturer.getPosition().equals("3")) {
                request.setAttribute("currentLecturer", lecturer);
                request.setAttribute("classrooms", classroomDAO.getAll());
                request.setAttribute("courses", courseDAO.getAll());
                request.setAttribute("days", dayDAO.getAll());
                request.setAttribute("departments", departmentDAO.getAll());
                request.setAttribute("faculties", facultyDAO.getAll());
                request.setAttribute("lecturers", lecturerDAO.getAll());
                request.setAttribute("levels", levelDAO.getAll());
                request.setAttribute("periods", periodDAO.getAll());
                request.setAttribute("timetables", timetableDAO.getAll());

                RequestDispatcher view = request.getRequestDispatcher("admin");
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
