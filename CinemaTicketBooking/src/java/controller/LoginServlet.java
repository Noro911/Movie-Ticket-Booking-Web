/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Entity.User;
import dao.AdminDAO;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username_login");
        String pass = request.getParameter("password_login");
        UserDAO dao = new UserDAO();
        AdminDAO adminDAO=new AdminDAO();
        OrderDAO orderDAO=new OrderDAO();
        if (dao.loginUser(username, pass)==null){
            response.sendRedirect(request.getContextPath() + "/HomeServlet?fail=Wrong user name or password&action=login");
        }else if (dao.loginUser(username, pass).equals("user")) {
            request.removeAttribute("fail");
            Cookie cookie = new Cookie(username, pass);
            cookie.setMaxAge(60 * 60 * 24);
            response.addCookie(cookie);
            String doing=request.getParameter("doing");
            if (doing==null){
                doing="no";
            }
            switch (doing) {
                case "buy":
                    request.getSession().setAttribute("AMOUNT", orderDAO.getToTalOrder(username));
                    response.sendRedirect(request.getContextPath() + "/BuyTicketServlet?name="+request.getParameter("movieName"));
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/HomeServlet");
            }
        } else if (dao.loginUser(username, pass).equals("admin")){
            Cookie cookie = new Cookie(username, pass);
            cookie.setMaxAge(60 * 60 * 24);
            response.addCookie(cookie);
            response.sendRedirect(request.getContextPath() + "/HomeServlet");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
