<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
 <form action="login" method="post">
        <div class="logo"><img src="images/logo.png" alt="Error loading" width="50px">
            <a href=""><strong>Television World</strong></a></div>

        <div class="image"><img src="images/image.png" alt="Error Loading" width="400px" height="885px"></div>
        
        <div class="container">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"><a href="signup">Sign Up</a></label>    
            <br/>
            <label for="uname" class="fa fa-user-circle"><b> UserName</b></label>
            <input type="text" placeholder="Enter Username" name="username" required>
            
        
            <label for="psw" class="fa fa-key"><b> Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>
        	<% String errorMessage = (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { %>
        		<div style="color: red; margin-top: 10px;"><%= errorMessage %></div>
    	<% } %>

            <label for="o"></label>
            <button type="submit">Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
            <br/>
            <span class="text">--------------------Or--------------------</span>
            <button type="button" class="fa fa-google"> Login with Google</button>
        </div>
        <div class="container1" style="background-color:#f1f1f1">
            <button type="button" class="cancelbtn"> <a href="home">Cancel</a></button>
            <span class="psw">Forgot <a href="forgotPassword">password?</a></span>
        </div>
    </form>


</body>
<script src="js/main.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <!--  <link rel="stylesheet" href="alert/dist/sweetalert.css"> -->
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status=="failed"){
            swal("Sorry","Wrong Username or Password","error");
        } else if (status=="invalidPassword"){
            swal("Sorry","Please Enter Password","error");
        }
    </script>
</html>