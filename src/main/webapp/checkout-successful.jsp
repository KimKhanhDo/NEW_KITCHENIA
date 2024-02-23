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

<title>Kitchenia - Order Details</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/general.css">
<link rel="stylesheet" href="assets/css/checkout-header.css">
<link rel="stylesheet" href="assets/css/checkout.css">

<style>
/* Lighter and More Orangeish Theme Color */
.btn-primary, .bg-primary {
	background-color: #DC5434 !important; /* Lighter Orange */
	border-color: #DC5434 !important;
}
</style>

</head>
<body>

	<jsp:include page="header-section.jsp" />

	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading about-page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->

	<div class="container my-5">
		<div class="page-title">Order Details</div>
		<div class="row">

			<!-- Cart Item Container -->
			<div class="col-lg-8 mb-4">
				<c:forEach var="item" items="${orderDetails}">
					<div class="cart-item-container d-flex mb-3">
						<div class="product-image mr-3">
							<img src="assets/images/${item.image}" alt="${item.id}"
								style="width: 120px; height: auto;">
						</div>
						<div class="cart-item-details flex-grow-1">
							<div class="product-name">${item.name}</div>
							<div class="product-price">Price: $${item.price}</div>
							<div class="product-quantity">
								Quantity: ${item.quantity} <span
									class="delete-quantity-link link-primary"> </span>
							</div>
						</div>
					</div>
				</c:forEach>
				<form action="Checkout" method="POST">
					<input type="hidden" name="action" value="VIEW_ORDER_HISTORY">
					<div class="text-center text-lg-start mt-4 pt-2">
						<button type="submit" class="btn btn-primary btn-lg"
							style="padding-left: 2.5rem; padding-right: 2.5rem;">View
							Order History</button>
					</div>
				</form>
			</div>





		</div>
	</div>



	<!-- ***** Footer Start ***** -->
	<jsp:include page="footer-section.jsp" />
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



</body>

</html>
