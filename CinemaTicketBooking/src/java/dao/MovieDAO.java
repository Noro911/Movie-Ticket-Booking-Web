/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Entity.Cinema;
import Entity.Movie;
import Entity.Showtime;
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
public class MovieDAO {

    public ArrayList<Movie> getAllMovies() {
        ArrayList<Movie> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "Select * from Movies";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2);
                int cost = Integer.parseInt(rs.getString(3));
                String length = rs.getString(4).trim();
                String syn = rs.getString(5);
                String img = rs.getString(6);
                String poster = rs.getString(7);
                Movie m = new Movie(id, name, cost, length, syn, img, poster);
                list.add(m);
            }
            return list;
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

    public ArrayList<Showtime> getAllShowtime() {
        ArrayList<Showtime> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "Select * from ShowTimes";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String time = rs.getString(2).trim();
                Showtime st = new Showtime(id, time);
                list.add(st);
            }
            return list;
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

    public ArrayList<Cinema> getAllCinemas() {
        ArrayList<Cinema> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "Select * from Cinemas";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2);
                Cinema cn = new Cinema(id, name);
                list.add(cn);
            }
            return list;
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

    public ArrayList<Movie> getMovieEachPage(int page) {
        ArrayList<Movie> list = new ArrayList<>();
        String query = "select * from Movies order by movieID offset ? rows fetch next ? rows only";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(query);
            statement.setInt(1, 5 * (page - 1));
            statement.setInt(2, 5);
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2);
                int cost = Integer.parseInt(rs.getString(3));
                String length = rs.getString(4).trim();
                String syn = rs.getString(5);
                String img = rs.getString(6);
                String poster = rs.getString(7);
                Movie m = new Movie(id, name, cost, length, syn, img, poster);
                list.add(m);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addMovie(Movie m) {
        String sql = "insert into Movies values (?,?,?,?,?,?,?);";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, m.getId());
            statement.setString(2, m.getName());
            statement.setInt(3, 13);
            statement.setString(4, m.getLength());
            statement.setString(5, m.getSyn());
            statement.setString(6, m.getImg());
            statement.setString(7, m.getPoster());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deleteMovie(String id) {
        String sql = "delete Movies where movieID=?;";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateMovie(Movie m) {
        String sql = "update Movies set moiveName=?, cost=?, length=?, syn=?, img=?, poster=? where movieID=?;";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, m.getName());
            statement.setInt(2, 13);
            statement.setString(3, m.getLength());
            statement.setString(4, m.getSyn());
            statement.setString(5, m.getImg());
            statement.setString(6, m.getPoster());
            statement.setString(7, m.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Movie> getSearchResult(String search, int page) {
        ArrayList<Movie> list = new ArrayList<>();
        search = "%" + search + "%";
        String sql = "select * from Movies where moiveName like ? order by movieID offset ? rows fetch next 3 rows only";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, search);
            statement.setInt(2, 3*(page-1));
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2);
                int cost = Integer.parseInt(rs.getString(3));
                String length = rs.getString(4).trim();
                String syn = rs.getString(5);
                String img = rs.getString(6);
                String poster = rs.getString(7);
                Movie m = new Movie(id, name, cost, length, syn, img, poster);
                list.add(m);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
    
    public int getAmountResult(String search) {
        ArrayList<Movie> list = new ArrayList<>();
        search = "%" + search + "%";
        String sql = "select count(*) from Movies where moiveName like ?";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, search);
            rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public ArrayList<Movie> getSortResults(String col, String search, int page) {
        ArrayList<Movie> list = new ArrayList<>();
        search = "%" + search + "%";
        String sql = "select * from Movies where moiveName like ? order by cast("+col+" as varchar(3999)) ASC offset ? rows fetch next 3 rows only";
        DBContext db = DBContext.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, search);
            statement.setInt(2, 3*(page-1));
            rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2);
                int cost = Integer.parseInt(rs.getString(3));
                String length = rs.getString(4).trim();
                String syn = rs.getString(5);
                String img = rs.getString(6);
                String poster = rs.getString(7);
                Movie m = new Movie(id, name, cost, length, syn, img, poster);
                list.add(m);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
}
