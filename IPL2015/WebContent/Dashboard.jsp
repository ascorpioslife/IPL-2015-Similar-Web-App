
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" import="java.io.*" errorPage=""%>
<%@page import="java.util.Properties"%>
<!--Project IPL T20 2015
     
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal
-->
<!DOCTYPE HTML>
<html>
<head>
<title><%=session.getAttribute("username")%> | Dashboard</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700'
	rel='stylesheet' type='text/css'>
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<script src="js/jquery.min.js"></script>
</head>
<body>
	<!-- start header_bottom -->
	<div class="header-bottom">
		<div class="container">
			<div class="header-bottom_left">
				<span>IPL T20 2015 | Dashboard</span>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- start menu -->
	<div class="menu" id="menu">
		<div class="container">
			<div class="logo">
				<a href="index.html"><img src="images/Pepsi_IPL_Logo.png" alt=""
					width="71" height="45" /></a>
			</div>
			<div class="h_menu4">
				<!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#">Teams</a></li>
					<!--about.html-->
					<li><a href="schedule.jsp">Schedule</a></li>
					<li><a href="#">Tickets</a></li>
					<!--about.html-->
					<li><a href="#">Fanzone</a></li>
					<!--about.html-->
					<li><a href="#">About</a></li>
					<!--about.html-->
					<li><a href="#">Contact</a></li>
					<!--about.html-->
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
			</div>
			<!-- end h_menu4 -->
			<div class="clear"></div>
		</div>
	</div>
	<!-- end menu 
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
         </div> -->
	<!-- Contents of dashboard -->
	<div class="dash_content">
		<div class="dash_wc">

			<h2 class="head_dash">
				Welcome
				<%=session.getAttribute("username") + " !"%></h2>
			<br>
			<div class="playerselector">
				<h3 class="head_dash">Select & Rate your Favourite Players !</h3>
				<br>


				<ul class="starlist">
					<li class="starlistelement"><img
						src="images/rating_5stars.jpg" width="150" height="42"></li class="starlistelement" >
					<li><img src="images/rating_3stars.jpg" width="150"
						height="42"></li>
					<li class="starlistelement"><img
						src="images/rating_2stars.jpg" width="150" height="42"></li>
				</ul>
				<br>
				<form action="favselector.jsp" id="favform" method="post">
					<ul class="starlist">
						<li>
							<div>
								<select name='fav1' form="favform">
									<option value="none">Select a Player</option>
									<%
										//Pulls the ids and decriptions from the codes table and stores them in the first drop down
										FileInputStream fin = null;
										try {
											fin = new FileInputStream(
													"C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
											Properties db2 = new Properties();
											db2.load(fin);
											ResultSet rs;
											//load the necessary drivers
											Class.forName(db2.getProperty("driver_class"));
											// make a connecton to db2 database
											Connection connect = DriverManager.getConnection(
													db2.getProperty("url"), db2.getProperty("username"),
													db2.getProperty("password"));
											String query = db2.getProperty("allplayers");
											PreparedStatement stmt = connect.prepareStatement(query);
											rs = stmt.executeQuery();
											String str;
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getInt(1)%>
										<%=rs.getString(2)%></option>
									<%
										}

											//Closes the database connection
											stmt.close();
											connect.close();
										} catch (ClassNotFoundException e) {
											System.err.println("ClassNotFoundException: " + e.getMessage());
										} catch (SQLException e) {
											System.err.println("SQLException: " + e.getMessage());
										} catch (Exception e) {
											System.err.println("Generic Exception: " + e.getMessage());
										}
									%>
								</select>
							</div>
						</li>



						<li>
							<div>
								<select name='fav2' form="favform">
									<option value="none">Select a Player</option>
									<%
										//Pulls the ids and decriptions from the codes table and stores them in the first drop down
										FileInputStream fin1 = null;
										try {
											fin = new FileInputStream(
													"C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
											Properties db2 = new Properties();
											db2.load(fin);
											ResultSet rs;
											//load the necessary drivers
											Class.forName(db2.getProperty("driver_class"));
											// make a connecton to db2 database
											Connection connect = DriverManager.getConnection(
													db2.getProperty("url"), db2.getProperty("username"),
													db2.getProperty("password"));
											String query = db2.getProperty("allplayers");
											PreparedStatement stmt = connect.prepareStatement(query);
											rs = stmt.executeQuery();
											String str;
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getInt(1)%>
										<%=rs.getString(2)%></option>
									<%
										}

											//Closes the database connection
											stmt.close();
											connect.close();
										} catch (ClassNotFoundException e) {
											System.err.println("ClassNotFoundException: " + e.getMessage());
										} catch (SQLException e) {
											System.err.println("SQLException: " + e.getMessage());
										} catch (Exception e) {
											System.err.println("Generic Exception: " + e.getMessage());
										}
									%>
								</select>
							</div>
						</li>
						<li>
							<div>
								<select name='fav3' form="favform">
									<option value="none">Select a Player</option>

									
									<%
										//Pulls the ids and decriptions from the codes table and stores them in the first drop down
										FileInputStream fin2 = null;
										try {
											fin2 = new FileInputStream(
													"C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
											Properties db2 = new Properties();
											db2.load(fin2);
											ResultSet rs;
											//load the necessary drivers
											Class.forName(db2.getProperty("driver_class"));
											// make a connecton to db2 database
											Connection connect = DriverManager.getConnection(
													db2.getProperty("url"), db2.getProperty("username"),
													db2.getProperty("password"));
											String query = db2.getProperty("allplayers");
											PreparedStatement stmt = connect.prepareStatement(query);
											rs = stmt.executeQuery();
											String str;
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getInt(1)%>
										<%=rs.getString(2)%></option>
									<%
										}

											//Closes the database connection
											stmt.close();
											connect.close();
										} catch (ClassNotFoundException e) {
											System.err.println("ClassNotFoundException: " + e.getMessage());
										} catch (SQLException e) {
											System.err.println("SQLException: " + e.getMessage());
										} catch (Exception e) {
											System.err.println("Generic Exception: " + e.getMessage());
										}
									%>







								</select>
							</div>
						</li>
					</ul>
				</form>
				<br> <input type="submit" name="Submit" class="button"
					value="Submit" form="favform">
			</div>

		</div>




		</div>

	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="row section group">
				<div class="col-md-4">
					<div class="f-logo">
						<img src="images/Pepsi_IPL_Logo.png" alt="" width="71" height="45" />
					</div>
					<p class="m_9">Lorem ipsum dolor sit amet, consectetuer
						adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
						laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim
						veniam, quis</p>
					<p class="address">
						Phone : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">(00)
							222 666 444</span>
					</p>
					<p class="address">
						Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">info[at]mycompany.com</span>
					</p>
				</div>
				<div class="col-md-3">
					<ul class="list">
						<h4 class="m_7">Menu</h4>
						<li><a href="#">About</a></li>
						<!--about.html-->
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
						<!--contact.html-->
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
				<p>© 2015 DBMS and OOPs Project Team: Parishkrit Jain, Nikunj
					Jain, Pranjal Aggarwal, Pawan Kumar and Suarabh Sisodiya.</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>