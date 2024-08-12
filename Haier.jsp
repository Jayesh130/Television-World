<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haier</title>
    <link rel="stylesheet" href="css/allProduct.css">
</head>
<body>
    <!--start of the nav-->
    <nav>   
        <!--logo and the line below the logo-->
        <ul class="leftnav">
            <a href="home"><img class="logo" src="images/logo.png" width="50" height="50"></a>
            <div class="horizontal_line2"></div>
            <div class="line2"></div>
        </ul>
        <!--the center options in the navbar-->
        <ul class= "centernav">
        <li>
                <a href="home"><b>Home</b></a></li>
            <li>
            <li>
                <a href="productPageUser"><b>Our Products</b></a></li>
            <li>
                <a href="aboutus.jsp"><b>About Us</b></a></li>
            <li>
                <a href="contactus"><b>Contact Us</b></a></li> 
            <li>
                <a href="chooseus"><b>Why Choose Us?</b></a></li>
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
              <a href="viewCart"><img src="images/Cart.png" width="23" height="23"></a></li>
        </ul>
    </nav>
    <div class="container">
        <div class="images">
            <img class = "image" src="images/Slider/img1.jpg" width="610" height="500">
    
        </div>
    
        <div class="description">
            <h1>Haier Television</h1><br>
            <h2><b>4k LED</b></h2><br>
            <p><b>Product details of Haier 39" LED Television, LE39F1000,39" LED TELEVISION Non smart,1 yrs warrenty card,HDMI interface,Multi-Media player (USB),Can store 199 tv programs,High luminance,Wide viewing angle
               <br> <br>Specifications:<br><br>
                Screen Size: 42" - 64" Inch <br>
                Smart TV: Yes/<s> No</s> <br>
                Warrenty: 6 - 12 months<br>
            </b></p><br> 
            <h3><s>Rs.19999.99  </s>  Rs.14999.99</h3>
           <!--the javaScript function that increaser the quantity-->
           <div class="quantity">
            <button class="minus" onclick="minusFunction()">-</button>
            <input class="amount" type="text" value="0" id="number" />
            <button class="plus" onclick="plusFunction()">+</button><br>
        </div><br>
				<div class="button">
                    <!-- Add to cart button -->
                   <a href="AddToCartServlet?productId=${product.id}&quantity=1"><button class="read-more">Add to Cart</button></a>
               </div>       
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
            /for the addition button/
            function plusFunction()
            {
                var value = parseInt(document.getElementById('number').value);
                    value++;
                    if(value<=10){
                        document.getElementById('number').value = value;
                    }
                }
            /for the subtreaftion button/
            function minusFunction()
            {
                var value = parseInt(document.getElementById('number').value);
                if(value>0){
                    value--;
                        document.getElementById('number').value = value;
                }
    
            }
            </script>
    
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
                    <li><a href="ProductPageUser">Products</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus">Contact Us</a></li>
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

    </body>
    </html>   
    