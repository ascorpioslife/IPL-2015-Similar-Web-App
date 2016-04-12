<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!--Project IPL T20 2015
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal ,Pawan Kumar,Suarabh Sisodiya.-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>IPL T20 | 2015</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
        <!-- grid-slider -->
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
        <script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <!-- //grid-slider -->
    </head>
    <body>
        <!-- start header_top -->
        <div class="header">
            <div class="container">
                <div class="header-text">
                <h2>
                LIVE UPDATES :
                </h2>
                    <div id="matches"></div>
<script>
	var ONLY_SHOW_MATCH_FOR = "";
	function getScore(data){
		var matches = data.query.results.mchdata.match;
		for(var i=2;i<3;i++){
			if(matches[i].mchDesc.indexOf(ONLY_SHOW_MATCH_FOR)>=0){
				document.getElementById("matches").innerHTML+="<div>"+matches[i].mchDesc+"</div>";
				if(isNotUndefined(matches[i].mnum)){
					document.getElementById("matches").innerHTML+=matches[i].mnum;
				}
				if(isNotUndefined(matches[i].srs)){
					document.getElementById("matches").innerHTML+=", "+matches[i].srs;
				}
				if(isNotUndefined(matches[i].grnd)){
					document.getElementById("matches").innerHTML+="<div id='grnd"+i+"'>"+matches[i].grnd+"</div>";
				}
				if(isNotUndefined(matches[i].vcity)){
					document.getElementById("grnd"+i).innerHTML+=", "+matches[i].vcity;
				}
				if(isNotUndefined(matches[i].mscr) && isNotUndefined(matches[i].mscr.btTm) && isNotUndefined(matches[i].mscr.btTm.Inngs)){
					document.getElementById("matches").innerHTML+="<div id='btTm"+i+"'><b>"+matches[i].mscr.btTm.sName+": </b></div>";
					document.getElementById("btTm"+i).innerHTML+= matches[i].mscr.btTm.Inngs.r;
					document.getElementById("btTm"+i).innerHTML+= "/"+matches[i].mscr.btTm.Inngs.wkts;
					document.getElementById("btTm"+i).innerHTML+= " ("+matches[i].mscr.btTm.Inngs.ovrs+")";
				}
				if(isNotUndefined(matches[i].mscr) && isNotUndefined(matches[i].mscr.blgTm) && isNotUndefined(matches[i].mscr.blgTm.Inngs)){
					document.getElementById("matches").innerHTML+="<div id='blgTm"+i+"'><b>"+matches[i].mscr.blgTm.sName+": </b></div>";
					document.getElementById("blgTm"+i).innerHTML+= matches[i].mscr.blgTm.Inngs.r;
					document.getElementById("blgTm"+i).innerHTML+= "/"+matches[i].mscr.blgTm.Inngs.wkts;
					document.getElementById("blgTm"+i).innerHTML+= " ("+matches[i].mscr.blgTm.Inngs.ovrs+")";
				}
				if(isNotUndefined(matches[i].state) && isNotUndefined(matches[i].state.status)){
					document.getElementById("matches").innerHTML+="<div>"+matches[i].state.status+"</div>";
				}
				document.getElementById("matches").innerHTML+="<a href='http://www.cricbuzz.com/cricket-match/live-scores' target='_blank'>See details</a>";
				document.getElementById("matches").innerHTML+="<hr/>";
			}
		}
	}

	function isNotUndefined(val){
		if(val!=undefined && val!=null)
			return true;
		else
			return false;
	}
	function autoRefresh()
	{
		window.location = window.location.href;
	}
	 
	 setInterval('autoRefresh()', 60000); 
</script>
<script src="https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D%22http%3A%2F%2Fsynd.cricbuzz.com%2Fj2me%2F1.0%2Flivematches.xml%22&format=json&callback=getScore"></script>
                
                
                </div>
                <div class="header-arrow">
                    <a href="#menu" class="class scroll"><span> </span> </a>
                </div>
            </div>
        </div>
        <!-- end header_top -->
        <!-- start menu -->
        <div class="menu" id="menu">
            <div class="container">
                <div class="logo">
                    <a href="index.html"><img src="images/Pepsi_IPL_Logo.png" alt="" width="71" height="45"/></a>
                </div>
                <div class="h_menu4"><!-- start h_menu4 -->
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="TeamPage.jsp">Teams</a></li> <!--about.html-->
                        <li><a href="schedule.jsp">Schedule</a></li>
                        <li><a href="pricing.jsp">Tickets</a></li> <!--classes.html-->
                        <li><a href="top.jsp">Fanzone</a></li> <!--blog.html-->
                        <li><a href="Standings.jsp">Standings</a></li> <!--pricing.html-->
                        <li><a href="adminLogin.jsp">Admin</a></li> <!--pricing.html-->
                        <li><a href="#">Contact</a></li> <!--contact.html-->
                       
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
        <!-- end menu -->
        <div class="main">
            <!-- start content-top -->
            <div class="container">
                <div class="row content-top">
                    <div class="col-md-5">
                        <img src="images/start.jpg" class="img-responsive" alt="" /> 
                    </div>
                    <div class="col-md-7 content_left_text">
                        <h3>This Season, Join The Fever!</h3>
                        <p>The Indian Premier League (IPL) is the most-watched Twenty20 
                            league in the world. Don't miss the chance this year. Book your 
                            ticket now!</p>
                    </div>
                </div>
            </div>
            <!-- end content-top -->
            <div class="container">
                <div class="row about">
                    <div class="col-md-4">
                    <%  
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							//next match
							String query1 = "SELECT * FROM IPL.SCHEDULE WHERE STATUS IS NULL  order by matchno  LIMIT 1";
							//previous match
							String query2 = "SELECT * FROM IPL.SCHEDULE WHERE STATUS IS NOT NULL AND MATCHNO IN (SELECT MAX(MATCHNO) FROM IPL.SCHEDULE WHERE STATUS IS NOT NULL) order by matchno";
							String query3 = "SELECT * FROM IPL.TEAM";
							
							PreparedStatement stmt1 = null;
							PreparedStatement stmt2 = null;
							PreparedStatement stmt3 = null;
							stmt1 = c.prepareStatement(query1);
							stmt2 = c.prepareStatement(query2);
							stmt3 = c.prepareStatement(query3);
							ResultSet rs1,rs2,rs3;
							rs1 = stmt1.executeQuery();
							rs1.next();
							rs2 = stmt2.executeQuery();
							rs2.next();
							rs3 = stmt3.executeQuery();
							rs3.next();
							String prev_Team1 = rs2.getString(4);
							String prev_Team2 = rs2.getString(5);
							String next_Team1 = rs1.getString(4);
							String next_Team2 = rs1.getString(5);
							String prev_Team1_logo = "SELECT TEAMLOGO FROM IPL.TEAM WHERE NAME="+"'"+prev_Team1+"'";
							String prev_Team2_logo ="SELECT TEAMLOGO FROM IPL.TEAM WHERE NAME="+"'"+prev_Team2+"'";
							String next_Team1_logo = "SELECT TEAMLOGO FROM IPL.TEAM WHERE NAME="+"'"+next_Team1+"'";
							String next_Team2_logo ="SELECT TEAMLOGO FROM IPL.TEAM WHERE NAME="+"'"+next_Team2+"'";
							PreparedStatement stmt4 = null;
							PreparedStatement stmt5 = null;
							PreparedStatement stmt6 = null;
							PreparedStatement stmt7 = null;
							ResultSet rs4,rs5,rs6,rs7;
							stmt4 = c.prepareStatement(prev_Team1_logo );
							stmt5 = c.prepareStatement(prev_Team2_logo );
							stmt6 = c.prepareStatement(next_Team1_logo );
							stmt7 = c.prepareStatement(next_Team2_logo );
							rs4 = stmt4.executeQuery();
							rs4.next();
							rs5 = stmt5.executeQuery();
							rs5.next();
							rs6 = stmt6.executeQuery();
							rs6.next();
							rs7= stmt7.executeQuery();
							rs7.next();
							
											%>
                        <h3 class="m_2">Previous Match</h3>
                        <div class="events">
                            <div class="event-top">
                                <ul class="event1">
                                <H5 CLASS="nextmatch"><%=rs2.getString("GROUND") %></H5>
                                    <h4><%= rs2.getString(2) %></h4>
                                    <img src="<%=rs4.getString(1) %>" alt=""/  height="100" width="120">
                                </ul>
                                <ul class="event1_text">
                                    <h4><%= rs2.getString("TEAM1") %><h4>
                                    
                                    <h4></h4>
                                    <BR>
                                    <div class="btn2">
                                        <a href="#">Details</a>
                                    </div>
                                </ul>
                                <div class="clear">
                                
                                </div>
                            </div>
                             
                            <div class="event-bottom">
                                <ul class="event1">
                                    
                                    <img src="<%=rs5.getString(1) %>" alt=""/  height="100" width="120">
                                </ul>
                                <ul class="event1_text">
                                    <h4><% 	
                                    						String loser;
                                    						if(rs2.getString("winner").contentEquals(rs2.getString("team2")))
                                    							loser =  rs2.getString("team1");
                                  						  else
                                  							loser =  rs2.getString("team2");
                                    		%>
                                    		
                                    		</h4>
                                    		 <h4><%= rs2.getString("TEAM2") %><h4>
                                    <h4></h4>
                                    <% String result=rs2.getString(9)+" " + rs2.getString(10) + " BY " + rs2.getString(11) ;%>
                                    <p><%=result %></p>
                                    <p>Man of the Match :<%=rs2.getString("MOM")%></p>
                                    		
                                   
                                   
                                    <div class="btn2">
                                        <a href="#">Details</a>
                                        
                                        
                                    </div>
                                    
                                </ul>
                                
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="m_2">Next Match</h3>
                        
                        <div class="events">
                            <div class="event-top">
                             <h4 style="color: white;">
                              <%=rs1.getString("GROUND") %>
                              </h4>
                             
                            
                                <ul class="event1">
                               
                                    <h4><%= rs1.getString(2) %></h4>
                                    <img src="<%=rs6.getString(1) %>" alt=""/  height="100" width="120">
                                </ul>
                                <ul class="event1_text">
                                    <span class="m_5"><%= rs1.getString(3) %> (IST)</span>
                                    <h4><%= rs1.getString(4) %></h4>
                                    <p>Players of <%= rs1.getString(4) %> are ready and excited ,Are you? </p>
                                    <div class="btn2">
                                        <a href="#">Details</a>
                                    </div>
                                     
                                </ul>
                                <div class="clear">
                                </div>
                            </div>
                            <div class="event-bottom">
                                <ul class="event1">
                                   
                                    <img src="<%=rs7.getString(1) %>" alt=""/  height="100" width="120">
                                </ul>
                                
                                <ul class="event1_text">
                                    
                                    <h4><%= rs1.getString(5) %></h4>
                                    <p>And <%= rs1.getString(5) %> is in well form , and ready to beat anyone,So to whom you are gonna support? </p>
                                    <div class="btn2">
                                        <a href="#">Details</a>
                                    </div>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="m_4">IPL 2015 Tickets</h3>
                        <div class="members">
                            <h4 class="m_3">Grab a chance to view IPL</h4>
                            <p>Every match, Every venue <br>Book your ticket at the earliest.</p>
                            <div class="btn1">
                                <a href="pricing.jsp">Book Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                   
                
            </div>
            <div class="container"></div>
            <div class="traine_login">
                <div class="row login_details">
                    <div class="col-md-6">
                        <div class="join">
                            <h3>Why Join ?</h3>
                            <h4>select your favourite player</h4>
                            <p>Sign-Up today to book a ticket and  grab a chance to view IPL.<br> This season, join the fever. Make sure to watch IPL. Join us now.</p>	
                            <div class="btn3">
                                <a href="register.jsp">Register Today</a>
                            </div>	
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="join-right">
                            <h3>Log-in Now</h3>
                            <h4>registered users can log-in now</h4>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam<br> nibh euismod tincidunt ut laoreet dolore magna . </p>	
                            <div class="buttons_login">
                                <div class="btn4">
                                    <a href="login.html">Log In</a>
                                </div>	
                                
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            
            <div class="container">
                <div class="row about">
                    
                        <h3 class="m_2">Gallery</h3>
                        <div id="ca-container" class="ca-container">
                            <div class="ca-wrapper">
                                <div class="ca-item ca-item-1">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon1"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-2">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon2"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-3">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon3"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-4">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon4"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-5">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon5"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-6">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon6"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-7">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon7"> </div>
                                    </div>
                                </div>
                                <div class="ca-item ca-item-8">
                                    <div class="ca-item-main">
                                        <div class="ca-icon"> </div>
                                        <div class="ca-icon8"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
            $('#ca-container').contentcarousel();
                        </script>
                    
                    <div class="clear"></div>
                </div>
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