<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.sql.*" %>
    <%@ page language="java" import="java.io.*" errorPage="" %>
    <%@page import="java.util.Properties" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favourites</title>
</head>
<body>
<%
               FileInputStream fin = null;
         try {
             fin = new FileInputStream("C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
             Properties db2 = new Properties();
             db2.load(fin);
             ResultSet rs;
             
             //load the necessary drivers
             Class.forName(db2.getProperty("driver_class"));
             // make a connecton to db2 database
             Connection connect = DriverManager.getConnection(db2.getProperty("url"),
                     db2.getProperty("username"),
                     db2.getProperty("password"));
             String query = db2.getProperty("favplayer");
             
             //updating 5 star player's likes
             
             PreparedStatement stmt1 = connect.prepareStatement(query);
             stmt1.setString(1, session.getAttribute("username").toString());
             stmt1.setInt(2, Integer.valueOf(request.getParameter("fav1")));
             stmt1.setInt(3, 5);
        	 
             stmt1.executeUpdate();
             
           //updating 3 star player's likes
             PreparedStatement stmt2 = connect.prepareStatement(query);
             stmt2.setString(1, session.getAttribute("username").toString());
             stmt2.setInt(2, Integer.valueOf(request.getParameter("fav2")));
             stmt2.setInt(3, 3);
        	 
             stmt2.executeUpdate();
             
           //updating 2 star player's likes
             PreparedStatement stmt3 = connect.prepareStatement(query);
             stmt3.setString(1, session.getAttribute("username").toString());
             stmt3.setInt(2, Integer.valueOf(request.getParameter("fav3")));
             stmt3.setInt(3, 2);
        	 
             stmt3.executeUpdate();
             
                    //Closes the database connection
                    stmt1.close();
                    stmt2.close();
                    stmt3.close();
                    connect.close();
                }
                catch (ClassNotFoundException e)
                {
                    System.err.println("ClassNotFoundException: " + e.getMessage());
                } 
                catch (SQLException e)
                {
                    System.err.println("SQLException: " + e.getMessage());
                }
                catch (Exception e)
                {
                    System.err.println("Generic Exception: " + e.getMessage());
                }       
            %>
            <h2>Rating Updated!</h2>
            <a href = "index.jsp">Home Page</a>
             


</body>
</html>