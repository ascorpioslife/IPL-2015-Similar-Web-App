/*
 * The booking package contains classes for User, Ticket and their Handlers.
 */
package org.ipl.book;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author parishkrit
 */

@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {

    Connection connect = null;
    String query;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    HashMap<String, String> hs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * Handles all login requests by the user. Uses a HashMap for better efficiency.
     * The query is done only once and HashMap is populated. Upon further requests,
     * HashMap is consulted  and results updated. In case the database is updated,
     * query is performed based on the value of User.hasUpdated variable for user class.
     * This ensures that the HashMap always remains updated with correct values.
     * 
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String message;
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
                query = db2.getProperty("user.login");
                pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = pstmt.executeQuery();
                //make a HashSet for storing values
                hs = new HashMap<String, String>();
                while (rs.next()) {
                    hs.put(rs.getString(1), rs.getString(2));
                }
            }
            if (User.hasUpdated) {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    hs.put(rs.getString(1), rs.getString(2));
                }
                User.hasUpdated = false;
            }

            if (password.equals(hs.get(username))) {
                message = "Found";
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                request.setAttribute("message", message);
                request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
            } else {
                message = "Invalid Uername / Password";
                request.setAttribute("message", message);
                request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
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
