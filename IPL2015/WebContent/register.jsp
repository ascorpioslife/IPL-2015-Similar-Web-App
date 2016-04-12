<%--Project IPL T20 2015
    Author: Parishkrit Jain, Nikunj Jain, Pranjal Aggarwal
--%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>IPL T20 2015 | Register</title>
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
                    <span>IPL T20 2015 | Sign-Up</span>
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
                        <li><a href="pricing.jsp">Tickets</a></li> <!--about.html-->
                        <li><a href="top.jsp">Fanzone</a></li> <!--about.html-->
                        <li><a href="Standings.jsp">Standing</a></li> <!--about.html-->
                        <li><a href="#">Contact</a></li> <!--about.html-->
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div><!-- end h_menu4 -->
                <div class="clear"></div>
            </div>
        </div>
        <!-- end menu -->
        <div class="main">
            <div class="register-grids">
                <div class="container">
                    <form action="SignUpHandler" method="post"> 
                        <div class="register-top-grid">
                            <h3>PERSONAL INFORMATION</h3>
                            <div>
                                <span>First Name<label> *</label></span>
                                <input type="text" name="fname" maxlength="28" autofocus required> 
                            </div>
                            <div>
                                <span>Last Name<label> *</label></span>
                                <input type="text" name="lname" maxlength="28" required> 
                            </div>
                            <div>
                                <span>Email Address<label> *</label></span>
                                <input type="email" name="email" maxlength="48" required> 
                            </div>
                            <div>
                                <span>Mobile number<label> *</label></span>
                                <input type="text" name="mob" pattern="[0-9]+$" maxlength="15" required> 
                            </div>
                            <div class="clear"> </div>

                        </div>
                        <div class="clear"> </div>
                        <div class="register-bottom-grid">
                            <h3>LOGIN INFORMATION</h3>
                            <div>
                                <span>Username<label> *</label></span>
                                <input type="text" name="username" onkeyup="checkAvail(this.value)" autocomplete="off" maxlength="28" required>
                            </div>
                            <div>
                                <span>Password<label> *</label></span>
                                <input type="password" name="password" maxlength="28" required>
                            </div>
                            <div>
                                <br>
                                <span id="avail" style="text-transform: none"></span>
                                <br>
                                <span id="terms" style="text-transform: none"></span>
                            </div>
                            <div>
                                <span>Confirm Password<label> *</label></span>
                                <input type="password" name="cnfpassword" onkeyup="checkPass()" maxlength="28" required>
                                <span id="cnfmsg" style="text-transform: none; line-height: 50px;"></span>
                            </div>
                            <div class="clear"> </div>
                            <a class="news-letter" href="#">
                                <label class="checkbox">
                                    <input type="checkbox" onclick="checkAgree(this)" checked>
                                    <i> </i>Agree to Terms and Conditions
                                </label>
                            </a>
                            <div class="clear"> </div>
                        </div>
                        <div class="clear"> </div>
                        <input id="submit" type="submit" value="submit">
                    </form>
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
                            <li><a href="pricing.jsp">Tickets</a></li>
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

    <script>
        function checkAvail(username)
        {
            var xmlhttp;    
            if (username === "")
            {
                document.getElementById("avail").innerHTML="";
                return;
            }
            if (window.XMLHttpRequest)
            { // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else
            { // code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            { //4: request finished and response is ready
                if (xmlhttp.readyState===4 && xmlhttp.status===200)
                {
                    if (xmlhttp.responseText === "Y") 
                    {
                        document.getElementById("submit").disabled = false;
                        document.getElementById("avail").style.color = "green";
                        document.getElementById("avail").innerHTML="'" + username + "'" + " is available";
                    }
                    else
                    {
                        document.getElementById("submit").disabled = true;
                        document.getElementById("avail").style.color = "red";
                        document.getElementById("avail").innerHTML="'" + username + "'" + " is not available";
                    }   
                }
            };
            xmlhttp.open("POST","UsernameChecker",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("username=" + username);
        }
        
        function checkPass()
        {
            var pass = document.getElementsByName("password")[0].value;
            var cnf = document.getElementsByName("cnfpassword")[0].value;
            if(pass === "" || cnf === "")
            {
                document.getElementById("submit").disabled = true;
                document.getElementById("cnfmsg").style.color = "red";
                document.getElementById("cnfmsg").innerHTML="Password field can't be empty!";
            }
            else if(pass === cnf)
            {
                document.getElementById("submit").disabled = false;
                document.getElementById("cnfmsg").innerHTML="";
            }
            else
            {
                document.getElementById("submit").disabled = true;
                document.getElementById("cnfmsg").style.color = "red";
                document.getElementById("cnfmsg").innerHTML="Passwords don't match!";
            }
        }
        
        function checkAgree(cb)
        {
            var isChecked = cb.checked;
            if(!isChecked)
            {
                document.getElementById("submit").disabled = true;
                document.getElementById("terms").style.color = "red";
                document.getElementById("terms").innerHTML="Please agree to the terms and conditions!";
            }
            else
            {
                document.getElementById("submit").disabled = false;
                document.getElementById("terms").innerHTML="";
            }
        }
    </script>

</html>