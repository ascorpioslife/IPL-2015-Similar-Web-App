Schedule Page.txt

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!--Project IPL T20 2015
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Stats : IPL 2015</title>
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
                    <span>IPL T20 2015 | Statistics</span>
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
                        <li><a href="schedule.jsp">Schedule</a></li>
                        <li class="active"><a href="Standings.jsp">Statistics</a></li>
                        <li><a href="#">Tickets</a></li> <!--classes.html-->
                        <li><a href="#">Fanzone</a></li> <!--blog.html-->
                        
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
                <h1 class="m_11">Statistics</h1>
            </div>
            <div class="border"> </div> 
            <div class="container">
                <div class="sap_tabs">	
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <ul class="resp-tabs-list">
                            <li ><!--<span>All Matches</span>--></li>
                            <li ><!--<span>Upcoming</span>--></li> 
                            <li><!--<span>Previous</span>--></li>
                            <div class="clear"></div>
                        </ul>				  	 
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                <div class="facts">
                                    <ul class="tab-left">
                                        <H2>POINTS TABLE</H2>
                                         <table class="timetable">
                                            <thead>
                                                <tr>
                                                    <th>TEAM</th>
                                                    
                                                    <th>TOTAL MATCHES</th>
                                                    <th>WIN</th>		
                                                    <th>LOSE</th>	
                                                    <th> TIED </th>
                                                    <th>NRR</th>	
                                                </tr>
                                            </thead>
                                                                    <%  
                                                                        
                             Connection c,c1,c2;
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							
                                                c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							String query = "SELECT NAME,CAPTAIN,NO_OF_MATCHES,WIN,LOSE,NRR,TEAMLOGO FROM IPL.TEAM ORDER BY WIN DESC";
							PreparedStatement stmt = null;
							stmt= c.prepareStatement(query);
							ResultSet rs;
							rs = stmt.executeQuery();
											%>
                                            <tbody>
                                                 <%
                                
           									 while(rs.next()){ 
       													 %>
                                                <tr class="row_1 row_gray">
                                                   <td >
                                                        <img src="<%=rs.getString(7) %>" alt=""/  height="35" width="50">
                                                         <%= rs.getString(1) %>
                                                    </td>
                                                    
                                                    <td>
                                                       <%= rs.getInt(3)%>
                                                    </td>
                                                    <td>
                                                       <%= rs.getInt(4)%>
                                                    </td>
                                                    <td>
                                                        <%= rs.getInt(5)%>
                                                    </td>
                                                    <td>
                                                        <%= rs.getInt(3)-(rs.getInt(4)+rs.getInt(5))%>
                                                    </td>
                                                    <td>
                                                   	<%= rs.getDouble(6)%>
                                                    </td>
                                                 
                                                </tr>
                                                 <% 
            }
        %>
                                            <!--    <tr class="row_2">
                                                    <td>
                                                        06.00 - 07.00
                                                    </td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event" rowspan="3"><a href="#">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td></td><td></td></tr><tr class="row_3 row_gray">
                                                    <td>
                                                        07.00 - 08.00
                                                    </td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td></td><td></td></tr><tr class="row_4">
                                                    <td>
                                                        08.00 - 09.00
                                                    </td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td></tr><tr class="row_5 row_gray">
                                                    <td>
                                                        09.00 - 10.00
                                                    </td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td></tr><tr class="row_6">
                                                    <td>
                                                        10.00 - 11.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td></tr><tr class="row_7 row_gray">
                                                    <td>
                                                        11.00 - 12.00
                                                    </td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td></tr><tr class="row_8">
                                                    <td>
                                                        12.00 - 13.00
                                                    </td><td></td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event" rowspan="4"><a href="#" title="Boxing">Boxing</a>12.00 - 15.45</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00<br><br><a href="#" title="Boxing">Boxing</a>12.00 - 15.45<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td></tr><tr class="row_9 row_gray">
                                                    <td>
                                                        13.00 - 14.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_10">
                                                    <td>
                                                        14.00 - 15.00
                                                    </td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td></tr><tr class="row_11 row_gray">
                                                    <td>
                                                        15.00 - 16.00
                                                    </td><td></td><td></td></tr><tr class="row_12">
                                                    <td>
                                                        16.00 - 17.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30<br><br><a href="#" title="Gym Fitness">Gym Fitness</a>17.30 - 20.00<br><br><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td></td><td></td></tr><tr class="row_13 row_gray">
                                                    <td>
                                                        17.00 - 18.00
                                                    </td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td></tr><tr class="row_14">
                                                    <td>
                                                        18.00 - 19.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td></td><td></td></tr><tr class="row_15 row_gray">
                                                    <td>
                                                        19.00 - 20.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td></tr><tr class="row_16">
                                                    <td>
                                                        20.00 - 21.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr> -->	
                                            </tbody>
                                        </table>
                                         <BR><BR>
                                        <H2>TOP BATSMEN</H2>
                                        <table class="timetable">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>NAME</th>
                                                    <th>TEAM-NAME</th>
                                                    <th>RUNS</th>		
                                                    <th>FOURS</th>	
                                                    <th>SIXES</th>	
                                                    <th>HUNDREDS</th>
                                                    <th>FIFTIES</th>
                                                    <th> STRIKE RATE</th>
                                                </tr>
                                            </thead>
                                                                    <%  
                                                                        
                                                c1 = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							String query1 = "SELECT P_ID,NAME,TEAM_NAME,RUNS,FOURS,SIXS,HUNDRED,FIFTY,STRR FROM IPL.PLAYER ORDER BY RUNS DESC  LIMIT 5";
							PreparedStatement stmt1 = null;
							stmt1 = c1.prepareStatement(query1);
							ResultSet rs1;
							rs1 = stmt1.executeQuery();
											%>
                                            <tbody>
                                                 <%
                                
           									 while(rs1.next()){ 
       													 %>
                                                <tr  class="row_1 row_gray">
                                                   
                                                    <td>
                                                        <%= rs1.getString(2)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getString(3)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getInt(4)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getInt(5)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getInt(6)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getInt(7)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getInt(8)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs1.getDouble(9)%>
                                                    </td>
                                                </tr>
                                                 <% 
            }
        %>
                                            <!--    <tr class="row_2">
                                                    <td>
                                                        06.00 - 07.00
                                                    </td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event" rowspan="3"><a href="#">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td></td><td></td></tr><tr class="row_3 row_gray">
                                                    <td>
                                                        07.00 - 08.00
                                                    </td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td></td><td></td></tr><tr class="row_4">
                                                    <td>
                                                        08.00 - 09.00
                                                    </td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td></tr><tr class="row_5 row_gray">
                                                    <td>
                                                        09.00 - 10.00
                                                    </td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td></tr><tr class="row_6">
                                                    <td>
                                                        10.00 - 11.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td></tr><tr class="row_7 row_gray">
                                                    <td>
                                                        11.00 - 12.00
                                                    </td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td></tr><tr class="row_8">
                                                    <td>
                                                        12.00 - 13.00
                                                    </td><td></td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event" rowspan="4"><a href="#" title="Boxing">Boxing</a>12.00 - 15.45</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00<br><br><a href="#" title="Boxing">Boxing</a>12.00 - 15.45<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td></tr><tr class="row_9 row_gray">
                                                    <td>
                                                        13.00 - 14.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_10">
                                                    <td>
                                                        14.00 - 15.00
                                                    </td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td></tr><tr class="row_11 row_gray">
                                                    <td>
                                                        15.00 - 16.00
                                                    </td><td></td><td></td></tr><tr class="row_12">
                                                    <td>
                                                        16.00 - 17.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30<br><br><a href="#" title="Gym Fitness">Gym Fitness</a>17.30 - 20.00<br><br><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td></td><td></td></tr><tr class="row_13 row_gray">
                                                    <td>
                                                        17.00 - 18.00
                                                    </td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td></tr><tr class="row_14">
                                                    <td>
                                                        18.00 - 19.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td></td><td></td></tr><tr class="row_15 row_gray">
                                                    <td>
                                                        19.00 - 20.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td></tr><tr class="row_16">
                                                    <td>
                                                        20.00 - 21.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr> -->	
                                            </tbody>
                                        </table>
                                        <BR><BR>
                                        <H2>TOP BOWLERS</H2>
                                        <table class="timetable">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>NAME</th>
                                                    <th>TEAM-NAME</th>
                                                    <th>WTAKEN</th>		
                                                    <th>ECON</th>	
                                                </tr>
                                            </thead>
                                                                    <%  
							c2 = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							//String query2 = "SELECT P_ID,NAME,TEAM_NAME,WTAKEN,ECON FROM IPL.BALLSC  WHERE WTAKEN>=(SELECT WTAKEN FROM IPL.PLAYER A WHERE (4)=(SELECT COUNT(DISTINCT WTAKEN) FROM IPL.PLAYER B WHERE B.WTAKEN>A.WTAKEN)) ORDER BY WTAKEN DESC";
							String query2 = "SELECT P_ID,NAME,TEAM_NAME,WTAKEN,ECON FROM IPL.PLAYER ORDER BY WTAKEN DESC  LIMIT 5";
                           	PreparedStatement stmt2 = null;
							stmt2 = c2.prepareStatement(query2);
							ResultSet rs2;
							rs2 = stmt2.executeQuery();
											%>
                                            <tbody>
                                                 <%
                                
           									 while(rs2.next()){ 
       													 %>
                                                <tr class="row_1 row_gray">
                                                    
                                                    <td>
                                                        <%= rs2.getString(2)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs2.getString(3)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs2.getInt(4)%>
                                                    </td>
                                                    <td>
                                                   	<%= rs2.getFloat(5)%>
                                                    </td>
                                                    
                                                </tr>
                                                 <% 
            }
        %>
                                            <!--    <tr class="row_2">
                                                    <td>
                                                        06.00 - 07.00
                                                    </td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event" rowspan="3"><a href="#">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>06.00 - 08.30</td><td></td><td></td></tr><tr class="row_3 row_gray">
                                                    <td>
                                                        07.00 - 08.00
                                                    </td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td class="event"><a href="#" title="Cardio Fitness">Cardio Fitness</a>07.00 - 08.00</td><td></td><td></td></tr><tr class="row_4">
                                                    <td>
                                                        08.00 - 09.00
                                                    </td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>08.00 - 09.30</td></tr><tr class="row_5 row_gray">
                                                    <td>
                                                        09.00 - 10.00
                                                    </td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td class="event" rowspan="3"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 11.25</td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>09.00 - 10.00</td></tr><tr class="row_6">
                                                    <td>
                                                        10.00 - 11.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>10.00 - 11.30</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td></tr><tr class="row_7 row_gray">
                                                    <td>
                                                        11.00 - 12.00
                                                    </td><td></td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td><td class="event"><a href="#" title="Indoor Cycling">Indoor Cycling</a>11.00 - 12.00</td></tr><tr class="row_8">
                                                    <td>
                                                        12.00 - 13.00
                                                    </td><td></td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event" rowspan="4"><a href="#" title="Boxing">Boxing</a>12.00 - 15.45</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00<br><br><a href="#" title="Boxing">Boxing</a>12.00 - 15.45<br><br><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td></tr><tr class="row_9 row_gray">
                                                    <td>
                                                        13.00 - 14.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_10">
                                                    <td>
                                                        14.00 - 15.00
                                                    </td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15<br><br><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td></td><td></td><td class="event" rowspan="2"><a href="#" title="Cardio Fitness">Cardio Fitness</a>14.00 - 16.00</td></tr><tr class="row_11 row_gray">
                                                    <td>
                                                        15.00 - 16.00
                                                    </td><td></td><td></td></tr><tr class="row_12">
                                                    <td>
                                                        16.00 - 17.00
                                                    </td><td></td><td class="event" rowspan="2"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30</td><td class="event" rowspan="4"><a href="#" title="Indoor Cycling">Indoor Cycling</a>16.00 - 17.30<br><br><a href="#" title="Gym Fitness">Gym Fitness</a>17.30 - 20.00<br><br><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td></td><td></td></tr><tr class="row_13 row_gray">
                                                    <td>
                                                        17.00 - 18.00
                                                    </td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td></tr><tr class="row_14">
                                                    <td>
                                                        18.00 - 19.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00<br><br><a href="#" title="Yoga Pilates">Yoga Pilates</a>18.30 - 20.00</td><td></td><td></td></tr><tr class="row_15 row_gray">
                                                    <td>
                                                        19.00 - 20.00
                                                    </td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td><td class="event" rowspan="2"><a href="#" title="Yoga Pilates">Yoga Pilates</a>19.00 - 20.30</td></tr><tr class="row_16">
                                                    <td>
                                                        20.00 - 21.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr> -->	
                                            </tbody>
                                        </table>
                               
                                   <!--     <div class="timetable_small">
                                            <ul class="items_list"><h3>Monday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Tuesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Wednesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Thrusday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Friday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Saturday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Sunday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                        </div>
                                    </ul>	
                                </div>
                            </div>	
                            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                                <div class="facts">
                                    <ul class="tab-left">
                                        <table class="timetable">
                                            <thead>
                                                <tr>
                                                    <th></th>	<th>MONDAY</th>	<th>TUESDAY</th>	<th>WEDNESDAY</th>	<th>THURSDAY</th>	<th>FRIDAY</th>	<th>SATURDAY</th>	<th>SUNDAY</th>	</tr>
                                            </thead>
                                            <tbody><tr class="row_1 row_gray">
                                                    <td>
                                                        06.00 - 07.00
                                                    </td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 07.00</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>06.00 - 08.30</td><td></td><td></td></tr><tr class="row_2">
                                                    <td>
                                                        07.00 - 08.00
                                                    </td><td></td><td></td><td></td><td></td></tr><tr class="row_3 row_gray">
                                                    <td>
                                                        08.00 - 09.00
                                                    </td><td></td><td></td><td></td><td></td></tr><tr class="row_4">
                                                    <td>
                                                        09.00 - 10.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_5 row_gray">
                                                    <td>
                                                        10.00 - 11.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>10.00 - 11.00</td></tr><tr class="row_6">
                                                    <td>
                                                        11.00 - 12.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_7 row_gray">
                                                    <td>
                                                        12.00 - 13.00
                                                    </td><td></td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td></td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>12.00 - 13.00</td></tr><tr class="row_8">
                                                    <td>
                                                        13.00 - 14.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_9 row_gray">
                                                    <td>
                                                        14.00 - 15.00
                                                    </td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15</td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>14.00 - 16.15</td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_10">
                                                    <td>
                                                        15.00 - 16.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_11 row_gray">
                                                    <td>
                                                        16.00 - 17.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_12">
                                                    <td>
                                                        17.00 - 18.00
                                                    </td><td></td><td></td><td></td><td></td><td class="event" rowspan="3"><a href="#" title="Gym Fitness">Gym Fitness</a>17.30 - 20.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td><td class="event"><a href="#" title="Gym Fitness">Gym Fitness</a>17.00 - 18.00</td></tr><tr class="row_13 row_gray">
                                                    <td>
                                                        18.00 - 19.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_14">
                                                    <td>
                                                        19.00 - 20.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td></tr>	
                                            </tbody>
                                        </table>
                                        <div class="timetable_small">
                                            <ul class="items_list"><h3>Monday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Tuesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Wednesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Thrusday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Friday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Saturday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Sunday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                        </div>
                                    </ul>	
                                </div>
                            </div>				        					 
                            <div class="tab-3 resp-tab-content" aria-labelledby="tab_item-2">
                                <div class="facts">
                                    <ul class="tab-left">
                                        <table class="timetable">
                                            <thead>
                                                <tr>
                                                    <th></th>	<th>MONDAY</th>	<th>TUESDAY</th>	<th>WEDNESDAY</th>	<th>THURSDAY</th>	<th>FRIDAY</th>	<th>SATURDAY</th>	<th>SUNDAY</th>	</tr>
                                            </thead>
                                            <tbody><tr class="row_1 row_gray">
                                                    <td>
                                                        05.00 - 06.00
                                                    </td><td class="event"><a href="#" title="Boxing">Boxing</a>05.00 - 06.00</td><td class="event"><a href="#" title="Boxing">Boxing</a>05.00 - 06.00</td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_2">
                                                    <td>
                                                        06.00 - 07.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_3 row_gray">
                                                    <td>
                                                        07.00 - 08.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_4">
                                                    <td>
                                                        08.00 - 09.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_5 row_gray">
                                                    <td>
                                                        09.00 - 10.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_6">
                                                    <td>
                                                        10.00 - 11.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_7 row_gray">
                                                    <td>
                                                        11.00 - 12.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_8">
                                                    <td>
                                                        12.00 - 13.00
                                                    </td><td></td><td></td><td></td><td></td><td class="event" rowspan="4"><a href="#" title="Boxing">Boxing</a>12.00 - 15.45</td><td class="event" rowspan="4"><a href="#" title="Boxing">Boxing</a>12.00 - 15.45</td><td></td></tr><tr class="row_9 row_gray">
                                                    <td>
                                                        13.00 - 14.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_10">
                                                    <td>
                                                        14.00 - 15.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_11 row_gray">
                                                    <td>
                                                        15.00 - 16.00
                                                    </td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_12">
                                                    <td>
                                                        16.00 - 17.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_13 row_gray">
                                                    <td>
                                                        17.00 - 18.00
                                                    </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="row_14">
                                                    <td>
                                                        18.00 - 19.00
                                                    </td><td class="event"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00</td><td class="event"><a href="#" title="Boxing">Boxing</a>18.00 - 19.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td class="event" rowspan="2"><a href="#" title="Boxing">Boxing</a>18.00 - 20.00</td><td></td><td></td></tr><tr class="row_15 row_gray">
                                                    <td>
                                                        19.00 - 20.00
                                                    </td><td></td><td></td><td></td><td></td></tr>	
                                            </tbody>
                                        </table>
                                        <div class="timetable_small">
                                            <ul class="items_list"><h3>Monday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Tuesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Wednesday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Thrusday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Friday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Saturday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                            <ul class="items_list"><h3>Sunday</h3>
                                                <li><p><a href>Gym Fitness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cardio Fittness</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Boxing</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Yoga Pilates</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                                <li><p><a href>Cycling</a></p><span class="m_31">10.00 - 20.00</span><div class="clear"></div></li>
                                            </ul>
                                        </div>
                                    </ul>	
                                </div>  -->         	      
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
              <!--  <div class="row trainers_middle_bottom">
                    <div class="col-md-4">
                        <h3 class="m_2">Our Trainers</h3>
                        <div class="course_demo">
                            <ul id="flexiselDemo3">	
                                <li><img src="images/pic4.jpg" /><div class="desc">
                                        <h3>Lorem Ipsum<br><span class="m_text">Spinning</span></h3>
                                        <p>Lorem ipsum dolor<br> sit amet, consectetuer.</p>
                                        <div class="coursel_list">
                                            <i class="heart1"> </i>
                                            <i class="like"> </i>
                                        </div>
                                        <div class="coursel_list1">
                                            <i class="twt"> </i>
                                            <i class="fb"> </i>
                                        </div>
                                        <div class="clear"></div>
                                    </div></li>
                                <li><img src="images/pic5.jpg" /><div class="desc">
                                        <h3>Lorem Ipsum<br><span class="m_text">Kik Boxing</span></h3>
                                        <p>Lorem ipsum dolor<br> sit amet, consectetuer.</p>
                                        <div class="coursel_list">
                                            <i class="heart2"> </i>
                                            <i class="like1"> </i>
                                        </div>
                                        <div class="coursel_list1">
                                            <i class="twt"> </i>
                                            <i class="fb"> </i>
                                        </div>
                                        <div class="clear"></div>
                                    </div></li>	
                                <li><img src="images/pic4.jpg" /><div class="desc">
                                        <h3>Lorem Ipsum<br><span class="m_text">Spinning</span></h3>
                                        <p>Lorem ipsum dolor<br> sit amet, consectetuer.</p>
                                        <div class="coursel_list">
                                            <i class="heart2"> </i>
                                            <i class="like1"> </i>
                                        </div>
                                        <div class="coursel_list1">
                                            <i class="twt"> </i>
                                            <i class="fb"> </i>
                                        </div>
                                        <div class="clear"></div>
                                    </div></li>	
                                <li><img src="images/pic5.jpg" /><div class="desc">
                                        <h3>Lorem Ipsum<br><span class="m_text">Kik Boxing</span></h3>
                                        <p>Lorem ipsum dolor<br> sit amet, consectetuer.</p>
                                        <div class="coursel_list">
                                            <i class="heart2"> </i>
                                            <i class="like1"> </i>
                                        </div>
                                        <div class="coursel_list1">
                                            <i class="twt"> </i>
                                            <i class="fb"> </i>
                                        </div>
                                        <div class="clear"></div>
                                    </div></li>	
                                <li><img src="images/pic4.jpg" /><div class="desc">
                                        <h3>Lorem Ipsum<br><span class="m_text">Spinning</span></h3>
                                        <p>Lorem ipsum dolor<br> sit amet, consectetuer.</p>
                                        <div class="coursel_list">
                                            <i class="heart2"> </i>
                                            <i class="like1"> </i>
                                        </div>
                                        <div class="coursel_list1">
                                            <i class="twt"> </i>
                                            <i class="fb"> </i>
                                        </div>
                                        <div class="clear"></div>
                                    </div></li>							    	  	       	   	    	
                            </ul>
                            <script type="text/javascript">
                                $(window).load(function() {
                                    $("#flexiselDemo3").flexisel({
                                        visibleItems: 4,
                                        animationSpeed: 1000,
                                        autoPlay: true,
                                        autoPlaySpeed: 3000,
                                        pauseOnHover: true,
                                        enableResponsiveBreakpoints: true,
                                        responsiveBreakpoints: {
                                            portrait: {
                                                changePoint: 480,
                                                visibleItems: 1
                                            },
                                            landscape: {
                                                changePoint: 640,
                                                visibleItems: 2
                                            },
                                            tablet: {
                                                changePoint: 768,
                                                visibleItems: 2
                                            }
                                        }
                                    });

                                });
                            </script>
                            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="m_2">Next Events</h3>
                        <div class="events">
                            <div class="event-top">
                                <ul class="event1">
                                    <h4>26 April, 2014</h4>
                                    <img src="images/pic.jpg" alt=""/>
                                </ul>
                                <ul class="event1_text">
                                    <span class="m_5">h.12.00-h.13.00</span>
                                    <h4>Aerobics</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,. </p>
                                    <div class="btn2">
                                        <a href="#">Reservation</a>
                                    </div>
                                </ul>
                                <div class="clear"></div>
                            </div>
                            <div class="event-bottom">
                                <ul class="event1">
                                    <h4>26 April, 2014</h4>
                                    <img src="images/pic.jpg" alt=""/>
                                </ul>
                                <ul class="event1_text">
                                    <span class="m_5">h.12.00-h.13.00</span>
                                    <h4>Spinning</h4>
                                    <p>Lorem ipsum dolor sit amet. </p>
                                    <div class="btn2">
                                        <a href="#">Reservation</a>
                                    </div>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="m_2">From the blog</h3>
                        <div class="blog_events">
                            <ul class="tab-left1">
                                <span class="tab1-img"><img src="images/pic7.jpg" alt=""></span>
                                <div class="tab-text1">
                                    <p><a href="#">nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip</a></p>
                                    <span class="m_date">25 April, 2014</span>
                                </div>
                                <div class="clear"></div>
                            </ul>
                            <ul class="tab-left1">
                                <span class="tab1-img"><img src="images/pic6.jpg" alt=""></span>
                                <div class="tab-text1">
                                    <p><a href="#">soluta nobis eleifend option congue nihil imperdiet doming id</a></p>
                                    <span class="m_date">25 April, 2014</span>
                                </div>
                                <div class="clear"></div>
                            </ul>
                            <ul class="tab-last1">
                                <span class="tab1-img"><img src="images/pic8.jpg" alt=""></span>
                                <div class="tab-text1">
                                    <p><a href="#">quod mazim placerat facer possim assum. Typi non habent</a></p>
                                    <span class="m_date">25 April, 2014</span>
                                </div>
                                <div class="clear"></div>
                            </ul> 
                        </div> -->
                    </div> 
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
                        <p>? 2015 DBMS and OOPs Project Team: Parishkrit Jain, Nikunj Jain, Pranjal
                            Aggarwal, Pawan Kumar and Suarabh Sisodiya.</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div> 
    </body>
</html>