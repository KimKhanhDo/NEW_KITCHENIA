<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Kitchenia - Login Page</title>

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
</style>
</head>

<body>



	<!-- ***** Main Content Start ***** -->
	<section class="vh-100">
		<div class="container h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

					<!-- Your form content here -->
					<form action="Login" method="post">

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" name="loginButton"
								class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
						</div>

						<div
							class="divider d-flex justify-content-center align-items-center my-4">
							<p class="fw-bold mx-3 mb-0">Already A Rewards Member</p>
						</div>

						<!-- Email input -->
						<div class="form-outline mb-4">
							<i class="fas fa-envelope fa-lg me-3 fa-fw"></i> <label
								class="form-label" for="form3Example3">Email address</label> <input
								type="text" name="email" id="form3Example3"
								class="form-control form-control-lg" placeholder="" />
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<i class="fas fa-lock fa-lg me-3 fa-fw"></i> <label
								class="form-label" for="form3Example4">Password</label> <input
								type="password" name="password" id="form3Example4"
								class="form-control form-control-lg" placeholder="" />
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" /> <label class="form-check-label"
									for="form2Example3"> Remember me </label>
							</div>
							<a href="forgot-password.jsp" class="text-body">Forgot password?</a>
						</div>

						<div style="margin-top: 30px; margin-bottom: -20px;">
							<c:if test="${!isLogin}">
								<p style="color: red;">${errorMessage}</p>
							</c:if>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? 
								<a href="register-step1-username.jsp" class="link-danger">Register</a>
							</p>
							<p class="small fw-bold mt-2 pt-1 mb-0">Back To Home Page
								<a href="Home" class="link-danger">Kitchenia</a>
							</p>
						</div>
					</form>


				</div>
			</div>
		</div>
	</section>
	<!-- ***** Main Content End ***** -->

	<!-- ***** Footer Start ***** -->
	<footer>
		<!-- Your footer content here -->
		<footer>
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

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>

	<script>
		// Your custom script here
	</script>

</body>

</html>
