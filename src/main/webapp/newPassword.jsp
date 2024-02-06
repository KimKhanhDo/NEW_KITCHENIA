
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">

<title>Giftos</title>


<style>
.button-container {
	display: flex;
	margin-top: 5px; /* Adjust the margin as needed */
	margin-right: -20px;
}

.button-container button {
	margin: 0;
}
</style>

<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<nav class="navbar navbar-expand-lg custom_nav-container ">
				<a class="navbar-brand" href="index.html"> <span> Giftos
				</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class=""></span>
				</button>

				<div class="collapse navbar-collapse innerpage_navbar"
					id="navbarSupportedContent">
					<ul class="navbar-nav  ">
						<li class="nav-item "><a class="nav-link" href="index.jsp">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="shop.jsp"> Shop </a></li>
						<li class="nav-item"><a class="nav-link" href="why.jsp">
								Why Us </a></li>
						<li class="nav-item"><a class="nav-link"
							href="testimonial.jsp"> Testimonial </a></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
								Us</a></li>
					</ul>

					<div class="user_option">
						<a href=""> <i class="fa fa-user" aria-hidden="true"></i> <span>
								Login </span>






						</a> <a href=""> <i class="fa fa-shopping-bag" aria-hidden="true"></i>
						</a>
						<form class="form-inline ">
							<button class="btn nav_search-btn" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form>
					</div>
				</div>
			</nav>
		</header>
		<!-- end header section -->

	</div>
	<!-- end hero area -->

	<!-- LOGIN FORM start -->

	<section class="contact_section layout_padding">
		<div class="container px-0">
			<div class="heading_container ">
				<h2 class="">Login</h2>



			</div>
		</div>
		<div class="container container-bg">
			<div class="row">
				<div class="col-md-6 col-lg-3 px-0"></div>
				<div class="col-md-6 col-lg-6 px-0">

					<!-- Start Form -->
					<form action="ResetPasswordController?action=SET_NEW_PASSWORD"
						method="post">
						<div>
							<input type="text" placeholder="Password" name="password" required />
						</div>
						<div>
							<input type="password" placeholder="Confirm New Password"
								name="confPassword" required />
						</div>
						<div class="button-container">
							<button type="submit" class="login-button">RESET</button>

						</div>
					</form>
					<!-- End Form -->



					<div class="container">
						New to Giftos? <a href="register.jsp">Create your Giftos
							account </a>
					</div>

				</div>
				<div class="col-md-6 col-lg-3 px-0"></div>
			</div>
	</section>

	<!-- LOGIN FORM end -->

	<!-- info section -->

	<section class="info_section  layout_padding2-top">
		<div class="social_container">
			<div class="social_box">
				<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
				</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
				</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
				</a> <a href=""> <i class="fa fa-youtube" aria-hidden="true"></i>
				</a>
			</div>
		</div>
		<div class="info_container ">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<h6>ABOUT US</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed doLorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed doLorem ipsum dolor sit amet,</p>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="info_form ">
							<h5>Newsletter</h5>
							<form action="#">
								<input type="email" placeholder="Enter your email"> <input
									type="submit" value="Submit">
							</form>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<h6>NEED HELP</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed doLorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed doLorem ipsum dolor sit amet,</p>
					</div>
					<div class="col-md-6 col-lg-3">
						<h6>CONTACT US</h6>
						<div class="info_link-box">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> Gb road 123 london Uk </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>+01
									12345678901</span>
							</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
								<span> demo@gmail.com</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer section -->
		<footer class=" footer_section">
			<div class="container">
				<p>
					&copy; <span id="displayYear"></span> All Rights Reserved By <a
						href="https://html.design/">Free Html Templates</a>
				</p>
			</div>
		</footer>
		<!-- footer section -->

	</section>

	<!-- end info section -->


	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<script src="js/custom.js"></script>

</body>

</html>