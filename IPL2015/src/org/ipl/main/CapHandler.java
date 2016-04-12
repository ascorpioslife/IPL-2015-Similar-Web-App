/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.ipl.main;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parishkrit
 */
public class CapHandler extends HttpServlet {

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
        FileInputStream fin;
        ArrayList<Bowler> bowlers = new ArrayList<Bowler>();
        ArrayList<Batsman> batsman = new ArrayList<Batsman>();
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
            String query = db2.getProperty("player.mostwkt");
            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                bowlers.add(new Bowler(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            request.setAttribute("blist", bowlers);
            query = db2.getProperty("player.mostrun");
            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                batsman.add(new Batsman(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            request.setAttribute("btlist", batsman);
            query = db2.getProperty("player.mostsixes");
            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("psixes", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            } else {
                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
            }
            query = db2.getProperty("player.mostlikes");
            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("plikes", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            } else {
                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
            }
            query = db2.getProperty("player.mosthundreds");
            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("phundreds", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            } else {
                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
            }
    } catch (ClassNotFoundException ex) {
            Logger.getLogger(CapHandler.class.getName()).log(Level.SEVERE, null, ex);
     }  catch (SQLException ex) {
            Logger.getLogger(CapHandler.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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