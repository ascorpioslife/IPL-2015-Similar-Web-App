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
import org.ipl.Writable;

/**
 *
 * This class implements Ticket Object which will be generate for the user.
 * @author Parishkrit Jain <ptjain02@gmail.com>
 */
public class Ticket implements Writable {

    private String username;
    private int matchno;
    private String ground;
    private String city;
    private int price;
    private int qty;

    public Ticket(String username, int matchno, String venue, int price, int qty) {
        this.username = username;
        this.matchno = matchno;
        this.ground = venue.split(",", 2)[0].trim();
        this.city = venue.split(",", 2)[1].trim();
        this.price = price;
        this.qty = qty;
    }
    
    public String getUsername() {
        return username;
    }

    public int getMatchno() {
        return matchno;
    }

    public String getGround() {
        return ground;
    }

    public String getCity() {
        return city;
    }

    public int getPrice() {
        return price;
    }

    public int getQty() {
        return qty;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setMatchno(int matchno) {
        this.matchno = matchno;
    }

    public void setGround(String ground) {
        this.ground = ground;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    public String generateTicketID() {
        return username + "-" + Integer.toString(matchno) + "-" + Integer.toString(qty);
    }

    @Override
    public boolean writeToDB() {
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
            String query = db2.getProperty("ticketbook.write");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pstmt.setString(1, username);
            pstmt.setInt(2, matchno);
            pstmt.setString(3, ground);
           // pstmt.setInt(4, price);
            pstmt.setInt(4, qty);
            pstmt.executeUpdate();
            System.out.println("ticket done!");
            return true;
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
        return false;
    }
}
