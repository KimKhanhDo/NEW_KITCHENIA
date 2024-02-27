<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Kitchenia - Sign Up</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/general.css">

<style>
.btn {
	color: hsl(0, 50%, 99%);
	/* Change this color code to your desired text color */
}

/* Add your custom styles here */
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

.h-custom {
	height: calc(100% - 73px);
}

@media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
}

/* Custom Styles */
label {
	font-weight: bold;
}

/* Lighter and More Orangeish Theme Color */
.btn-primary, .bg-primary {
	background-color: #DC5434 !important; /* Lighter Orange */
	border-color: #DC5434 !important;
}

/* Dark Brown color for Forgot password */
a.text-body {
	font-weight: bold;
	color: #8B4513;
}

/* Remove blue block color in the footer */
.bg-primary {
	background-color: transparent !important;
}

.small {
	font-size: 18px; /* Change to your desired font size */
}

.card.text-black {
	border: none; /* Remove the border */
	border-radius: 0; /* Remove border-radius */
	padding-top: 10px; /* Add padding to the top */
	margin-top: 5vh; /* Increase the margin at the top */
	width: 100%; /* Make the card occupy the full width of the container */
	max-width: 500px;
	/* Set a maximum width for better readability on larger screens */
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Main Content Start ***** -->
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-8 col-lg-6">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6">
					<div class="card text-black"">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">SIGN
									UP</p>

								<div style="margin-top: -20px; margin-bottom: 30px;">
									<c:if test="${not empty param.errorMessage}">
										<p style="color: red;">${param.errorMessage}</p>
									</c:if>
								</div>

								<!-- FORM start -->
								<form action="Register" method="POST" class="mx-1 mx-md-4" onsubmit="return checkReEnterPassword() && hashPassword();">
										<input type="text" name="ACTION" value="submitPassword" hidden="true">
							             <input type="hidden" name="firstName" value="${verificationUser.first_name}" />
							             <input type="hidden" name="lastName" value="${verificationUser.last_name}" />
							             <input type="hidden" name="phoneNo" value="${verificationUser.phoneNumber}" />
							             <input type="hidden" name="username" value="${verificationUser.username}" />
							   			 <input type="hidden" name="email" value="${verificationUser.email}" />         
																		
									<div class="form-row mb-4">
										<div class="col-md-12">
												<label class="form-label" for="form3Example4c">Password*</label>
												<input type="password" name="password" id="password" class="form-control" required />
										</div>
									</div>

									<div class="form-row mb-4">
										<div class="col-md-12">
											<label class="form-label" for="form3Example4cd">Re-enter Password*</label>
											 <input type="password" name="reEnterPassword" id="reEnterPassword" class="form-control" required
													 onkeyup="checkReEnterPassword()" />
												<div id="errorMessage" style="color: red;"></div>
										</div>
									</div>
									

									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
										<button type="submit" class="btn btn-primary btn-lg"
											onclick="validateAgreement()">Register</button>
									</div>

								</form>
								<!-- FORM end -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Main Content End ***** -->

	<!-- ***** Footer Start ***** -->
	<footer>
		<!-- Your footer content here -->
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="first-item">
						<div class="logo">
							<img src="assets/images/Logo-2-1.png"
								alt="hexashop ecommerce templatemo">
						</div>
						<ul>
							<li><a href="#">585 Malvern Rd Toorak VIC 3142</a></li>
							<li><a href="#">info@kitchenia.com.au</a></li>
							<li><a href="#">010-020-0340</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<h4>SHOPPING WITH US</h4>
					<ul>
						<li><a href="products-cookware.html">Cookware</a></li>
						<li><a href="products-bakeware.html">Bakeware</a></li>
						<li><a href="products-tabletop.html">Tabletop</a></li>
						<li><a href="products-accessories.html">Accessories</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<h4>ABOUT KITCHENIA</h4>
					<ul>
						<li><a href="index.html">Homepage</a></li>
						<li><a href="about.html">Our Story</a></li>
						<li><a href="explore.html">Hexa Magazine</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<h4>HERE TO HELP</h4>
					<ul>
						<li><a href="contact.html">Contact Us</a></li>
						<li><a href="#">FAQ's</a></li>
						<li><a href="#">Shipping</a></li>
						<li><a href="#">Tracking ID</a></li>
					</ul>
				</div>
				<div class="col-lg-12">
					<div class="under-footer">
						<p>Copyright Â© 2025 Kitchenia Co, Ltd. All Rights Reserved.
						<p>
							Made with <i class="fa fa-heart"></i> by BE5
						</p>
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ***** Footer End ***** -->


	<!-- jQuery -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/accordions.js"></script>
	<script src="assets/js/datepicker.js"></script>
	<script src="assets/js/scrollreveal.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imgfix.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/isotope.js"></script>
	<script src="assets/js/quantity.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bcrypt/5.0.0/bcrypt.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bcryptjs/2.4.3/bcrypt.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
	
	

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>
	
	<script>
	// SHA-256 hashing function
	function sha256(plainText) {
	    // Create a new SHA-256 hash object
	    var hash = CryptoJS.SHA256(plainText);
	    
	    // Convert the hash object to a hexadecimal string
	    var hexHash = hash.toString(CryptoJS.enc.Hex);
	    
	    return hexHash;
	}

	function checkReEnterPassword() {
	    var password = document.getElementById("password").value;
	    var reEnterPassword = document.getElementById("reEnterPassword").value;
	    if (password !== reEnterPassword) {
	        document.getElementById("errorMessage").innerHTML = "Passwords do NOT match";
	        return false; // Prevent form submission
	    } else {
	        document.getElementById("errorMessage").innerHTML = "";
	        return true; // Allow form submission
	    }
	}
	 function hashPassword() {
	        var passwordInput = document.getElementById("password");
	        var reEnterPasswordInput = document.getElementById("reEnterPassword");
	        var password = passwordInput.value;
	        var reEnterPassword = reEnterPasswordInput.value;
	        
	        // Hash passwords using SHA-256 algorithm
	        var hashedPassword = sha256(password);
	        var hashedReEnterPassword = sha256(reEnterPassword);

	        // Update password input fields with hashed passwords
	        passwordInput.value = hashedPassword;
	        reEnterPasswordInput.value = hashedReEnterPassword;

	        // Return true to allow form submission
	        return true;
	    }
	</script>
	


</body>

</html>
