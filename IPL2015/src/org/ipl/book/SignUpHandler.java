/*
 * Author: Parishkrit Jain <ptjain02@gmail.com>
 */

package org.ipl.book;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ipl.exception.InvalidObjectException;


/**
 * Servlet for handling Sign-Up requests.
 * 
 * This servlet will create a User object if all the parameters are okay, and then
 * write the user data to database. If successful, the user will be redirected to 
 * his dashboard. In case of any error, or invalid parameter, the servlet cannot do 
 * much and will redirect the user to a page showing error message.
 * 
 * @author Parishkrit Jain <ptjain02@gmail.com>
 */

@WebServlet("/SignUpHandler")
public class SignUpHandler extends HttpServlet {

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
        String email = request.getParameter("email").trim();
        String username = request.getParameter("username").trim();
        String mob = request.getParameter("mob").trim();
        String password = request.getParameter("password").trim();
        String cnfpassword = request.getParameter("cnfpassword").trim();
        String fname = request.getParameter("fname").trim();
        String lname = request.getParameter("lname").trim();
        String message = "Sign-Up NOT Successful!";
        
        // double check parameters for confirmation
        if(email == null || username == null || mob == null || password == null || fname == null || lname == null) {
            request.setAttribute("message", message);
            request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
        }
        if(!password.equals(cnfpassword)) {
            request.setAttribute("message", message);
            request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
        }
        if(!mob.matches("^[0-9]+$")) {
            request.setAttribute("message", message);
            request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
        }
        // create a new user object and write to DB
        User u = new User(username, password, email, mob, fname, lname);
        try {
            if(!u.writeToDB()) {
                request.setAttribute("message", message);
                request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
            }
        } catch (InvalidObjectException ex) {
            System.out.println("This was an Invalid Object. Can't be written!");
        }
        
        message = "Sign Up Successful!";
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("fname", fname);
        session.setAttribute("lname", lname);
        //request.setAttribute("message", message);
        response.getWriter().print(message);
        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
                
        //request.getRequestDispatcher("SignUpResp.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
