/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Entity.User;
import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;

/**
 *
 * @author USER
 */
public class UserDAO {

    public String loginUser(String username, String pass) {
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select role from Customers where username=? and passwd=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
                stm.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public boolean registerUser(User u) {
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement stm = null;
        con = db.openConnection();
        try {
            String sql = "insert into Customers values (?,?,?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, u.getId());
            stm.setString(2, u.getName());
            stm.setString(3, u.getUsername());
            stm.setString(4, u.getPass());
            stm.setString(5, "user");
            int rs = stm.executeUpdate();
            if (rs == 1) {
                System.out.println("Success");
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public int getToTalUser() {
        int total = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select count(*) from Customers";

        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
//            ps.setString(1, "user");
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return total;
    }

    public User getUser(String username) {
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select * from Customers where username=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String role = rs.getString(5);
                return new User(id, name, username, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getCookie(Cookie[] cookies){
        Cookie cookie = cookies[0];
            if (cookie.getName().equals("JSESSIONID")) {
                cookie = cookies[1];
            }
        UserDAO dao = new UserDAO();
        return dao.getUser(cookie.getName());
    }
    
    public boolean usernameCheck(String username) {
        int total = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select count(*) from Customers where username=?";

        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
            if (total>0) return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
}
