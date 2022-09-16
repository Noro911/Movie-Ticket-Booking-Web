/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MovieDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class BuyTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyTicketServlet at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        if (cookies == null || (cookies.length == 1 && cookies[0].getName().equals("JSESSIONID"))) {
            String name = request.getParameter("name");
            response.sendRedirect("http://localhost:8080/CinemaTicketBooking/HomeServlet?action=login&doing=buy&movieName="+name);
        } else {
            UserDAO dao = new UserDAO();
            request.setAttribute("user", dao.getCookie(cookies));
            MovieDAO movieDAO = new MovieDAO();
            String name = request.getParameter("name");
            if (name == null) {
                name = (String) request.getSession().getAttribute("movieName");
            }
            String location = request.getParameter("location");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            
            String currentTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
            request.setAttribute("CURRENT", currentTime);
            
            request.getSession().setAttribute("movieName", name);
            request.setAttribute("movieLocation", location);
            request.setAttribute("movieTime", time);
            request.setAttribute("movieDate", date);
            request.setAttribute("timeList", movieDAO.getAllShowtime());
            request.setAttribute("cinemaList", movieDAO.getAllCinemas());
            request.getRequestDispatcher("buyTicketForm.jsp").forward(request, response);
        }

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
