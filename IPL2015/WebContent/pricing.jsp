<%-- Project IPL T20 2015
Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.ipl.book.BookWindow"%>
<%@page import="org.ipl.book.BookPageHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>IPL T20 2015 | Tickets</title>
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
                    <span>IPL T20 2015 | Book Your Tickets</span>
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
                        <li class="active"><a href="pricing.jsp">Tickets</a></li> <!--about.html-->
                        <li><a href="top.jsp">Fanzone</a></li> <!--about.html-->
                        <li><a href="Standings.jsp">Standings</a></li> <!--about.html-->
                        <li><a href="#">Contact</a></li> <!--about.html-->
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
        <!-- end menu -->
        <div class="main">
            <div class="about_banner_img"><img src="images/pricing_banner.jpg" class="img-responsive" alt=""/></div>
            <div class="about_banner_wrap">
                <h1 class="m_11">Bookings</h1>
            </div>
            <div class="border"> </div>
            <div class="container">
                <div class="row price_plans">
                    <h3 class="m_2">Book Your Ticket</h3>
                    <div class="price_plans_box">


                       
                        <%
                        BookWindow b;
                        System.out.println("nikunj");
                        ArrayList<BookWindow> windows = new ArrayList<BookWindow>();
                        while((b = BookWindow.loadnext()) != null) {
                            windows.add(b);
                        }
                            int count = 0;
                          //  ArrayList<BookWindow> windows = (ArrayList<BookWindow>) request.getAttribute("windows");
                            for (BookWindow window : windows) {
                        %>
                        <%
                            if (count % 4 == 0) {
                        %>
                        <div class="row">
                            <%
                                }
                                if (window.getSeats() > 0) {
                                    int matchno = window.getMatchno();
                                    String ground = window.getGround();
                                    String city = window.getCity();
                                    int price = window.getPrice();
                                    int seats = window.getSeats();
                            %>
                            <div class="col-md-3" id="pcard">
                                <ul class="price1">
                                    <h4><%= ground%></h4>
                                    <h2 class="m_25">&#8377; <%= price%><small>.00</small></h2>
                                    <ul class="price_list">
                                        <p><img src="images/tick.png" alt="" align="middle" width="16" height="14"/><a href="#"><%= window.getTeam1()%></a></p>
                                        <p><a href="#">Vs</a></p>
                                        <p><img src="images/tick.png" alt="" align="middle" width="16" height="14"/><a href="#"><%= window.getTeam2()%></a></p>                         
                                        <p><a href="#">Match No. : <%= matchno%></a></p>
                                        <p><a href="#">Seats Available : <%= seats%></a></p>
                                        <p><a href="#">City - <%= city%></a></p>
                                        <a href="buy.jsp?matchno=<%= matchno%>&ground=<%= ground%>&price=<%= price%>&city=<%= city%>&seats=<%= seats%>" target="_blank"><li class="price_but">Buy Now</li></a>
                                        <div class="clear"></div>
                                    </ul>
                                </ul>
                            </div>
                            <%
                            } else {
                            %> 
                            <div class="col-md-3" id="pcard">
                                <ul class="price2">
                                    <h4><%= window.getGround()%></h4>
                                    <h2 class="m_26">&#8377; <%= window.getPrice()%><small>.00</small></h2>
                                    <ul class="price_list1">
                                        <p><img src="images/tick1.png" alt="" align="middle" width="16" height="14"/><a href="#"><%= window.getTeam1()%></a></p>
                                        <p><a href="#">Vs</a></p>
                                        <p><img src="images/tick1.png" alt="" align="middle" width="16" height="14"/><a href="#"><%= window.getTeam2()%></a></p>
                                        <p><a href="#">Match No. : <%= window.getMatchno()%></a></p>
                                        <p><a href="#">Seats Available : 00</a></p>
                                        <p><a href="#">City - <%= window.getCity()%></a></p>
                                        <li class="price_but1">Seats Full!</li></a>
                                        <div class="clear"></div>
                                    </ul>
                                </ul>
                            </div>
                            <%
                                }
                                count++;
                                if (count % 4 == 0) {
                            %>
                        </div>
                        <%
                                }

                            }
                            if (count % 4 != 0) {
                        %> 
                    </div>
                    <%
                        }
                    %>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <ul class="price_question">
            <div class="container">
                <li class="question_left"><h4>Have a question</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.</p></li>
                <li class="question_right">1-300-248-2456</li>
                <div class="clear"></div>
            </div>
        </ul>


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
                        <li><a href="schedule.html">Schedule</a></li>
                        <li><a href="pricing.html">Tickets</a></li>
                        <li><a href="#">Fanzone</a></li>
                        <li><a href="index.html">Home</a></li>
                    </ul>
                    <ul class="list">
                        <h4 class="m_7">Links</h4>
                        <li><a href="register.jsp">Sign-up</a></li>
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