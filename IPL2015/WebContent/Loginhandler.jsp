<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>

<%
		String uemail = request.getParameter("email");
		String upass=request.getParameter("password");
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String query = "select fname,lname from ipl.user where email_id=? and password=?";
		Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
    Statement st = c.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from ipl.user where email_id='" + uemail + "' and password='" + upass + "'");
    
    if (rs.next()) {
    	String fname=rs.getString("fname");
        session.setAttribute("uemail", uemail);
        session.setAttribute("fname",fname);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("Dashboard.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>

</body>
</html>