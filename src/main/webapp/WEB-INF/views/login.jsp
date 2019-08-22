<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<title>Login Page</title>
<%@ page isELIgnored="false" %>
</head>

<body>
  <form class="modal-content animate" id="postform"  action="Login" method="post" style="text-align:center">
    <div class="imgcontainer">
      <h2>Login </h2>
    </div>
	
    <div class="container">
      <input type="text" placeholder="Enter Username" name="username" id="username" minlength=5 maxlength=50 >
      <span class="alert" id="usernamealert"></span>
		<br>
      <input type="password" placeholder="Enter Password" name="password" id="password" minlength=5 maxlength=50  >
      <span class="alert" id="passwordalert"></span>
        
      <button type="button" onclick="post()">Login</button>
      <br>
      <span id="alert" class="btn btn-danger">${sessionScope.message} </span>
     
    </div>

  </form>
</body>
<script type="text/javascript">


function  post() {
	var x= false;
	if($('#username').val()==="") {
		x= true;
		$('#usernamealert').text("Username is required");
	}
	if($('#password').val()==="") {
		x=true;
		$('#passwordalert').text("Password is required");
	}
	if(x) {
		return;
	}	else {
		console.log($('#postform'),$('#username').val(),$('#password').val());
	    $('#postform').submit();
	}
	
}

var msg='<%session.getAttribute("authorized");%>' ;
if(msg==='false') {
	console.log("dsdshjfguy")
	$('#alert').text('Wrong Credentials')
}


<% %>
</script>

</html>