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
import org.ipl.exception.InvalidObjectException;

/**
 * User object will have details of the user.
 * @author Parishkrit Jain <ptjain02@gmail.com>
 */
public class User implements Writable {

    public static boolean hasUpdated = false;

    private String userid, password;
    private String email, mob, fname, lname;
    //Player fav5, fav3, fav1;

    public User(String userid, String password, String email, String mob, String fname, String lname) {
        this.userid = userid;
        this.password = password;
        this.email = email;
        this.mob = mob;
        this.fname = fname;
        this.lname = lname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMob() {
        return mob;
    }

    public void setMob(String mob) {
        this.mob = mob;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    @Override
    public boolean writeToDB() throws InvalidObjectException{
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
            String query = db2.getProperty("user.write");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pstmt.setString(1, userid);
            pstmt.setString(2, email);
            pstmt.setString(3, mob);
            pstmt.setString(4, password);
            pstmt.setString(5, fname);
            pstmt.setString(6, lname);
            pstmt.executeUpdate();
            System.out.println("error after dbWrite");
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
            throw new InvalidObjectException("Invalid write of Object!");
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
