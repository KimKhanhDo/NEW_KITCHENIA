
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>${product.name}</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/general.css">

</head>

<body>

	<jsp:include page="header-section.jsp" />


	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


	<!-- ***** Product Area Starts ***** -->
	<section class="section" id="product">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="left-images">
						<img src="assets/images/${product.image}" alt="Kitchenia's image">

					</div>
				</div>
				<div class="col-lg-4">
					<div class="right-content">
						<h4>${product.brand}</h4>
						<h5 style="font-weight: normal;">${product.name}</h5>

						<!-- Add Rating Star Area-->
						<div class="product-ratting">
							<div class="ratting-icons">
								<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
									class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
									class="fa fa-star-o"></i>
							</div>
							<div class="ratting-caption">No Reviews</div>
						</div>
						<!-- End Rating Star Area-->

						<span class="price">$${product.price}</span>
						<ul class="stars">
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
						</ul>
						<div class="ratting-caption">Quantity: ${product.quantity}</div>

						<span>Description: ${product.description}</span>
				<form action="Cart">
					<input type="text" value="ADD_TO_CART" name=action hidden="true">
					<input type="text" value="${product.id}" name="productId" hidden="true">
					
						<div class="quantity-content">
						
							<div class="left-content">					
								<h6>No. of Orders</h6>
							</div>
							<div class="right-content">
								<div class="quantity buttons_added">
									<input type="button" value="-" class="minus">
									<input type="number" step="1" min="1" max="" name="quantity" 
										value="1" title="Qty" class="input-text qty text" size="4"
										pattern="" inputmode="">
										<input type="button" value="+" class="plus">
								</div>
							</div>
						</div>
				<div class="total">					
							<div class="main-border-button">
								<input type="submit" value="Add To Cart"/>
							</div>
					</div>
				</form>
				</div>

					</div>
				</div>
			</div>
	</section>
	<!-- ***** Product Area Ends ***** -->

	<jsp:include page="footer-section.jsp"/>
	
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
		$(function() {
			var selectedClass = "";
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);
			});
		});
	</script>
	<script type="module" src="assets/js/single-product.js"></script>
	<script type="module" src="assets/js/checkout/hexa.js"></script>
	
</body>

</html>