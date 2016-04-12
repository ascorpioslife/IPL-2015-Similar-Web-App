/*
 * The booking package contains classes for User, Ticket and their Handlers.
 */
package org.ipl.book;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Dynamicaly checks username using Ajax.
 * As the user types the username, show him/her if the username is available.
 * Creates a HashSet containing username. Use a similar implementation as in 
 * LoginHandler.
 * @author parishkrit
 */

@WebServlet("/UsernameChecker")
public class UsernameChecker extends HttpServlet {

    Connection connect = null;
    String query = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    HashSet<String> hs = null;

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
        String message = "";
        String username = request.getParameter("username").trim();
        try {
            if (rs == null) {
                //open the db2.properties file
                FileInputStream fin = new FileInputStream("C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
                Properties db2 = new Properties();
                db2.load(fin);
                //load the necessary drivers
                Class.forName(db2.getProperty("driver_class"));
                // make a connecton to db2 database
                connect = DriverManager.getConnection(db2.getProperty("url"),
                        db2.getProperty("username"),
                        db2.getProperty("password"));
                query = db2.getProperty("user.checkUsername");
                pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = pstmt.executeQuery();
                //make a HashSet for storing values
                hs = new HashSet<String>();
                while(rs.next()) {
                    hs.add(rs.getString(1));
                }
            }
            if(User.hasUpdated) {      
                rs = pstmt.executeQuery();
                while(rs.next()) {
                    hs.add(rs.getString(1));
                }
                User.hasUpdated = false;
            }

            if (hs.contains(username)) {
                message = "N";
            } else {
                message = "Y";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(message);

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
