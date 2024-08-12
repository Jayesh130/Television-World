<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Television World</title>
    <link rel="stylesheet" href="css/product.css">
    <style type="text/css">
    	.products {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around; /* This will evenly space your items with space around them */
}

.template {
    flex: 1 0 18%; /* Flex-grow, Flex-shrink, Flex-basis */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    margin: 10px; /* Margin around each product card */
    display: flex;
    flex-direction: column;
    align-items: center; /* Centers items on the cross axis */
}

.template-image {
    width: 80%;
    height: 50%;
}

.template-info {
    padding: 15px;
    text-align: center;
    width: 100%; /* Ensures the info section fills the card */
}
   @media (max-width: 1200px) {
    .template {
        flex: 1 0 23%; /* 4 items per row */
    }
}

@media (max-width: 992px) {
    .template {
        flex: 1 0 31%; /* 3 items per row */
    }
}

@media (max-width: 768px) {
    .template {
        flex: 1 0 48%; /* 2 items per row */
    }
}

@media (max-width: 576px) {
    .template {
        flex: 1 0 100%; /* 1 item per row */
    }
}
   	
    </style>
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
                <a href="home"><b>Home</b></a></li>
            <li>
            <li>
                <a href="productPageUser"><b>Our Products</b></a></li>
            <li>
                <a href="aboutus.jsp"><b>About Us</b></a></li>
            <li>
                <a href="contactus.jsp"><b>Contact Us</b></a></li> 
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
           <!--  <li>
                 <a href="#" onclick="alertFunction()"><img src="../images/User.png" width="30" height="30"></a></li>
             --><li>
                 <a href="cart.jsp"><img src="images/Cart.png" width="23" height="23"></a></li>
        </ul>
    </nav>
    			
     <!-- 'spacing' class is used to give space from top -->
     <div class="spacing"></div>
     <!-- 'main' class is a container to hold the the 'headline' and 'products'  -->
     <div class="main">
         <div class="headline">
             <p id="text">Buy our products for a cheaper price <span style="color: red; margin-left: 20px;">(15% OFF FOR
                     TODAY ONLY!!)</span></p>
         </div>
         <!-- 'products' class creates a box that holds the template for each individual product -->
         <div class="products">
             <!-- 'template' class is the individual product on the website -->
             <c:forEach items="${products}" var="product">
             <div class="template">
                 <!-- Inserting television image  -->
                 <img src="images/${product.productImage}" alt="${product.productImage}" class="template-image">
                 <!-- Inserting details and price for the television -->
                 <div class="template-info">
                     <div class="info">
                         <!-- Company name -->
                         <p class="television">${product.productName}</p>
                         <!-- Rating of the television -->
                         <p class="rating">Rating: 4.8</p>
                     </div>
                     <!-- television name -->
                     <p class="television-name">${product.category}</p>
                     <p class="price">
                         <!-- Discounted price -->
                         <span id="discount1"></span>
                         <!-- Actual price -->
                         <span class="line">Rs.<span id="actual1">${product.price}</span></span><span class="sale">(15% OFF)</span>
                     </p>
                     <div class="button">
                         <!-- Read more button -->
                         <a href="Haier.jsp"><button class="read-more">View Details</button></a>
                     </div>
                     <div class="button">
                         <!-- Add to cart button -->
                         <a href="AddToCartServlet?productId=${product.id}&quantity=1"><button class="read-more">Add to Cart</button></a>
                     </div>
                 </div>
             </div>
             </c:forEach>             
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