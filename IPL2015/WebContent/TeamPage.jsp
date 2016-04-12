<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>IPL 2015 | TEAMS</title>
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
				<i class="phone"> </i><span>1-200-346-2986</span>
			</div>
			<div class="social">	
			   <ul>	
				  <li class="facebook"><a href="#"><span> </span></a></li>
				  <li class="twitter"><a href="#"><span> </span></a></li>
				  <li class="pinterest"><a href="#"><span> </span></a></li>	
				  <li class="google"><a href="#"><span> </span></a></li>
				  <li class="tumblr"><a href="#"><span> </span></a></li>
				  <li class="instagram"><a href="#"><span> </span></a></li>	
				  <li class="rss"><a href="#"><span> </span></a></li>							
			   </ul>
		   </div>
		   <div class="clear"></div>
		</div>
    </div>
	<!-- start menu -->
    <div class="menu">
	  <div class="container">
		 <div class="logo">
			
		 </div>
		 <div class="h_menu4"><!-- start h_menu4 -->
		   <a class="toggleMenu" href="#">Menu</a>
			 <ul class="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="TeamPage.jsp">Teams</a></li> <!--about.html-->
                        <li><a href="schedule.jsp">Schedule</a></li>
                        <li><a href="pricing.jsp">Tickets</a></li> <!--classes.html-->
                        <li><a href="top.jsp">Fanzone</a></li> <!--blog.html-->
                        <li><a href="Standings">Standings</a></li> <!--contact.html-->
                        <li><a href="#">Contact</a></li> <!--pricing.html-->
                        
			 </ul>
			  <script type="text/javascript" src="js/nav.js"></script>
		  </div><!-- end h_menu4 -->
		 <div class="clear"></div>
	  </div>
	</div>
	<div class="main">
       <div class="about_banner_img"><img src="images/IPLallteams.jpg" class="img-responsive" alt=""/></div>
		 <div class="about_banner_wrap">
      	    <h1 class="m_11">IPL 2015 TEAMS</h1>
      	</div>
		<div class="border"> </div> 
		 <div class="container">
		   <div class="classes_wrapper">
		 	<div class="row class_box">
                                                        <%  
        					Class.forName("com.ibm.db2.jcc.DB2Driver");
							Connection c = DriverManager.getConnection("jdbc:db2://localhost:50000/IPL15","Student","cookies888");
							String query = "SELECT * FROM IPL.TEAM";
							PreparedStatement stmt = null;
							stmt = c.prepareStatement(query);
							ResultSet rs;
							rs = stmt.executeQuery();
											%>
                            <%
                                
                                       while(rs.next()){ 
       													 %>
 			  <div class="col-md-6">
				<div class="class_left">
				<img src="<%=rs.getString(8)%>" height="180" width="220" alt=""/ title="<%= rs.getString(1)%>">
				
				</div>
				<div class="class_right">
					<h3><%= rs.getString(1)%></h3>
					<p></p>
					<div class="class_img">
					  <img src="<%=rs.getString(9)%>" alt=""/>
					  <div class="class_desc">
					  	<h5>Captain</h5>
					  	<h4><%= rs.getString(2)%></h4>
					  	<h5>Owner</h5>
                        <h4><%= rs.getString(6)%></h4>
                     
                     
					  </div>
					    <div class="clear"></div>
					     <ul class="buttons_class">
					  	 <!--<li class="btn5"><a href="#">Read More</a></li>	
				         <li class="btn6"><a href="#">Timetable</a></li>-->	
			            <div class="clear"></div>
			         </ul>
					</div>
					 <p style="margin-left: 60px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Matches: <%= rs.getInt(3) %></p>
                      <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Won : <%= rs.getInt(4) %> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lost : <%= rs.getInt(5) %>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tied : <%= rs.getInt(3)-(rs.getInt(4)+rs.getInt(5)) %></p>
					<br>
				</div>
				<div class="clear"></div>
			  </div>
                                            
                          <% 
            } 
        %> 
			<!--   <div class="col-md-6">
				<div class="class_left">
					<a href="single_class.html"><img src="images/c1.jpg" class="img-responsive" alt=""/ title="continue"></a>
				</div>
                   
				<div class="class_right1">
					<h3>hbbbb</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
					<div class="class_img">
					  <img src="images/c8.jpg" alt=""/>
					  <div class="class_desc1">
					  	<h4>Trainer</h4>
					  	<h5>laoreet dolore</h5>
					  	<p>iusto odio dignissim</p>
					  </div>
					   <div class="clear"></div>
					   <ul class="buttons_class">
					  	 <li class="btn7"><a href="#">Read More</a></li>	
				         <li class="btn8"><a href="#">Timetable</a></li>	
			            <div class="clear"></div>
			           </ul>
					</div>
				  </div>
			    </div>
			  <div class="clear"></div>
			 </div>	
			 <div class="row class_box">
 			   <div class="col-md-6">
				<div class="class_left">
					<a href="single_class.html"><img src="images/c6.jpg" class="img-responsive" alt=""/ title="continue"></a>
				</div>
				<div class="class_right">
				
                                    <h3>cbhdbh</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
					<div class="class_img">
					  <img src="images/c9.jpg" alt=""/>
					  <div class="class_desc">
					  	<h4>Trainer</h4>
					  	<h5>laoreet dolore</h5>
					  	<p>iusto odio dignissim</p>
					  </div>
					    <div class="clear"></div>
					     <ul class="buttons_class">
					  	 <li class="btn5"><a href="#">Read More</a></li>	
				         <li class="btn6"><a href="#">Timetable</a></li>	
			            <div class="clear"></div>
			         </ul>
					</div>
				</div>
				<div class="clear"></div>
			  </div>	
			   <div class="col-md-6">
				<div class="class_left">
					<a href="single_class.html"><img src="images/c5.jpg" class="img-responsive" alt=""/ title="continue"></a>
				</div>
				<div class="class_right1">
					<h3>Aerobics</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
					<div class="class_img">
					  <img src="images/c10.jpg" alt=""/>
					  <div class="class_desc1">
					  	<h4>Trainer</h4>
					  	<h5>laoreet dolore</h5>
					  	<p>iusto odio dignissim</p>
					  </div>
					   <div class="clear"></div>
					   <ul class="buttons_class">
					  	 <li class="btn7"><a href="#">Read More</a></li>	
				         <li class="btn8"><a href="#">Timetable</a></li>	
			            <div class="clear"></div>
			           </ul>
					</div>
				 </div>
			    </div>
			   <div class="clear"></div>
			 </div>	
			 <div class="row class_box1">
 			  <div class="col-md-6">
				<div class="class_left">
					<a href="single_class.html"><img src="images/c3.jpg"  class="img-responsive" alt=""/ title="continue"></a>
				</div>
				<div class="class_right">
					<h3>Cardio Fitness</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
					<div class="class_img">
					  <img src="images/c11.jpg" alt=""/>
					  <div class="class_desc">
					  	<h4>Trainer</h4>
					  	<h5>laoreet dolore</h5>
					  	<p>iusto odio dignissim</p>
					  </div>
					    <div class="clear"></div>
					     <ul class="buttons_class">
					  	 <li class="btn5"><a href="#">Read More</a></li>	
				         <li class="btn6"><a href="#">Timetable</a></li>	
			            <div class="clear"></div>
			         </ul>
					</div>
				  </div>
				<div class="clear"></div>
			  </div>	
			   <div class="col-md-6">
				<div class="class_left">
					<a href="single_class.html"><img src="images/c4.jpg" class="img-responsive"  alt=""/ title="continue"></a>
				</div>
				<div class="class_right1">
					<h3>Yoga</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
					<div class="class_img">
					  <img src="images/c12.jpg" alt=""/>
					  <div class="class_desc1">
					  	<h4>Trainer</h4>
					  	<h5>laoreet dolore</h5>
					  	<p>iusto odio dignissim</p>
					  </div>
					   <div class="clear"></div>
					   <ul class="buttons_class">
					  	 <li class="btn7"><a href="#">Read More</a></li>	
				         <li class="btn8"><a href="#">Timetable</a></li>	
			            <div class="clear"></div>
			           </ul>
					</div>
				</div>
			   </div>
			   <div class="clear"></div>
			 </div>	
			<div class="clear"></div> 	   		
		   </div>
		   <div class="row classes_bottom">
		      <div class="col-md-8">
		     	 <h3 class="m_2">All Classes</h3>
		     	 <div class="classes">
		     	 	<div class="cardio_list">
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Cardio Fitness</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					     </div>
			     	 	 <div class="clear"></div>
		     	 	  </div>
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Spinning</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					    </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Pilates</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	   <div class="clear"></div>
		     	 	  </div>
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Boxing</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	</div>
		     	 	<div class="cardio_list1">
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Aerobics</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Kik Boxing</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	  <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>CrossFit</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	   <div class="cardio_sublist">
			     	 	<ul class="cardio">
			     	 		<li><i class="clock"> </i><span>Yoga</span></li>
			     	 	</ul>
			     	 	<div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="timetable"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Send to"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="like it"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="share"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
			     	 	<div class="clear"></div>
		     	 	  </div>
		     	 	</div>
		     	 	<div class="clear"></div>
		     	 </div>
				</div>
				<div class="col-md-4">
				  <h3 class="m_4">Membership Prices</h3>
				  <div class="members">
				   <h4 class="m_3">25% Discount of for all members</h4>
				   <p>Discount on services and <br>treatments at the GymBase for<br> all membership cards holders.</p>
				   <div class="btn1">
				    <a href="#">More</a>
			       </div>-->
				  </div>
			    </div>
			    <div class="clear"></div>
			</div>
			</div>
			<!--  <div class="traine_login">
	  	    <div class="row login_details">
		 	  <div class="col-md-6">
				  <div class="join">
				  	 <h3>Why Join ?</h3>
				  	 <h4>sed diam nonummy nibh euismod</h4>
				  	 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam<br> nibh euismod tincidunt ut laoreet dolore magna . </p>	
				  	 <div class="btn3">
				       <a href="#">Join Today</a>
			         </div>	
				  </div>
				</div>
				 <div class="col-md-6">
				  <div class="join-right">
				  	 <h3>Why Join ?</h3>
				  	 <h4>sed diam nonummy nibh euismod</h4>
				  	 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam<br> nibh euismod tincidunt ut laoreet dolore magna . </p>	
				  	 <div class="buttons_login">
				  	 <div class="btn4">
				       <a href="login.html">Log In</a>
			         </div>	
			         <div class="p-ww">
					  <form>
					   <input class="date" id="datepicker" type="text" value="View Calender" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'View Calender';}">
					  </form>
				     </div>
			         <div class="clear"></div>
			         
				  <script src="js/jquery-ui.js"></script>
				  <script>
				  $(function() {
				    $( "#datepicker" ).datepicker();
				  });
				  </script>
				  </div>
				  </div>
				</div>
				<div class="clear"></div>
		   </div>
	   </div> 
	   <div class="about_gallery">
		   <div class="container">
		 	  <div class="col-md-8">
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
								<div class="ca-icon"> </div>
							</div>
						</div>
			    </div>
			 </div>
				    <script type="text/javascript">
						$('#ca-container').contentcarousel();
					</script>
		    </div>
		    <div class="col-md-4">
		   	 <h3 class="m_2">Partner</h3>
			  <ul class="partner">
			  	<li><img src="images/p6.png" alt=""/></li>
			  	<li><img src="images/p5.png" alt=""/></li>
			  	<li><img src="images/p4.png" alt=""/></li>
			  	<li><img src="images/p3.png" alt=""/></li>
			  	<li><img src="images/p2.png" alt=""/></li>
			  	<li><img src="images/p1.png" alt=""/></li>
			  	 <div class="clear"></div>
			  </ul>
		    </div>
	       <div class="clear"></div>
	       </div>
		 </div>
		</div>
		<div class="footer-bottom">
		   <div class="container">
		 	 <div class="row section group">
				<div class="col-md-4">
				   <h4 class="m_7">Newsletter Signup</h4>
				   <p class="m_8">Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed diam nonummy.</p>
				      <form class="subscribe">
			             <input type="text" value="Insert Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Insert Email';}">
					  </form>
			          <div class="subscribe1">
			            <a href="#">Submit Email<i class="but_arrow"> </i></a>
			          </div>
				</div>
				<div class="col-md-4">
					<div class="f-logo">
						<img src="images/logo.png" alt=""/>
					</div>
					<p class="m_9">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis</p>
					<p class="address">Phone : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">(00) 222 666 444</span></p>
					<p class="address">Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">info[at]mycompany.com</span></p>
				</div>
				<div class="col-md-4">
					<ul class="list">
						<h4 class="m_7">Menu</h4>
						<li><a href="#">About</a></li>
						<li><a href="#">Trainers</a></li>
						<li><a href="#">Classes</a></li>
						<li><a href="#">Pricing</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
					<ul class="list1">
						<h4 class="m_7">Community</h4>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Forum</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">Newsletter</a></li>
					</ul>
				</div>
				<div class="clear"></div>
	  		  </div>
		 	</div>
		 </div>
		 <div class="copyright">
		  <div class="container">
		    <div class="copy">
		        <p>? 2014 Template by <a href="http://w3layouts.com" target="_blank"> w3layouts</a></p>
		    </div>
		    <div class="social">	
			   <ul>	
				  <li class="facebook"><a href="#"><span> </span></a></li>
				  <li class="twitter"><a href="#"><span> </span></a></li>
				  <li class="pinterest"><a href="#"><span> </span></a></li>	
				  <li class="google"><a href="#"><span> </span></a></li>
				  <li class="tumblr"><a href="#"><span> </span></a></li>
				  <li class="instagram"><a href="#"><span> </span></a></li>	
				  <li class="rss"><a href="#"><span> </span></a></li>							
			   </ul>
		    </div>
		   <div class="clear"></div>
		  </div>
	     </div><div class="footer-bottom">
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
                            <li><a href="#">About</a></li> 
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
                            <li><a href="#">Contact</a></li> 
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
        </div> <div class="footer-bottom">
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
                            <li><a href="#">About</a></li> 
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
                            <li><a href="#">Contact</a></li> 
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
        </div> -->
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