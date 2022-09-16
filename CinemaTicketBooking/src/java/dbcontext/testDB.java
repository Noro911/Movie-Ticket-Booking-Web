/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dbcontext;

import Entity.Cinema;
import Entity.Movie;
import Entity.Showtime;
import Entity.User;
import Entity.basket;
import dao.MovieDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.http.Cookie;

/**
 *
 * @author USER
 */
public class testDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserDAO dao=new UserDAO();
        System.out.println(dao.usernameCheck("jjj"));
    }
    
}
