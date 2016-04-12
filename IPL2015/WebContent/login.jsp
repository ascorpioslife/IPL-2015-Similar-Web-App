
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!--Project IPL T20 2015
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal
-->
<!DOCTYPE HTML>
<html>
<head>
<title>IPL T20 2015 | Login </title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
</head>
<body>
    <!-- start header_bottom -->
    <div class="header-bottom">
		 <div class="container">
			<div class="header-bottom_left">
				<span>IPL T20 2015 | Login Page</span>
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
                        <li><a href="#">Teams</a></li> <!--about.html-->
                        <li><a href="schedule.html">Schedule</a></li>
                        <li><a href="#">Tickets</a></li> <!--about.html-->
                        <li><a href="#">Fanzone</a></li> <!--about.html-->
                        <li><a href="#">About</a></li> <!--about.html-->
                        <li><a href="#">Contact</a></li> <!--about.html-->
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
	<!-- end menu -->
       <div class="main">
          <div class="login_top">
          	<div class="container">
			  <div class="col-md-6">
				 <div class="login-page">
					<h4 class="title">New Users</h4>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam 
                                           nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat 
                                           volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation 
                                           ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. 
                                           Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse
                                           molestie consequat, vel illum dolore eu feugiat nulla facilisis</p>
					<div class="button1">
					   <a href="register.html"><input type="submit" name="Submit" value="Create an Account"></a>
					 </div>
					 <div class="clear"></div>
				  </div>
				</div>
				<div class="col-md-6">
				 <div class="login-page">
				  <div class="login-title">
	           		<h4 class="title">Registered Users</h4>
					<div id="loginbox" class="loginbox">
						<form action="Loginhandler.jsp" method="post" name="login" id="login-form">
						  <fieldset class="input">
						    <p id="login-form-username">
						      <label for="modlgn_username">Email</label>
						      <input id="modlgn_username" type="text" name="email" class="inputbox" size="18" autocomplete="off">
						    </p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Password</label>
						      <input id="modlgn_passwd" type="password" name="password" class="inputbox" size="18" autocomplete="off">
						    </p>
						    <div class="remember">
							    <p id="login-form-remember">
							      <label for="modlgn_remember"><a href="#">Forgot Your Password ? </a></label>
							   </p>
							    <input type="submit" name="Submit" class="button" value="Login"><div class="clear"></div>
							 </div>
						  </fieldset>
						 </form>
					</div>
			      </div>
				</div>
				<div class="clear"></div>
			  </div>
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