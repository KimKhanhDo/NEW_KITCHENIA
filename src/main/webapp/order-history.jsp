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

<title>Kitchenia - Order History</title>


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
		<div class="page-title">Order History</div>
		<table class="table">
			<thead>
				<tr>
					<th>Order Id</th>
					<th>Order Date</th>
					<th>Name</th>
					<th>Shipping Address</th>
					<th>Email</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderHistory}" var="order">
					<tr>
						<td>${order.id}</td>
						<td>${order.submitDate}</td>
						<td>${order.firstName}${order.lastName}</td>
						<td>${order.address}${order.suburb} ${order.state}
							${order.postcode}</td>
						<td>${order.email}</td>
						<td>${order.totalPrice}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<form action="Checkout" method="POST">
		<input type="hidden" name="action" value="CONTINUE_SHOPPING">
		<div class="text-center text-lg-start mt-4 pt-2">
			<button type="submit" class="btn btn-primary btn-lg"
				style="padding-left: 2.5rem; padding-right: 2.5rem;">Continue
				Shopping</button>
		</div>
	</form>

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
