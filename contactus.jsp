<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Television World</title>
    <link rel="stylesheet" href="css/home.css">
<style type="text/css">
.contact-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.contact-info {
    margin-top: 20px;
}

label {
    display: block;
    margin: 10px 0 5px;
}

input[type="text"],
input[type="email"],
textarea {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

button[type="submit"]:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
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
           <!--  <li>
                 <a href="#" onclick="alertFunction()"><img src="../images/User.png" width="30" height="30"></a></li>
             --><li>
                 <a href="cart.jsp"><img src="images/Cart.png" width="23" height="23"></a></li>
        </ul>
    </nav>
<br><br><br><br><br><br><br><br><br>
    <div class="contact-container">
        <h1>Contact Us</h1>
        <div class="contact-info">
            <p>If you have any queries, please don't hesitate to reach out to us:</p>
            <!-- Contact Form -->
            <form action="sendEmail" method="POST">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>
                
                <button type="submit">Send Message</button>
            </form>
            <!-- Direct Email Option -->
            <p>Or you can directly email us at: <a href="mailto:support@televisionworld.com">support@televisionworld.com</a></p>
        </div>
    </div>
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
