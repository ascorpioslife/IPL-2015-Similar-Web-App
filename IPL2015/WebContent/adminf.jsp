<%-- 
    Document   : adminf
    Created on : Apr 24, 2015, 1:18:19 AM
    Author     : parishkrit
--%>

<%@page import="java.sql.Types"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Update</title>
    </head>
    <body>
        <%
            String[] p_ids = request.getParameterValues("played1");
            String[] p_ids2 = request.getParameterValues("played2");
            String[] balls_playeds = request.getParameterValues("balls1");
            String[] balls_playeds2 = request.getParameterValues("balls2");
            String[] runss = request.getParameterValues("runs1");
            String[] runss2 = request.getParameterValues("runs2");
            String[] sixss = request.getParameterValues("sixes1");
            String[] sixss2 = request.getParameterValues("sixes2");
            String[] fourss = request.getParameterValues("fours1");
            String[] fourss2 = request.getParameterValues("fours2");
            String[] out_bys = request.getParameterValues("out_by1");
            String[] out_bys2 = request.getParameterValues("out_by2");
            String[] type_of_outs = request.getParameterValues("type_of_out1");
            String[] type_of_outs2 = request.getParameterValues("type_of_out2");
            String[] caught_bys = request.getParameterValues("caught_by1");
            String[] caught_bys2 = request.getParameterValues("caught_by2");
            
            String[] p_idsb = request.getParameterValues("playedb1");
            String[] tovers = request.getParameterValues("tover1");
            String[] wtakens = request.getParameterValues("wtaken1");
            String[] runcns = request.getParameterValues("runcn1");
            String[] p_idsb2 = request.getParameterValues("playedb2");
            String[] tovers2 = request.getParameterValues("tover2");
            String[] wtakens2 = request.getParameterValues("wtaken2");
            String[] runcns2 = request.getParameterValues("runcn2");

            int matchno = Integer.parseInt(request.getParameter("matchno"));

            String query = null;
            PreparedStatement pstmt = null;
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
                query = db2.getProperty("admin.batsc");
                pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                for (int i = 0; i < p_ids.length; i++) {
                    pstmt.setInt(1, matchno);
                    pstmt.setInt(2, Integer.parseInt(p_ids[i]));
                    pstmt.setInt(3, Integer.parseInt(balls_playeds[i]));
                    pstmt.setInt(4, Integer.parseInt(runss[i]));
                    pstmt.setInt(5, Integer.parseInt(sixss[i]));
                    pstmt.setInt(6, Integer.parseInt(fourss[i]));
                    if (!out_bys[i].equals("N / A")) {
                        pstmt.setString(7, out_bys[i]);
                    } else {
                        pstmt.setNull(7, Types.VARCHAR);
                    }
                    if (!type_of_outs[i].equals("N / A")) {
                        pstmt.setString(8, type_of_outs[i]);
                    } else {
                        pstmt.setNull(8, Types.VARCHAR);
                    }
                    if (!caught_bys[i].equals("N / A")) {
                        pstmt.setString(9, caught_bys[i]);
                    } else {
                        pstmt.setNull(9, Types.VARCHAR);
                    }
                    pstmt.executeUpdate();
                }
                for (int i = 0; i < p_ids2.length; i++) {
                    pstmt.setInt(1, matchno);
                    pstmt.setInt(2, Integer.parseInt(p_ids2[i]));
                    pstmt.setInt(3, Integer.parseInt(balls_playeds2[i]));
                    pstmt.setInt(4, Integer.parseInt(runss2[i]));
                    pstmt.setInt(5, Integer.parseInt(sixss2[i]));
                    pstmt.setInt(6, Integer.parseInt(fourss2[i]));
                    if (!out_bys2[i].equals("N / A")) {
                        pstmt.setString(7, out_bys2[i]);
                    } else {
                        pstmt.setNull(7, Types.VARCHAR);
                    }
                    if (!type_of_outs2[i].equals("N / A")) {
                        pstmt.setString(8, type_of_outs2[i]);
                    } else {
                        pstmt.setNull(8, Types.VARCHAR);
                    }
                    if (!caught_bys2[i].equals("N / A")) {
                        pstmt.setString(9, caught_bys2[i]);
                    } else {
                        pstmt.setNull(9, Types.VARCHAR);
                    }
                    pstmt.executeUpdate();
                }
                
                query = db2.getProperty("admin.ballsc");
                pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                for (int i = 0; i < p_idsb.length; i++) {
                    pstmt.setInt(1, matchno);
                    pstmt.setInt(2, Integer.parseInt(p_idsb[i]));
                    pstmt.setInt(3, Integer.parseInt(wtakens[i]));
                    pstmt.setFloat(4, Float.parseFloat(tovers[i]));
                    pstmt.setInt(5, Integer.parseInt(runcns[i]));
                    pstmt.executeUpdate();
                }
                    for (int i = 0; i < p_idsb2.length; i++) {
                    pstmt.setInt(1, matchno);
                    pstmt.setInt(2, Integer.parseInt(p_idsb2[i]));
                    pstmt.setInt(3, Integer.parseInt(wtakens2[i]));
                    pstmt.setFloat(4, Float.parseFloat(tovers2[i]));
                    pstmt.setInt(5, Integer.parseInt(runcns2[i]));
                    pstmt.executeUpdate();
                }
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
        %>
        <h2>done!</h2>
    </body>
</html>
