/*
 * The booking package contains classes for User, Ticket and their Handlers.
 */
package org.ipl.book;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * The User will interact through a BookWindow Object to book any ticket.
 * This object will have all parameters which user needs to see and the ones that ticket
 * object will need for generating ticket.
 * @author parishkrit
 */
public class BookWindow {

    private int price;
    private String ground, city;
    private String team1;
    private String team2;
    private int matchno;
    private int seats;

    public static int bookWindowCount = 0;
    private static ResultSet rs = null;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getGround() {
        return ground;
    }

    public void setGround(String ground) {
        this.ground = ground;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTeam1() {
        return team1;
    }

    public void setTeam1(String team1) {
        this.team1 = team1;
    }

    public String getTeam2() {
        return team2;
    }

    public void setTeam2(String team2) {
        this.team2 = team2;
    }

    public int getMatchno() {
        return matchno;
    }

    public void setMatchno(int matchno) {
        this.matchno = matchno;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    /**
     * This is a static method which will return a BookWindow object read from the database.
     * @return BookWindow Object
     */
    public static BookWindow loadnext() {
        BookWindow b = new BookWindow();
        if (bookWindowCount == 0) {
            rs = dbquery(rs);
        }
        try {
            if (rs.next()) {
                b.ground = rs.getString(1);
                b.price = rs.getInt(2);
                b.team1 = rs.getString(3);
                b.team2 = rs.getString(4);
                b.matchno = rs.getInt(5);
                b.seats = rs.getInt(6) - rs.getInt(7);
                b.city = rs.getString(8);
                bookWindowCount++;
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
        bookWindowCount = 0;
        return null;
    }

    /**
     * Handles the database connection and returns the ResultSet variable containing the
     * result of the query.
     * @param rs ResultSet object holding the result of the query.
     * @return The same ResultSet Object
     */
    public static ResultSet dbquery(ResultSet rs) {
        FileInputStream fin = null;
        try {
            fin = new FileInputStream("C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
            Properties db2 = new Properties();
            db2.load(fin);
            //load the necessary drivers
            Class.forName(db2.getProperty("driver_class"));
            // make a connecton to db2 database
            Connection connect = DriverManager.getConnection(db2.getProperty("url"),
                    db2.getProperty("username"),
                    db2.getProperty("password"));
            String query = db2.getProperty("bookWindow.read");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fin.close();
            } catch (IOException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rs;
    }
}
