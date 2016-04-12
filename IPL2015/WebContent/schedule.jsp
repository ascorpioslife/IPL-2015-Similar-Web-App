
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!--Project IPL T20 2015
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal ,Pawan Kumar,Suarabh Sisodiya.

-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Schedule-IPL-2015</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="js/jquery.min.js"></script>
        <!-- grid-slider -->
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
        <script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
        <!-- //grid-slider -->
        <!---calender-style---->
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <!---//calender-style---->				  
    </head>
    <body>
        <!-- start header_bottom -->
        <div class="header-bottom">
            <div class="container">
                <div class="header-bottom_left">
                    <span>IPL T20 2015 | Schedule</span>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- start menu -->
        <div class="menu" id="menu">
            <div class="container">
                <div class="logo">
                    <a href="index.html"><img src="images/Pepsi_IPL_Logo.png" alt="" width="71" height="45"/></a>
                </div>
                <div class="h_menu4"><!-- start h_menu4 -->
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="TeamPage.jsp">Teams</a></li> <!--about.html-->
                        <li class="active"><a href="schedule.jsp">Schedule</a></li>
                        <li><a href="pricing.jsp">Tickets</a></li> <!--classes.html-->
                        <li><a href="top.jsp">Fanzone</a></li> <!--blog.html-->
                        <li><a href="Standings.jsp">Standings</a></li>
                        <li><a href="#">Contact</a></li> <!--contact.html-->
                    </ul> 
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
        <!-- end menu -->
        <div class="main">
            <div class="about_banner_img">
                <img src="images/teams.png" class="img-responsive" alt="">
            </div>
            <div class="about_banner_wrap">
                <h1 class="m_11">Schedule</h1>
            </div>
            <div class="border"> </div> 
            <div class="container">
                <div class="sap_tabs">	
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <ul class="resp-tabs-list">
                            <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>All Matches</span></li>
                            <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Upcoming</span></li> 
                            <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Previous</span></li>
                            <div class="clear"></div>
                        </ul>				  	 
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                <div class="facts">
                                    <ul class="tab-left">
                                        <table class="timetable">
                                            <thead>
                                                <tr>
                                                    <th>Match No.</th>
                                                    <th>Date</th>
                                                    <th>Time (IST)</th>
                                                    <th>Team 1</th>		
                                                    <th>Team 2</th>	
                                                    <th>Venue</th>	
                                            
                                                    <th colspan="2">Result</th>	
                                                </tr>
                                            </thead>
                                            <%  
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							String query1 = "SELECT * FROM IPL.SCHEDULE order by matchno";
							
							PreparedStatement stmt1 = null;
							
							stmt1 = c.prepareStatement(query1);
							
							ResultSet rs1,rs2,rs3;
							rs1 = stmt1.executeQuery();
						
											%>
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs1.next()){ 
       													 %>
            
               <tr class="row_1 row_gray">
                                                    <td>
                                                         <%= rs1.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs1.getString(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs1.getString(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs1.getString(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs1.getString(5) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs1.getString(6)+"," %><br><%= rs1.getString(7)%>
                                                    </td>
                                                    <td>
                                                    	<%
                                                    	String result =  rs1.getString(9)+" " + rs1.getString(10) + " BY " + rs1.getString(11);
                                                    	%>
                                                   		
                                                   		<%
                                                   				if(rs1.wasNull())
                                                   				result="N/A";
                                                   		%>
                                                   		<%=   result %>
                                                    </td>
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
                                           
                                            </tbody>
                                        </table>
                                  
                                    </ul>	
                                </div>
                            </div>	    
                            
                            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                              
                              <div class="facts">
                                    <ul class="tab-left">
                                        <table class="timetable">
                                           <thead>
                                                <tr>
                                                    <th>Match No.</th>
                                                    <th>Date</th>
                                                    <th>Time (IST)</th>
                                                    <th>Team 1</th>		
                                                    <th>Team 2</th>	
                                                    <th>Venue</th>	
                                            
                                                    <th colspan="2">Result</th>	
                                                </tr>
                                            </thead>
                                            <%  
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							Connection c1 = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							//String query2 = 
							String query2 = "SELECT * FROM IPL.SCHEDULE WHERE WINNER IS  NULL order by matchno";
						//	String query3 = "SELECT TEAM_NAME,WONBY FROM IPL.MATCH JOIN IPL.RESULT ON IPL.MATCH.MATCHNO=IPL.RESULT.MATCHNO";
							PreparedStatement stmt2 = null;
							//PreparedStatement stmt2 = null;
							//PreparedStatement stmt3 = null;
							stmt2 = c1.prepareStatement(query2);
							//stmt2 = c.prepareStatement(query2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
							//stmt3 = c.prepareStatement(query3,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
							rs2 = stmt2.executeQuery();
							//rs2 = stmt2.executeQuery();
							//rs3 = stmt3.executeQuery();
							//rs3.next();
											%>
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs2.next()){ 
       													 %>
            
               <tr class="row_1 row_gray">
                                                    <td>
                                                         <%= rs2.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getString(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getString(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs2.getString(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs2.getString(5) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs2.getString(6)+"," %><br><%= rs2.getString(7)%>
                                                    </td>
                                                    <td>
                                                   		<%= "N/A" %>
                                                    </td>
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
       						  </tbody>
                                        </table>
                              
                                    </ul>	
                                </div>
                            </div>	
                            		 <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-2">
                              
                              			<div class="facts">
                                   			 <ul class="tab-left">
                                      			  <table class="timetable">	        					 
                            				 <thead>
                                                <tr>
                                                    <th>Match No.</th>
                                                    <th>Date</th>
                                                    <th>Time (IST)</th>
                                                    <th>Team 1</th>		
                                                    <th>Team 2</th>	
                                                    <th>Venue</th>	
                                            
                                                    <th colspan="2">Result</th>	
                                                </tr>
                                            </thead>
                                            <%  
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							Connection c2 = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							//String query2 = 
							//String query2 = "SELECT * FROM SCHEDULE WHERE WINNER IS  NULL";
							String query3 = "SELECT * FROM IPL.SCHEDULE WHERE WINNER IS  NOT NULL order by matchno";
							PreparedStatement stmt3 = null;
							//PreparedStatement stmt2 = null;
							//PreparedStatement stmt3 = null;
							stmt3 = c2.prepareStatement(query3);
							//stmt2 = c.prepareStatement(query2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
							//stmt3 = c.prepareStatement(query3,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
							//rs2 = stmt2.executeQuery();
							//rs2 = stmt2.executeQuery();
							rs3 = stmt3.executeQuery();
							//rs3.next();
											%>
                                            <tbody>
                                                
                                                <%
                                
           									 while(rs3.next()){ 
       													 %>
            
               <tr class="row_1 row_gray">
                                                    <td>
                                                         <%= rs3.getInt(1) %>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getString(2)%>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getString(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs3.getString(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs3.getString(5) %>
                                                    </td>
                                                    <td>
                                                   		<%= rs3.getString(6)+"," %><br><%= rs3.getString(7)%>
                                                    </td>
                                                     <td>
                                                   		<%= rs3.getString(9)+" " + rs3.getString(10) + " BY " + rs3.getString(11) %>
                                                    </td>
                                                    
                                                </tr>
       						 <% 
           						 } 
       						 %>      	      
       						  </tbody>
                                        </table>
                                     
                                    </ul>	
                                </div>    
                                 
                            </div> 	
                        </div>
                    </div> 
                </div>
                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion           
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                </script>
              
                    <div class="clear"></div>
                </div> 
            </div> 

            <div class="footer-bottom">
                <div class="container">
                    <div class="row section group">
                        <div class="col-md-4">
                            <div class="f-logo">
                                <img src="images/Pepsi_IPL_Logo.png" alt="" width="71" height="45"/>
                            </div>
                            <p class="m_9">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis</p>
                            <p class="address">Phone : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">(00) 222 666 444</span></p>
                            <p class="address">Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">info[at]mycompany.com</span></p>
                        </div>
                        <div class="col-md-3">
                            <ul class="list">
                                <h4 class="m_7">Menu</h4>
                                <li><a href="#">About</a></li> <!--about.html-->
                                <li><a href="#">Schedule</a></li>
                                <li><a href="#">Tickets</a></li>
                                <li><a href="#">Fanzone</a></li>
                                <li><a href="index.html">Home</a></li>
                            </ul>
                            <ul class="list">
                                <h4 class="m_7">Links</h4>
                                <li><a href="register.html">Sign-up</a></li>
                                <li><a href="login.html">Login</a></li>
                                <li><a href="#">Players</a></li>
                                <li><a href="#">Teams</a></li>
                                <li><a href="#">Contact</a></li> <!--contact.html-->
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <ul class="list1">
                                <h4 class="m_7">Teams</h4>
                                <li><a href="#">Rajasthan Royals</a></li>
                                <li><a href="#">Chennai Super Kings</a></li>
                                <li><a href="#">Kolkata Knight Riders</a></li>
                                <li><a href="#">Royal Challengers Bangalore</a></li>
                                <li><a href="#">Mumbai Indians</a></li>
                                <li><a href="#">Kings XI Punjab</a></li>
                                <li><a href="#">Delhi Daredevils</a></li>
                                <li><a href="#">Sunrisers Hyderabad</a></li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="copy">
                        <p>© 2015 DBMS and OOPs Project Team: Parishkrit Jain, Nikunj Jain, Pranjal
                            Aggarwal, Pawan Kumar and Suarabh Sisodiya.</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div> 
    </body>
</html>