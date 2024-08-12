<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="ISO-8859-1">
<title>About Us</title>
<link rel="stylesheet" href="css/aboutus.css">
</head>
<body>
	 <!--start of the nav-->
    <nav>   
        <!--logo and the line below the logo-->
        <ul class="leftnav">
            <a href="home.jsp"><img class="logo" src="images/logo.png" width="50" height="50"></a>
            <div class="horizontal_line2"></div>
            <div class="line2"></div>
        </ul>
        <!--the center options in the navbar-->
        <ul class= "centernav">
            <li>
                <a href="productPageUser"><b>Our Products</b></a></li>
            <li>
                <a href="aboutus.jsp"><b>About Us</b></a></li>
            <li>
                <a href="contactus"><b>Contact Us</b></a></li> 
            <li>
                <a href="chooseus.jsp"><b>Why Choose Us?</b></a></li>
            <li>
                <input type="text" placeholder="Search.."></li>
        </ul> 
        
        <!--the right options in the navbar-->
        <ul class="rightnav">
            <li>
            <div class="dropup">
			  <a href="UserProfileServlet"><img src="images/User.png" width="30" height="30"></a>
			  <div class="dropup-content">
			     <c:if test="${not empty sessionScope.activeUser}">
                    <a href="logout">Logout</a>
                </c:if>
                <c:if test="${empty sessionScope.activeUser}">
                    <a href="login">Login</a>
                    <a href="signup">Sign Up</a>
                </c:if>
			  </div>
			</div>
            <li>
                 <a href="cart.jsp"><img src="images/Cart.png" width="23" height="23"></a></li>
        </ul>
    </nav>

        <!--container with the image and the button to scrool-->
    <div class="container1">
        <h1>Meet the Team</h1>
            <button onclick="bottomFunction()" id="click1" title="Go to Bottom"><b>The Team</b> </button> 
        <img class="img1" src="images/bgp.jpg"  width=100%>
    </div>
<!--the cards for our team-->
        <h1 class="team">Our Team</h1>
    <div class="members">
        <div class="member1">
                <img class="memberimage1" src="images/team/saswot.jpg" width="350" height="350">
            <div class="description1">
                <h1>CEO</h1>
                <p>Saswot Subedi</p><br> 
            </div>
        </div>
        <div class="member2">
                <img class="memberimageimage2" src="images/team/avani.JPG" width="350" height="350">
            <div class="description2">
                <h1>Web Designer</h1>
                <p>Avantika Singh Thakuri</p><br> 
            </div>
        </div>
        <div class="member3">
                <img class="memberimage3" src="images/team/angel.jpg" width="350" height="350">
            <div class="description3">
                <h1>Web Designer</h1>
                <p>Angel Gurung</p><br> 
            </div>
        </div>
    </div> 
    <div class="members2">
        <div class="member4">
                <img class="memberimage1" src="images/team/alish1.jpg" width="350" height="350">
            <div class="description4">
                <h1>Web Developer</h1>
               <p>Alish	Bajracharya</p><br> 
            </div>
        </div>
        <div class="member5">
                <img class="memberimageimage2" src="images/team/jayesh.jpg" width="350" height="350">
            <div class="description5">
                <h1>Web Developer</h1>
                <p>Jayesh Rajbhandari</p><br>
            </div>
        </div>
    </div>
    <section id="footer">
        <div class="footer">
            <div class="social">
                <h1>Follow Me</h1>
                <hr>
                <ul>
                    <li><a href="#"> Facebook</a></li>
                    <li><a href="#"> Twitter</a></li>
                    <li><a href="#"> Instagram</a></li>
                    <li><a href="#"> Youtube</a></li>
                </ul>
            </div>
            <div class="menu">
                <h1>Menu</h1>
                <hr>
                <ul>
                    <li><a href="ProductPageUser.jsp">Products</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                </ul>
            </div>
            <div class="contact">
                <h1>Contact Us</h1>
                <hr>
                <ul>
                    <li>Contact: 023-575427</li>
                    <li>Email: tvworld@gmail.com</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <div>
                <h3>Copyright @2023. tvworld.com</h3>
            </div>
        </div>
    </section>
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const dropup = document.querySelector('.dropup');
        const content = document.querySelector('.dropup-content');
        let timer;

        dropup.addEventListener('mouseleave', function() {
            timer = setTimeout(function() {
                content.style.display = 'none';
            }, 5000); // Set delay to 5000 milliseconds (5 seconds)
        });

        dropup.addEventListener('mouseenter', function() {
            clearTimeout(timer);
            content.style.display = 'block';
        });
    });

        /*the button for the scroll function*/
        let mybutton = document.getElementById("click1");

        window.onscroll = function() {scrollFunction()};
    /*makes the button scroll to the bottom*/
        function bottomFunction() {
            document.documentElement.scrollTop= 960; 
          }
    </script>
</body>
</html>