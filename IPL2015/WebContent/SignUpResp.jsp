<%-- 
    Document   : SignUpResp
    Created on : Apr 16, 2015, 2:28:24 PM
    Author     : parishkrit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sign up Status: ${message} </h1>
        <p>Welcome, <%= session.getAttribute("fname") %> <%= session.getAttribute("lname") %> </p>
                
        <p>Other: <%= response.toString() %></p>      
        <a href="index.html">Return to Home</a>
    </body>
</html>
