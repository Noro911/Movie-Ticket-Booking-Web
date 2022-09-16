/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Entity.Movie;
import dao.MovieDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class DetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO movieDAO = new MovieDAO();
        OrderDAO orderDAO = new OrderDAO();
        //-----------------------------------------
        String username = null;
        Cookie[] cookies = request.getCookies();
        if (cookies == null || (cookies.length == 1 && cookies[0].getName().equals("JSESSIONID"))) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            request.setAttribute("user", dao.getCookie(cookies));
            username = dao.getCookie(cookies).getUsername();
            request.getSession().setAttribute("AMOUNT", orderDAO.getToTalOrder(username));
        }
        //-----------------------------------------
        String name = request.getParameter("name");
        String syn = request.getParameter("syn");
        String img = request.getParameter("img");
        String time = request.getParameter("length").trim();
        if (!time.contains("hr")) {
            int length = Integer.parseInt(request.getParameter("length").trim());
            time = "";
            if (length > 60) {
                time = String.valueOf(length / 60) + " hr " + String.valueOf(length % 60) + " min";
            } else {
                time = String.valueOf(length) + " min";
            }
        }
        request.setAttribute("MovieDetail", new Movie(name, time, syn, img));
        request.setAttribute("timeList", movieDAO.getAllShowtime());   
        request.getRequestDispatcher("detailPost.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
