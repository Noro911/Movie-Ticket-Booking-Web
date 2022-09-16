/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Entity.Movie;
import Entity.basket;
import dao.AdminDAO;
import dao.MovieDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class tableServlet extends HttpServlet {

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
            out.println("<title>Servlet tableServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tableServlet at " + request.getContextPath() + "</h1>");
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
        //-------------------------------
        String username = null;
        Cookie[] cookies = request.getCookies();
        if (cookies == null || (cookies.length == 1 && cookies[0].getName().equals("JSESSIONID"))) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            request.setAttribute("user", dao.getCookie(cookies));
            username = dao.getCookie(cookies).getUsername();
        }
        //-----------------------------------------
        String action = request.getParameter("action");
        MovieDAO movieDAO = new MovieDAO();
        OrderDAO orderDAO = new OrderDAO();
        if (action.equals("movie")) {
            String subact = request.getParameter("subact");
            //--------------------------------------------------------
            int page = Integer.parseInt(request.getParameter("page"));
            ArrayList<Movie> mList = movieDAO.getMovieEachPage(page);
            int total = movieDAO.getAllMovies().size();
            if (total % 5 == 0) {
                request.setAttribute("totalPage", total / 5);
            } else {
                request.setAttribute("totalPage", total / 5 + 1);
            }
            //--------------------------------------------------------
            if (subact.equals("delete")) {
                String id = request.getParameter("id");
                movieDAO.deleteMovie(id);
                mList = movieDAO.getMovieEachPage(page);
                request.setAttribute("movieList", mList);
                request.getRequestDispatcher("moviesTable.jsp").forward(request, response);
            } else if (subact.equals("update")) {
                String id = request.getParameter("id");
                request.setAttribute("id", id);
                request.getRequestDispatcher("movieForm.jsp").forward(request, response);
            } else if (subact.equals("add")) {
                String availID = "mv";
                if (total+1 < 10) {
                    availID = availID + "0" + String.valueOf(total+1);
                } else {
                    availID = availID + String.valueOf(total+1);
                }
                request.setAttribute("availID", availID);
                request.getRequestDispatcher("movieForm.jsp").forward(request, response);
            } else if (subact.equals("deletecheckbox")) {
                String[] options = request.getParameterValues("options");
                if (options != null) {
                    for (String op : options) {
                        movieDAO.deleteMovie(op);
                    }
                }
                request.setAttribute("movieList", mList);
                request.getRequestDispatcher("moviesTable.jsp").forward(request, response);
            } else {
                request.setAttribute("movieList", mList);
                request.getRequestDispatcher("moviesTable.jsp").forward(request, response);
            }
        } else if (action.equals("order")) {
            String subact = request.getParameter("subact");
            //--------------------------------------------------------
            int page = Integer.parseInt(request.getParameter("page"));
            ArrayList<basket> oList = orderDAO.getMovieEachPage(page);
            int total = orderDAO.getToTalOrderAdmin();
            if (total % 5 == 0) {
                request.setAttribute("totalPage", total / 5);
            } else {
                request.setAttribute("totalPage", total / 5 + 1);
            }
            //--------------------------------------------------------
            if (subact.equals("delete")) {
                String id = request.getParameter("id");
                orderDAO.deleteOrder(id);
                oList = orderDAO.getMovieEachPage(page);
                request.setAttribute("orderList", oList);
                request.getRequestDispatcher("ordersTable.jsp").forward(request, response);
            } else {
                request.setAttribute("orderList", oList);
                request.getRequestDispatcher("ordersTable.jsp").forward(request, response);
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
        //-------------------------------
        String username = null;
        Cookie[] cookies = request.getCookies();
        if (cookies == null || (cookies.length == 1 && cookies[0].getName().equals("JSESSIONID"))) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            request.setAttribute("user", dao.getCookie(cookies));
            username = dao.getCookie(cookies).getUsername();
        }
        //-----------------------------------------
        String action = request.getParameter("action");
        String subact = request.getParameter("subact");
        switch (action) {
            case "movie": {
                MovieDAO movieDAO = new MovieDAO();
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String length = request.getParameter("length");
                String syn = request.getParameter("syn");
                String img = request.getParameter("img");
                String poster = request.getParameter("poster");
                Movie m = new Movie(id, name, 13, length, syn, img, poster);
                switch (subact) {
                    case "add": {
                        movieDAO.addMovie(m);
                        break;
                    }
                    case "update": {
                        movieDAO.updateMovie(m);
                        break;
                    }

                }
                //----------------------------------------------------------
                int page = 1;
                ArrayList<Movie> mList = movieDAO.getMovieEachPage(page);
                int total = movieDAO.getAllMovies().size();
                if (total % 5 == 0) {
                    request.setAttribute("totalPage", total / 5);
                } else {
                    request.setAttribute("totalPage", total / 5 + 1);
                }
                //----------------------------------------------------------
                request.setAttribute("movieList", mList);
                request.getRequestDispatcher("moviesTable.jsp").forward(request, response);
                break;
            }
        }
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
