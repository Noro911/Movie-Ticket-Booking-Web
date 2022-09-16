/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Entity.basket;
import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USER
 */
public class OrderDAO {
    public void addOrder(basket b, String username){
        String sql = "insert into Orders values (?,?,?,?,?,?,?,?);";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        String customerID= getIdFrom("Customers","username",username,1);
        String movieID= getIdFrom("Movies", "moiveName", b.getName(),1);
        String showTimeID= getIdFrom("ShowTimes", "showTime", b.getTime(),1);
        String cinemaID= getIdFrom("Cinemas", "locationName", b.getLocation(),1);
        String orderID=customerID.substring(2)+getMovieShowtime(movieID, showTimeID).substring(3)+cinemaID.substring(3);
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, orderID);
            statement.setString(2, customerID);
            statement.setString(3, getMovieShowtime(movieID, showTimeID));
            statement.setString(4, cinemaID);
            statement.setString(5, b.getDate());
            statement.setString(6, String.valueOf(b.getQuantity()));
            statement.setString(7, String.valueOf(b.getQuantity()*13));
            statement.setString(8, null);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getToTalOrder(String username) {
        int total = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select count(*) from Orders where customerID=? and checkoutTime is null";

        try {
            conn = db.openConnection();
            String customerID=getIdFrom("Customers", "username", username, 1);
            ps = conn.prepareStatement(query);
            ps.setString(1, customerID);
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
    
     public int getToTalOrderAdmin() {
        int total = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select count(*) from Orders";

        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
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
    
    public String getMovieShowtime(String movieId, String timeId){
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select * from MovieShowTimes where movieID=? and showTimeID=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, movieId);
            stm.setString(2, timeId);
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
    
    public String getIdFrom(String table, String col, String value, int index){
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select * from "+table+" where "+col+" like ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, value);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(index);
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
    
    public ArrayList<basket> getAllOrderOfUser(String username){
        ArrayList<basket> bList = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String customerID=getIdFrom("Customers", "username", username, 1);
            String sql = "Select * from Orders where customerID=? and checkoutTime is null";
            statement = con.prepareStatement(sql);
            statement.setString(1, customerID);
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String movieShowTimeID=rs.getString(3);
                String movieID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,2);
                String movieName=getIdFrom("Movies", "movieID", movieID,2);
                String cinemID=rs.getString(4);
                String cinema=getIdFrom("Cinemas", "cinemaID", cinemID, 2);
                String date=rs.getString(5).substring(0,10);
                String showtimeID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,3);
                String showtime=getIdFrom("ShowTimes", "showTimeID", showtimeID,2);
                int quantity=Integer.parseInt(rs.getString(6));
                bList.add(new basket(id, movieName,cinema,date,showtime,13,quantity));
            }
            return bList;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public void updateOrder(String value, String id, String col){
        String sql = "update Orders set "+col+"=? where orderID=?;";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement=con.prepareStatement(sql);
            statement.setString(1, value);
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void deleteOrder(String id){
        String sql = "delete Orders where orderID=?;";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public ArrayList<basket> getMovieEachPage(int page) {
        ArrayList<basket> list = new ArrayList<>();
        String query = "select * from Orders order by customerID offset ? rows fetch next ? rows only";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(query);
            statement.setInt(1, 5*(page-1));
            statement.setInt(2, 5);
            rs=statement.executeQuery();
            while (rs.next()){
                String id = rs.getString(1).trim();
                String customerID=rs.getString(2);
                String movieShowTimeID=rs.getString(3);
                String movieID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,2);
                String movieName=getIdFrom("Movies", "movieID", movieID,2);
                String cinemID=rs.getString(4);
                String cinema=getIdFrom("Cinemas", "cinemaID", cinemID, 2);
                String date=rs.getString(5).substring(0,10);
                String showtimeID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,3);
                String showtime=getIdFrom("ShowTimes", "showTimeID", showtimeID,2);
                int quantity=Integer.parseInt(rs.getString(6));
                list.add(new basket(id, customerID, movieName,cinema,date,showtime,13,quantity));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                con.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public ArrayList<String> getCheckOutTimes(String username){
        ArrayList<String> times= new ArrayList<>();
        String query = "Select checkoutTime from Orders where checkoutTime is not null and customerID=? group by checkoutTime order by checkoutTime desc";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String customerID=getIdFrom("Customers", "username", username, 1);
            statement = con.prepareStatement(query);
            statement.setString(1, customerID);
            rs=statement.executeQuery();
            while (rs.next()){
                times.add(rs.getString(1).substring(0,19));
            }
            return times;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                con.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public ArrayList<basket> getInvoice(String time, String username){
        ArrayList<basket> orders= new ArrayList<>();
        String query = "select * from Orders where customerID=? and checkoutTime=?";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String customerID=getIdFrom("Customers", "username", username, 1);
            statement = con.prepareStatement(query);
            statement.setString(1, customerID);
            statement.setString(2, time);
            rs=statement.executeQuery();
            while (rs.next()){
                String id = rs.getString(1).trim();
                String movieShowTimeID=rs.getString(3);
                String movieID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,2);
                String movieName=getIdFrom("Movies", "movieID", movieID,2);
                String cinemID=rs.getString(4);
                String cinema=getIdFrom("Cinemas", "cinemaID", cinemID, 2);
                String date=rs.getString(5).substring(0,10);
                String showtimeID=getIdFrom("MovieShowTimes", "movieShowtimeID", movieShowTimeID,3);
                String showtime=getIdFrom("ShowTimes", "showTimeID", showtimeID,2);
                int quantity=Integer.parseInt(rs.getString(6));
                orders.add(new basket(id, customerID, movieName,cinema,date,showtime,13,quantity, getImgByID(movieID)));
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                con.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public String getImgByID(String id) {
        int total = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select img from Movies where movieID=?";

        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
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
        return null;
    }
}
