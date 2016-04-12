<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>

<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
if(uname.contains("admin") && pass.contains("admin"))
{
	String site = new String("adminp.html");
	   response.setStatus(response.SC_MOVED_TEMPORARILY);
	   response.setHeader("Location", site); 
}

else
{
	PrintWriter out1= response.getWriter();
	out1.print("<p>Invalid User Name or Password</p>");
	out1.print("<a href = "+ "\"adminLogin.jsp\">Login");
}

%>



</body>
</html>