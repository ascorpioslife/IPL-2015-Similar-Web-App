<%-- 
    Document   : top
    Created on : Apr 23, 2015, 11:59:13 AM
    Author     : parishkrit
--%>

<%@page import="org.ipl.main.Player"%>
<%@page import="org.ipl.main.Batsman"%>
<%@page import="org.ipl.main.Bowler"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.ipl.main.CapHandler"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.logging.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IPL T20 2015 | Fanzone</title>
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
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <!-- //grid-slider -->
    </head>
    <body>
        <!-- start header_bottom -->
        <div class="header-bottom">
            <div class="container">
                <div class="header-bottom_left">
                    <span>IPL T20 2015 | Favourite Stats</span>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- start menu -->
        <div class="menu" id="menu">
            <div class="container">
                <div class="logo">
                    <a href="index.jsp"><img src="images/Pepsi_IPL_Logo.png" alt="" width="71" height="45"/></a>
                </div>
                <div class="h_menu4"><!-- start h_menu4 -->
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="TeamPage.jsp">Teams</a></li> <!--about.html-->
                        <li ><a href="schedule.jsp">Schedule</a></li>
                        <li><a href="pricing.jsp">Tickets</a></li> <!--classes.html-->
                        <li class="active"><a href="top.jsp">Fanzone</a></li> <!--blog.html-->
                        
                        <li><a href="#">Contact</a></li> <!--contact.html-->
                    </ul> 
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
        <!-- end menu -->
        <div class="main">
            
            <div class="trainers_middle_bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="contact_hours">
                                <ul class="times_contact">
                                    <h3>Most Wickets <br><span class="opening"> Purple Cap </span></h3>
                                        <%
                                        
                                        FileInputStream fin;
                                        ArrayList<Bowler> bowlers = new ArrayList<Bowler>();
                                        ArrayList<Batsman> batsman = new ArrayList<Batsman>();
                                        try {
                                            fin = new FileInputStream("C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\db2.properties");
                                            Properties db2 = new Properties();
                                            db2.load(fin);
                                            //load the necessary drivers
                                            Class.forName(db2.getProperty("driver_class"));
                                            // make a connecton to db2 database
                                            Connection connect = DriverManager.getConnection(db2.getProperty("url"),
                                                    db2.getProperty("username"),
                                                    db2.getProperty("password"));
                                            String query = db2.getProperty("player.mostwkt");
                                            PreparedStatement pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs = pstmt.executeQuery();
                                            while(rs.next()) {
                                                bowlers.add(new Bowler(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
                                            }
                                            request.setAttribute("blist", bowlers);
                                            query = db2.getProperty("player.mostrun");
                                            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = pstmt.executeQuery();
                                            while(rs.next()) {
                                                batsman.add(new Batsman(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
                                            }
                                            request.setAttribute("btlist", batsman);
                                            query = db2.getProperty("player.mostsixes");
                                            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = pstmt.executeQuery();
                                            if(rs.next()) {
                                                request.setAttribute("psixes", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
                                            } else {
                                                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
                                            }
                                            query = db2.getProperty("player.mostlikes");
                                            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = pstmt.executeQuery();
                                            if(rs.next()) {
                                                request.setAttribute("plikes", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
                                            } else {
                                                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
                                            }
                                            query = db2.getProperty("player.mosthundreds");
                                            pstmt = connect.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = pstmt.executeQuery();
                                            if(rs.next()) {
                                                request.setAttribute("phundreds", new Player(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
                                            } else {
                                                request.setAttribute("psixes", new Player("Error", 0, 0, 0));
                                            }
                                    } catch (ClassNotFoundException ex) {
                                            Logger.getLogger(CapHandler.class.getName()).log(Level.SEVERE, null, ex);
                                     }  catch (SQLException ex) {
                                            Logger.getLogger(CapHandler.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                        
                                        
                                        
                                            int count = 0;
                                            ArrayList<Bowler> blist = (ArrayList<Bowler>) request.getAttribute("blist");
                                            for (Bowler b : blist) {
                                        %>
                                    <li>
                                        <span class="contact_week"><%= b.getName()%></span>
                                        <div class="hours1"><%= b.getWtaken()%> W</div> 
                                        <br />
                                        <br />
                                        <span class="contact_week">No. of Matches Played : </span>
                                        <div class="hours1"><%= b.getMatches()%></div>
                                        <br />
                                        <span class="contact_week">Economy : </span>
                                        <div class="hours1"><%= b.getEcon()%></div>
                                        <div class="clear"></div>
                                    </li>
                                    <%
                                        }
                                    %>

                                    <p>Keep Visiting for more Updates!</p>
                                    <h4>Enjoy it!</h4>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-5">
                            <div class="contact_hours" id="right">
                                <ul class="times_contact">
                                    <h3>Most Runs <br><span class="opening"> Orange Cap </span></h3>
                                        <%
                                            ArrayList<Batsman> btlist = (ArrayList<Batsman>) request.getAttribute("btlist");
                                            for (Batsman b : btlist) {
                                        %>
                                    <li>
                                        <span class="contact_week"><%= b.getName()%></span>
                                        <div class="hours1"><%= b.getRuns()%> R</div>
                                        <br />
                                        <br />
                                        <span class="contact_week">No. of Matches Played : </span>
                                        <div class="hours1"><%= b.getMatches()%></div>
                                        <br />
                                        <span class="contact_week">Strike Rate : </span>
                                        <div class="hours1"><%= b.getStrr()%></div>
                                        <div class="clear"></div>
                                    </li>
                                    <%
                                        }
                                    %>

                                    <p>Keep Visiting for more Updates!</p>
                                    <h4>Enjoy it!</h4>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%
                        Player psixes = (Player) request.getAttribute("psixes");
                    %>
                    <div class="row">
                        <div class="contact_bottom">
                            <ul class="join_text">
                                <h3><%= psixes.getName() %><br /><span class="m_26">(<%= psixes.getSixes() %> Sixes)</span></h3>
                                <br />
                                <p>Awarded to player with highest number of sixes in the tournament.</p>
                            </ul>
                            <ul class="btn_contact">
                                <a href="#">Most Glamorous Player</a>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <%
                        Player plikes = (Player) request.getAttribute("plikes");
                    %>
                    <div class="row">
                        <div class="contact_bottom" id="likes">
                            <ul class="join_text">
                                <h3><%= plikes.getName() %><br /><span class="m_26">(<%= plikes.getLikes() %> Likes)</span></h3>
                                <br />
                                <p>Awarded to player with highest number of likes given by the users.</p>
                            </ul>
                            <ul class="btn_contact">
                                <a href="#">Hottest Player</a>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <%
                        Player phundreds = (Player) request.getAttribute("phundreds");
                    %>
                    <div class="row">
                        <div class="contact_bottom" id="hundreds">
                            <ul class="join_text">
                                <h3><%= phundreds.getName() %><br /><span class="m_26">(<%= phundreds.getHundreds()%> Hundreds)</span></h3>
                                <br />
                                <p>Awarded to player who hits highest centuries in the tournament.</p>
                            </ul>
                            <ul class="btn_contact">
                                <a href="#">Most Hundreds</a>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>

                </div>
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
