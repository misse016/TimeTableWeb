/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ttable.controller;

import com.ttable.dao.LecturerDAO;
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
public class LoginServlet extends HttpServlet {

    private LecturerDAO lecturerDAO;
    Lecturer l;

    public LoginServlet() {
        super();
        lecturerDAO = new LecturerDAO(DbUtil.getConnection());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String name = request.getParameter("username");
        String password = request.getParameter("password");

        l = lecturerDAO.getById(name);
        if (l != null) {
            if (l.validatePassword(password)) {
                //change
                if (!l.getPosition().equals("3")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("lecturer", l.getLecturerId());
                    response.sendRedirect("HomeServlet");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("lecturer", l.getLecturerId());
                    response.sendRedirect("AdminServlet");
                }
                ///change
            } else {
                //out.print("Sorry, username or password error!");
                request.setAttribute("error", "Incorrect user name or password");
                response.sendRedirect("login");
            }
        } else {
            //out.print("Sorry, username or password error!");
            response.sendRedirect("login");
            //request.getRequestDispatcher("login").include(request, response);
        }
        out.close();
    }
}
