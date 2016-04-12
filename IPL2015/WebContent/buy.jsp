<%-- 
    Document   : buy
    Created on : Apr 20, 2015, 11:40:09 PM
    Author     : parishkrit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- //grid-slider -->
        <title>Payment Page</title>
    </head>
    <body>
      <!-- start header_bottom -->
        <div class="header-bottom">
            <div class="container">
                <div class="header-bottom_left">
                    <span>IPL T20 2015 | Make Payment</span>
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
                        <li><a href="index.html">Home</a></li>
                        <li><a href="#">Teams</a></li> <!--about.html-->
                        <li><a href="schedule.html">Schedule</a></li>
                        <li><a href="pricing.jsp">Tickets</a></li> <!--about.html-->
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
            <div class="pop_up">

                <div class="payment-online-form-left">
                    <form action="PaymentHandler" method="POST">
                        <h4><span class="shipping"> </span>User Details</h4>
                        <ul>
                            <li><input class="text-box-dark" type="text" value="Frist Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Frist Name';
                                    }" name='fname'></li>
                            <li><input class="text-box-dark" type="text" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Last Name';
                                    }" name='lname'></li>
                        </ul>
                        <ul>
                            <li><input class="text-box-dark" type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Email';
                                    }" name='email'></li>
                            <li><input class="text-box-dark" type="text" placeholder="Username" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.placeholder = 'Username';
                                    }" required name='username'></li>
                        </ul>
                        <ul>
                            <li><input class="text-box-dark" type="text" value="Mobile No." onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Mob';
                                    }" name='mob'></li>
                            <li><input class="text-box-dark" type="password" placeholder="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.placeholder = 'Password';
                                    }" required name='password'></li>
                            <div class="clear"> </div>
                        </ul>
                        <ul>
                            <li><input class="text-box-dark" type="number" value='<%= request.getParameter("matchno") %>' readonly name='matchno'></li>
                            <li><input class="text-box-dark" type="text" value='<%= request.getParameter("ground") %>, <%= request.getParameter("city") %>' readonly name='venue'></li>
                            <div class="clear"> </div>
                        </ul>
                        <ul>
                            <li><input class="text-box-dark" type="number" value='<%= request.getParameter("price") %>' readonly name='price'></li>
                            <li><input class="text-box-dark" type="number" placeholder="Quantity" onfocus="this.placeholder = '';" onblur="if (this.value == '') {
                                        this.placeholder = 'Quantity';
                                    }" min="1" max='<%= request.getParameter("seats") %>' required name='qty'></li>
                            <div class="clear"> </div>
                        </ul>
                        <div class="clear"> </div>
                        <ul class="payment-type">
                            <h4><span class="payment"> </span> Payments</h4>
                            <li>
                                <span class="col_checkbox">
                                    <input id="3" class="css-checkbox1" type="checkbox">
                                    <label for="3" name="demo_lbl_1" class="css-label1"> </label>
                                    <a class="visa" href="#"> </a>
                                </span>
                            </li>
                            <li>
                                <span class="col_checkbox">
                                    <input id="4" class="css-checkbox2" type="checkbox">
                                    <label for="4" name="demo_lbl_2" class="css-label2"> </label>
                                    <a class="paypal" href="#"> </a>
                                </span>
                            </li>
                            <div class="clear"> </div>
                        </ul>
                        <ul>
                            <li><input class="text-box-dark" type="text" value="Card Number" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Card Number';
                                    }"></li>
                            <li><input class="text-box-dark" type="text" value="Name on card" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Name on card';
                                    }"></li>
                            <div class="clear"> </div>
                        </ul>
                        <ul>
                            <li><input class="text-box-light hasDatepicker" type="text" id="datepicker" value="Expiration Date" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Expiration Date';
                                    }"><em class="pay-date"> </em></li>
                            <li><input class="text-box-dark" type="text" value="Security Code" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Security Code';
                                    }"></li>
                            <div class="clear"> </div>
                        </ul>
                        <ul class="payment-sendbtns">
                            <li><input type="reset" value="Cancel"></li>
                            <li><input type="submit" value="Process order"></li>
                        </ul>
                        <div class="clear"> </div>
                    </form>
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
