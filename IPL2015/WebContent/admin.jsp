<%-- 
    Document   : admin
    Created on : Apr 23, 2015, 12:38:31 PM
    Author     : parishkrit
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.IOException"%>
<%@page import="org.ipl.book.User"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.ipl.book.Ticket"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        th, td {
            padding: 5px;
            text-align: center;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            int matchno = Integer.parseInt(request.getParameter("matchno"));
            String error = null, team1name = null, team2name = null;
            ResultSet team1 = null, team2 = null;
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
                String query = db2.getProperty("admin.team1");
                PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                pstmt.setInt(1, matchno);
                team1 = pstmt.executeQuery();
                if (team1.next()) {
                    team1name = team1.getString(3);
                } else {
                    error = "Team1 empty";
                }
                team1.beforeFirst();
                query = db2.getProperty("admin.team2");
                pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                pstmt.setInt(1, matchno);
                team2 = pstmt.executeQuery();
                if (team2.next()) {
                    team2name = team2.getString(3);
                } else {
                    error = "Team2 empty";
                }
                team2.beforeFirst();
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

        <form mehtod="GET" action="adminf.jsp">
            <fieldset>
                <legend>Batting ScoreCard</legend>               
                <input type="hidden" name="matchno" value='<%= matchno %>'>
                <h3>&nbsp; &nbsp; &nbsp; &nbsp; Team 1 : <%= team1name%></h3>

                <br />
                <table border="1px" style="width:80%; border-collapse: collapse;">
                    <thead>
                    <th>Played or Not</th>
                    <th>Player Name</th>
                    <th>Balls Played</th>
                    <th>Runs</th>
                    <th>Sixes</th>
                    <th>Fours</th>
                    <th>Out By</th>
                    <th>Type of Out</th>
                    <th>Caught By</th>
                    </thead>
                    <tbody>
                        <%
                            int count = 0;
                            while (team1.next()) {
                        %>
                        <tr>
                            <td><input type="checkbox" name="played1" value='<%= team1.getInt(1)%>' onchange="deselect(1, '<%= count%>')" checked></td>
                            <td><input type="text" name="player1" size="30" required readonly value='<%= team1.getString(2)%>'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='balls1'></td>
                            <td><input type="number" min="0" max="720" value='0' step="1" name='runs1'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='sixes1'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='fours1'></td>
                            <td>
                                <select name='out_by1'>
                                    <option value="N / A" selected>Not Applicable</option>
                                    <%
                                        team2.beforeFirst();
                                        while (team2.next()) {
                                    %>
                                    <option value='<%= team2.getString(2)%>'><%= team2.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <select name="type_of_out1">
                                    <option value="N / A" selected>Not Applicable</option>
                                    <option value="STUMP">Stumping</option>
                                    <option value="BOLD">Bold</option>
                                    <option value="CATCH">Catch</option>
                                    <option value="RUNOUT">Run Out</option>
                                </select>
                            </td>
                            <td>
                                <select name='caught_by1'>
                                    <option value="N / A" selected>Not Applicable</option>
                                    <%
                                        team2.beforeFirst();
                                        while (team2.next()) {
                                    %>
                                    <option value='<%= team2.getString(2)%>'><%= team2.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>                            
                        </tr>
                        <%
                                count++;
                            }
                        %>
                    </tbody>                      
                </table>


                <h3>&nbsp; &nbsp; &nbsp; &nbsp; Team 2 : <%= team2name%></h3>

                <br />
                <table border="1px" style="width:80%; border-collapse: collapse;">
                    <thead>
                    <th>Played or Not</th>
                    <th>Player Name</th>
                    <th>Balls Played</th>
                    <th>Runs</th>
                    <th>Sixes</th>
                    <th>Fours</th>
                    <th>Out By</th>
                    <th>Type of Out</th>
                    <th>Caught By</th>
                    </thead>
                    <tbody>
                        <%
                            team2.beforeFirst();
                            count = 0;
                            while (team2.next()) {
                        %>
                        <tr>
                            <td><input type="checkbox" name="played2" value='<%= team2.getInt(1)%>' onchange="deselect(2, '<%= count%>')" checked></td>
                            <td><input type="text" name="player2" size="30" required name='player' readonly value='<%= team2.getString(2)%>'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='balls2'></td>
                            <td><input type="number" min="0" max="720" value='0' step="1" name='runs2'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='sixes2'></td>
                            <td><input type="number" min="0" max="120" value='0' step="1" name='fours2'></td>
                            <td>
                                <select name='out_by2'>
                                    <option value="N / A" selected>Not Applicable</option>
                                    <%
                                        team1.beforeFirst();
                                        while (team1.next()) {
                                    %>
                                    <option value='<%= team1.getString(2)%>'><%= team1.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <select name="type_of_out2">
                                    <option value="N / A" selected>Not Applicable</option>
                                    <option value="STUMP">Stumping</option>
                                    <option value="BOLD">Bold</option>
                                    <option value="CATCH">Catch</option>
                                    <option value="RUNOUT">Run Out</option>
                                </select>
                            </td>
                            <td>
                                <select name='caught_by2'>
                                    <option value="N / A" selected>Not Applicable</option>
                                    <%
                                        team1.beforeFirst();
                                        while (team1.next()) {
                                    %>
                                    <option value='<%= team1.getString(2)%>'><%= team1.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>                            
                        </tr>
                        <%
                                count++;
                            }
                        %>
                    </tbody>                      
                </table>
                <br />
            </fieldset>
            <br />
            <fieldset>
                <legend>Bowling ScoreCard</legend>

                <h3>&nbsp; &nbsp; &nbsp; &nbsp; Team 1 : <%= team1name%></h3>

                <br />
                <table border="1px" style="width:80%; border-collapse: collapse;">
                    <thead>
                    <th>Bowled or Not</th>
                    <th>Player Name</th>
                    <th>Total Overs</th>
                    <th>Wickets Taken</th>
                    <th>Runs Conceded</th>
                    </thead>
                    <tbody>
                        <%
                            team1.beforeFirst();
                            count = 0;
                            while (team1.next()) {
                        %>
                        <tr>
                            <td><input type="checkbox" name="playedb1" value='<%= team1.getInt(1)%>' onchange="deselect(3, '<%= count%>')" checked></td>
                            <td><input type="text" name="playerb1" size="30" required readonly value='<%= team1.getString(2)%>'></td>
                            <td><input type="number" min="0" max="4" step="0.1" value='0' name='tover1'></td>
                            <td><input type="number" min="0" max="11" value='0' step="1" name='wtaken1'></td>
                            <td><input type="number" min="0" max="144" value='0' step="1" name='runcn1'></td>                      
                        </tr>
                        <%
                                count++;
                            }
                        %>
                    </tbody>                      
                </table>

                <h3>&nbsp; &nbsp; &nbsp; &nbsp;Team 2 : <%= team2name%></h3>

                <br />
                <table border="1px" style="width:80%; border-collapse: collapse;">
                    <thead>
                    <th>Bowled or Not</th>
                    <th>Player Name</th>
                    <th>Total Overs</th>
                    <th>Wickets Taken</th>
                    <th>Runs Conceded</th>
                    </thead>
                    <tbody>
                        <%
                            team2.beforeFirst();
                            count = 0;
                            while (team2.next()) {
                        %>
                        <tr>
                            <td><input type="checkbox" name="playedb2" value='<%= team2.getInt(1)%>' onchange="deselect(4, '<%= count%>')" checked></td>
                            <td><input type="text" name="playerb2" size="30" required readonly value='<%= team2.getString(2)%>'></td>
                            <td><input type="number" min="0" max="4" step="0.1" value='0' name='tover2'></td>
                            <td><input type="number" min="0" max="11" value='0' step="1" name='wtaken2'></td>
                            <td><input type="number" min="0" max="144" value='0' step="1" name='runcn2'></td>                      
                        </tr>
                        <%
                                count++;
                            }
                        %>
                    </tbody>                      
                </table>
            </fieldset>
            <fieldset>
                <legend>Submit</legend>
                &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="submit" value="Submit">
            </fieldset>
        </form>
        <script>
            function deselect(table, tuple) {

            if(table === 1) {
            document.getElementsByName("player1")[tuple].disabled = !document.getElementsByName("player1")[tuple].disabled;
            document.getElementsByName("balls1")[tuple].disabled = !document.getElementsByName("balls1")[tuple].disabled;
            document.getElementsByName("runs1")[tuple].disabled = !document.getElementsByName("runs1")[tuple].disabled;
            document.getElementsByName("sixes1")[tuple].disabled = !document.getElementsByName("sixes1")[tuple].disabled;
            document.getElementsByName("fours1")[tuple].disabled = !document.getElementsByName("fours1")[tuple].disabled;
            document.getElementsByName("out_by1")[tuple].disabled = !document.getElementsByName("out_by1")[tuple].disabled;
            document.getElementsByName("type_of_out1")[tuple].disabled = !document.getElementsByName("type_of_out1")[tuple].disabled;
            document.getElementsByName("caught_by1")[tuple].disabled = !document.getElementsByName("caught_by1")[tuple].disabled;
            } else if(table === 2) {
            document.getElementsByName("player2")[tuple].disabled = !document.getElementsByName("player2")[tuple].disabled;
            document.getElementsByName("balls2")[tuple].disabled = !document.getElementsByName("balls2")[tuple].disabled;
            document.getElementsByName("runs2")[tuple].disabled = !document.getElementsByName("runs2")[tuple].disabled;
            document.getElementsByName("sixes2")[tuple].disabled = !document.getElementsByName("sixes2")[tuple].disabled;
            document.getElementsByName("fours2")[tuple].disabled = !document.getElementsByName("fours2")[tuple].disabled;
            document.getElementsByName("out_by2")[tuple].disabled = !document.getElementsByName("out_by2")[tuple].disabled;
            document.getElementsByName("type_of_out2")[tuple].disabled = !document.getElementsByName("type_of_out2")[tuple].disabled;
            document.getElementsByName("caught_by2")[tuple].disabled = !document.getElementsByName("caught_by2")[tuple].disabled;
            } else if(table === 3) {
            document.getElementsByName("playerb1")[tuple].disabled = !document.getElementsByName("playerb1")[tuple].disabled;
            document.getElementsByName("wtaken1")[tuple].disabled = !document.getElementsByName("wtaken1")[tuple].disabled;
            document.getElementsByName("runcn1")[tuple].disabled = !document.getElementsByName("runcn1")[tuple].disabled;
            document.getElementsByName("tover1")[tuple].disabled = !document.getElementsByName("tover1")[tuple].disabled;
            } else if(table === 4) {
            document.getElementsByName("playerb2")[tuple].disabled = !document.getElementsByName("playerb2")[tuple].disabled;
            document.getElementsByName("wtaken2")[tuple].disabled = !document.getElementsByName("wtaken2")[tuple].disabled;
            document.getElementsByName("runcn2")[tuple].disabled = !document.getElementsByName("runcn2")[tuple].disabled;
            document.getElementsByName("tover2")[tuple].disabled = !document.getElementsByName("tover2")[tuple].disabled;
            }
            }
        </script>
    </body>
</html>
