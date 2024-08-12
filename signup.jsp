<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
 <link rel="stylesheet" href="css/signup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="logo"><img src="images/logo.png" alt="Error loading" width="50px">
        <a href=""><strong>Television World</strong></a></div>

    <div class="image"><img src="images/image.png" alt="Error Loading" width="400px" height="885px"></div>
    
    <div class="signup">
        <div class="container">
            <input id="tab-1" type="radio" name="tab" class="sign-in"><label for="tab-1" class="tab"><a href="login">Sign In</a></label>
            <input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">Sign Up</label>
            <br/>
            <form action="signup" method="post">
                <label for="uname" class="fa fa-user-circle"><b> Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label for="email" class="fa fa-envelope"><b> Email</b></label>
                <input type="text" placeholder="Enter your email address" name="email" required>                
             
			    <label for="utype" class="fa fa-user-circle"><b>User Type</b></label>
		      	<input type="text" placeholder="Enter User Type eg:admin / customer" name="utype" required>

                <label for="psw" class="fa fa-key"><b> Password</b></label>
                <input type="password" placeholder="Enter Password" id="password" name="password" required>
               <div id="passwordError" style="color:red;"></div>
               <% String errorMessage= (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { %>
        		<div style="color: red; margin-top: 10px;"><%= errorMessage%></div>
    			<% } %>
                <button type="submit" onclick="return submitForm()">Sign Up</button>
            </form>
            <span class="text">--------------------Or--------------------</span>
            <button type="button" class="fa fa-google"> SignUp with Google</button>
            <div class="hr"></div>
            <div class="foot-lnk">
                <label for="tab-1"><a href="login">Already Member?</a></label>
            </div>
        </div>
    </div>
    <script>
    // Function to validate password length
    function validatePasswordLength() {
        var password = document.getElementById("password").value;
        var passwordError = document.getElementById("passwordError");

        if (password.length < 8) {
            passwordError.textContent = "Password must be at least 8 characters long.";
            return false;
        }
        else if (!/[A-Z]/.test(password)) {
            passwordError.textContent = "Password must contain at least one uppercase letter.";
            return false;
        } 
        else if (!/[!@#$%^&*]/.test(password)) {
            passwordError.textContent = "Password must contain at least one special character (!@#$%^&*).";
            return false;
        }
        else {
            passwordError.textContent = ""; // Clear any previous error message
            return true;
        }
    }

    // Function to handle form submission
    function submitForm() {
        if (!validatePasswordLength()) {
            // Password length validation failed, stop form submission
            return false;
        }
    }

</script>
</body>
</html>