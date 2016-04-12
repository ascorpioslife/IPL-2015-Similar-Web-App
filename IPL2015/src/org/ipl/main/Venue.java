/*
 * The main package contains classes for Match, Venue, Team.
 */

package org.ipl.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.ipl.book.User;
import static org.ipl.book.User.hasUpdated;

/**
 *
 * @author Parishkrit Jain <ptjain02@gmail.com>
 */
public class Venue {
    private String city;
    private String ground;
    private int capacity;
    
    public String getCity() {
        return city;
    }
    
    public String getGround() {
        return ground;
    }
    
    public int getCapacity() {
        return capacity;
    }
    
   /* public Venue load(int matchno) {
        FileInputStream fin = null;
        try {
            fin = new FileInputStream("C:\\Users\\parishkrit\\Study Material\\Computer Sciences\\DBMS\\Project\\IPL_2015\\db2.properties");
            Properties db2 = new Properties();
            db2.load(fin);
            //load the necessary drivers
            Class.forName(db2.getProperty("driver_class"));
            // make a connecton to db2 database
            Connection connect = DriverManager.getConnection(db2.getProperty("url"),
                    db2.getProperty("username"),
                    db2.getProperty("password"));
            String query = db2.getProperty("venue.read");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pstmt.setString(1, userid);
            pstmt.setString(2, email);
            pstmt.setString(3, mob);
            pstmt.setString(4, password);
            pstmt.setString(5, fname);
            pstmt.setString(6, lname);
            pstmt.setNull(7, Types.INTEGER);
            pstmt.executeUpdate();
            hasUpdated = true;
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
        return this;
    } */
}
