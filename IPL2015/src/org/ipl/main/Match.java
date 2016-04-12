/*
 * The main package contains classes for Match, Venue, Team.
 */
package org.ipl.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Time;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.catalina.User;

/**
 * Match object contains details of the match.
 * Implement a loadnext() method similar to BookWindow class.
 * @author nikunj
 */
public class Match {

    private int matchNo;
    private Date date;
    private Time time;
    private String toss;
    private String team1, team2;
    private String ground;
    private String result;
    static private ResultSet rs;

    public Match() {
    }

    public int getMatchNo() {
        return matchNo;
    }

    public Date getDate() {
        return date;
    }

    public Time getTime() {
        return time;
    }

    public String getGround() {
        return ground;
    }

    public void setGround(String ground) {
        this.ground = ground;
    }

    public String getToss() {
        return toss;
    }

    public String getTeam1() {
        return team1;
    }

    public String getTeam2() {
        return team2;
    }

    public String getResult() {
        return result;
    }

    static public void createQuery() {
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
            String query = db2.getProperty("schedule.read");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
        } catch (FileNotFoundException ex) {
            // prints complete log for all exception details
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
    }

    public static Match loadNext() {
        Match m = new Match();
        try {
            if (rs.next()) {
                m.matchNo = rs.getInt(1);
                m.date = rs.getDate(2);
                m.time = rs.getTime(3);
                m.team1 = rs.getString(4);
                m.team2 = rs.getString(5);
                m.ground = rs.getString(6) + "," + rs.getString(7);
                m.result = rs.getString(9) + " " + rs.getString(10) + " BY " + rs.getString(11);
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
