<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Television World</title>
    <link rel="stylesheet" href="css/home.css">

</head>
<body>
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
              <a href="cart.jsp"><img src="images/Cart.png" width="23" height="23"></a></li>
        </ul>
    </nav>
    <!-- 'spacing' class is used to give space from top -->
    <div class="spacing"></div>
    <!-- '.main-slider' contains the elements for the slider -->
    <div class="main-slider">
        <div class="slider">
            <!-- images holder for the slider -->
            <div id="slider-images">
                <!-- first image for the slider -->
                <img src="images/Slider/img1.jpg" alt="Error">
            </div>
        </div>
    </div>
    <!--product cards in the best sellers-->
    <h1 class="titles">Our Best Sellers</h1><br>

     <div class="products">
    
        <div class="productcontainer1">
            <img class="productimage1" src="images/Slider/img1.jpg" height="350" width="350">
            <div class="description1">
                <h1>Haier</h1>
                <p>LED 4k</p><br>
                <h2>Rs.55000</h2><br>
                <div align="center">
                    <button onclick="location.href='Haier.jsp'">More Details</button>
                </div>  
            </div>
        </div>
        <div class="productcontainer2">
            <img class="productimage2" src="images/Slider/img2.jpg" height="350" width="350">
            <div class="description2">
                <h1>Panasonic</h1>
                <p>4k LED</p><br>
                <h2>Rs.99000.99</h2><br>
                <div align="center">
                    <button onclick="location.href='LG.jsp'">More Details</button>
                </div>  
            </div>
        </div>
        <div class="productcontainer3">
            <img class="productimage3" src="images/Slider/img3.jpg"height="350" width="350">
            <div class="description3">
                <h1>LG</h1>
                <p>UHD</p><br>
                <h2><s>Rs.129000.99</s>Rs.99000.99</h2><br>
                <div align="center">
                    <button onclick="location.href='#'">More Details</button>
                </div>  
            </div>
        </div>
        <div class="productcontainer4">
            <img class="productimage4" src="images/Slider/img4.jpg"height="350" width="350">
            <div class="description4">
                <h1>TCL</h1>
                <p>4k HD QLED</p><br>
                <h2><s>Rs.12000.99</s>Rs.99000.99</h2><br>
                <div align="center">
                    <button onclick="location.href='#'">More Details</button>
                </div>  
            </div>
        </div>
    </div> 
    <div class="container1">
		<h3>Check out all our Products</h3><br>
		<img class="image1" src="images/bgp.jpg" height="590" width="1280" >
		<button class="click1" onclick="location.href='productPageUser'"><b>Shop Now</b></button><br><br>
	</div>
     <!-- creates a container for the contents for content2 -->
        <div class="container2">
            <!-- topic for the content -->
            <p class="topics px50">Today's Deal</p>
            <!-- products containter -->
            <div class="products1">
                <!-- 'template' class is the individual product on the website -->
                <a href="#" class="no-design">
                    <div class="template">
                        <!-- Inserting television image  -->
                        <img src="images/Slider/img1.jpg" alt="" class="template-image">
                        <!-- Inserting details and price for the television -->
                        <div class="template-info">
                            <div class="info">
                                <!-- Company name -->
                                <p class="television">LED 4k</p>
                                <!-- Rating of the television -->
                                <p class="rating">Rating: 4.8</p>
                            </div>
                            <!-- television name -->
                            <p class="television-name">Haier</p>
                            <p class="price">
                                <!-- Discounted price -->
                                <span id="discount1"></span>
                                <!-- Actual price -->
                                <span class="line">Rs.<span id="actual1">40000</span></span><span class="sale">(15%
                                    Off)</span>
                            </p>
                            <div class="button">
                                <!-- Read more button -->
                                <a href="#"><button class="read-more">Read
                                        More</button></a>
                                <!-- Add to cart button -->
                                <button class="addToCart" onclick="addToCart()">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="no-design">
                    <div class="template">
                        <!-- Inserting television image  -->
                        <img src="images/Slider/img2.jpg" alt="" class="template-image">
                        <!-- Inserting details and price for the television -->
                        <div class="template-info">
                            <div class="info">
                                <!-- Company name -->
                                <p class="television">QLED</p>
                                <!-- Rating of the television -->
                                <p class="rating">Rating: 4.6</p>
                            </div>
                            <!-- television name -->
                            <p class="television-name">Panasonic</p>
                            <p class="price">
                                <!-- Discounted price -->
                                <span id="discount2"></span>
                                <!-- Actual price -->
                                <span class="line">Rs.<span id="actual2">38000</span></span><span class="sale">(15%
                                    Off)</span>
                            </p>
                            <div class="button">
                                <!-- Read more button -->
                                <a href="#"><button class="read-more">Read
                                        More</button></a>
                                <!-- Add to cart button -->
                                <button class="addToCart" onclick="addToCart()">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="no-design">
                    <div class="template">
                        <!-- Inserting television image  -->
                        <img src="images/Slider/img3.jpg" alt="" class="template-image">
                        <!-- Inserting details and price for the television -->
                        <div class="template-info">
                            <div class="info">
                                <!-- Company name -->
                                <p class="television">LG UHD</p>
                                <!-- Rating of the television -->
                                <p class="rating">Rating: 4.5</p>
                            </div>
                            <!-- television name -->
                            <p class="television-name">LG</p>
                            <p class="price">
                                <!-- Discounted price -->
                                <span id="discount3"></span>
                                <!-- Actual price -->
                                <span class="line">Rs.<span id="actual3">50000</span></span><span class="sale">(15%
                                    Off)</span>
                            </p>
                            <div class="button">
                                <!-- Read more button -->
                                <a href="#"><button class="read-more">Read
                                        More</button></a>
                                <!-- Add to cart button -->
                                <button class="addToCart" onclick="addToCart()">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="no-design">
                    <div class="template">
                        <!-- Inserting television image  -->
                        <img src="images/Slider/img4.jpg" alt="" class="template-image">
                        <!-- Inserting details and price for the television -->
                        <div class="template-info">
                            <div class="info">
                                <!-- Company name -->
                                <p class="television">4k</p>
                                <!-- Rating of the television -->
                                <p class="rating">Rating: 4.9</p>
                            </div>
                            <!-- television name -->
                            <p class="television-name">TCL </p>
                            <p class="price">
                                <!-- Discounted price -->
                                <span id="discount4"></span>
                                <!-- Actual price -->
                                <span class="line">Rs.<span id="actual4">80000</span></span><span class="sale">(15%
                                    Off)</span>
                            </p>
                            <div class="button">
                                <!-- Read more button -->
                                <a href="#"><button class="read-more">Read
                                        More</button></a>
                                <!-- Add to cart button -->
                                <button class="addToCart" onclick="addToCart()">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="no-design">
                    <div class="template">
                        <!-- Inserting television image  -->
                        <img src="images/Slider/img5.jpg" alt="" class="template-image">
                        <!-- Inserting details and price for the television -->
                        <div class="template-info">
                            <div class="info">
                                <!-- Company name -->
                                <p class="television">QLED 4k</p>
                                <!-- Rating of the television -->
                                <p class="rating">Rating: 4.7</p>
                            </div>
                            <!-- television name -->
                            <p class="television-name" style="font-size: 20px;">Samsung</p>
                            <p class="price">
                                <!-- Discounted price -->
                                <span id="discount5"></span>
                                <!-- Actual price -->
                                <span class="line">Rs.<span id="actual5">70000</span></span><span class="sale">(15%
                                    Off)</span>
                            </p>
                            <div class="button">
                                <!-- Read more button -->
                                <a href="#"><button class="read-more">Read
                                        More</button></a>
                                <!-- Add to cart button -->
                                <button class="addToCart" onclick="addToCart()">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
		<button class="click2" onclick="location.href='productPageUser'"><b>Grab Now</b></button><br><br>
        </div>
        <h1 class="titles">About Us</h1> 
        <a class="bloglink" href="aboutus.jsp">
            <div class="blog">
                <img class="blogimage" src="images/bgp.jpg" width="500" height="350">
                <div class="blogtext">
                <h1>About Us</h1><br>
                <p>We are a team of five students who came together while studying in college with a shared passion for computing. Recognizing our complementary skills and talents, we formed a group with the goal of creating a website for Television World. Our diverse backgrounds and unique perspectives have allowed us to bring a fresh approach to our website, and we are constantly pushing the boundaries to deliver a truly exceptional online experience. Whether it's through innovative design, user-friendly functionality, or thought-provoking content, we strive to make a meaningful impact in the lives of our users. Together, we are driven by a common vision to create something truly special and make a difference in the world. Read more....</p><br>
                 
                </div>
            </div>
        </a>
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
    

<script>
        // storing the images in an array
        var images = ['images/Slider/img1.jpg','images/Slider/img2.jpg','images/Slider/img3.jpg','images/Slider/img4.jpg','images/Slider/img5.jpg','images/Slider/img6.jpg'];
        
        // setting x to 0
        var x = 0;
        // selecting the 'slider-images' from html and storing it in the imgs variable
        var imgs = document.getElementById('slider-images');
        
        // using a function to change the image every 3 seconds
        setInterval(slider, 3000);
        
        // creating a function slider()
        function slider(){
            // if value of x is less than the length of array images, which is 5 then the statements executes
            if(x < images.length){
                x = x + 1;
            }
            else{
                x = 1;
            }
            // changing the image every time by passing x-1 as parameters to images
            imgs.innerHTML = "<img src=" + images[x-1] + ">";
        }
        
        // storing the tvImages in an array
        var tvImages = ['../images/Slider/img1.jpg','../images/Slider/img2.jpg','../images/Slider/img3.jpg','../images/Slider/img4.jpg','../images/Slider/img5.jpg','../images/Slider/img6.jpg'];
        
        // selecting the 'slider-tv-images' from html and storing it in the imgs variable
        var tvImgs = document.getElementById('slider-tv-images');
        
        // setting y to 0
        var y = 0;
        
        // using a function to change the image every 3 seconds
        setInterval(tvSlider, 3000);
        
        // creating a function tvSlider()
        function tvSlider(){
            // if value of y is less than the length of array images, which is 4 then the statements executes
            if(y < tvImages.length){
                y = y + 1;
            }
            else{
                y = 1;
            }
            // changing the image every time by passing y-1 as parameters to images
            tvImgs.innerHTML = "<img src=" + tvImages[y-1] + ">";
        }
    </script>
    <script>
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
</script>
</body>  
</html>