/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AdminDAO;
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
public class HomeServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        MovieDAO movieDAO = new MovieDAO();
        OrderDAO orderDAO = new OrderDAO();
        String action= request.getParameter("action");
        String doing=request.getParameter("doing");
        String fail=request.getParameter("fail");
        String usernameError=request.getParameter("usernameError");
        if (action==null){
            action="no";
        }
        if (doing==null){
            doing="no";
        }
        if (fail==null){
            fail="no";
        }
        if (usernameError==null){
            usernameError="no";
        }
        request.setAttribute("ACTION", action);
        if (cookies == null || (cookies.length == 1 && cookies[0].getName().equals("JSESSIONID"))) {
            request.setAttribute("movieList", movieDAO.getAllMovies());
            request.setAttribute("timeList", movieDAO.getAllShowtime());
            if (action.equals("login") || action.equals("regis")){
                if (doing.equals("buy")){
                    request.setAttribute("movieName", request.getParameter("movieName"));
                }
                request.setAttribute("usernameError", usernameError);
                request.setAttribute("doing", doing);
                request.setAttribute("fail", fail);
                request.getRequestDispatcher("Login/loginform.jsp").forward(request, response);
            } else {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        } else {
            UserDAO dao = new UserDAO();
            String role = dao.getCookie(cookies).getRole();
            if (role.equals("user")) {
                request.setAttribute("movieList", movieDAO.getAllMovies());
                request.setAttribute("timeList", movieDAO.getAllShowtime());
                request.getSession().setAttribute("AMOUNT", orderDAO.getToTalOrder(dao.getCookie(cookies).getUsername()));
                request.setAttribute("user", dao.getCookie(cookies));
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else if (role.equals("admin")) {
                request.setAttribute("user", dao.getCookie(cookies));
                request.getRequestDispatcher("adminHomepage.jsp").forward(request, response);
            }
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
