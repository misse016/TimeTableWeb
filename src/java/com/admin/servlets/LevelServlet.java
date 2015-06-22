/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlets;

import com.ttable.dao.LevelDAO;
import com.ttable.model.Level;
import com.ttable.util.DbUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "Level", urlPatterns = {"/Level"})
public class LevelServlet extends HttpServlet {
    private static String INSERT_OR_EDIT = "/user.jsp";
    private static String LIST_USER = "/listUser.jsp";
    private LevelDAO levelDAO;

    public LevelServlet() {
        super();
        levelDAO = new LevelDAO(DbUtil.getConnection());
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String s = request.getParameter("levelId");
            int levelId = Integer.parseInt(s);
            Level l = levelDAO.getById(levelId);
            levelDAO.delete(l);
            request.setAttribute("levels", levelDAO.getAll());
        } else if (action.equalsIgnoreCase("edit")){
            int levelId = Integer.parseInt(request.getParameter("levelId"));
            Level level = levelDAO.getById(levelId);
            request.setAttribute("level", level);
        }
        response.sendRedirect("AdminServlet");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
