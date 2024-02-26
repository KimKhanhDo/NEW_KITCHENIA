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

<title>Kitchenia - Check Out</title>


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
.btn-primary, .bg-primary {
	background-color: #DC5434 !important; /* Lighter Orange */
	border-color: #DC5434 !important;
}
</style>

</head>
<body>

	<div class="container my-5">
		<div class="page-title">Review Item(s)</div>
		<div class="main">
			<div class="checkout-grid">
				<div class="order-summary">
					<!-- Cart Item Container -->

					<c:if test="${not empty sessionScope.cart.items}">
						<c:forEach var="item" items="${sessionScope.cart.items}">
							<div class="cart-item-container d-flex mb-3">
								<div class="product-image mr-3">
									<img src="assets/images/${item.image}" alt="${item.name}"
										style="width: 120px; height: auto;">
								</div>
								<div class="cart-item-details flex-grow-1">
									<div class="product-name">${item.name}</div>
									<div class="product-price">Price: $${item.price}</div>
									<div class="product-price" id="sub-total">Sub Total:
										$${item.subTotal}</div>
									<div class="product-quantity">
										Quantity: ${item.quantity} <span
											class="delete-quantity-link link-primary"> <a
											href="Cart?action=REMOVE&productId=${item.id}">Delete</a>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<!-- Order Summary & Payment Method -->

				<!-- Order Summary Section -->
				<div class="payment-summary">
					<h4 class="payment-summary-title">Order Summary</h4>
					<!-- Summary details -->
					<div class="payment-summary-row">
						<div>Item(s): (${sessionScope.cart.getItems().size()})</div>
						<div class="payment-summary-money"></div>
					</div>


					<div class="payment-summary-row subtotal-row">
						<div id="cart-total">Total before tax: $${cart.getTotal()}</div>
						<div class="payment-summary-money"></div>
					</div>

					<div class="payment-summary-row">
						<div id="cart-tax">Estimated tax: $${cart.getTax()}</div>
						<div class="payment-summary-money"></div>
					</div>

					<div class="payment-summary-row total-row">
						<div id="cart-totalWithTax">Order Total:
							$${cart.getTotalWithTax()}</div>
						<div class="payment-summary-money"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="billing-address mt-5">
				<h3>Billing Address</h3>
				<br>
				<form class="customer-billing-address" id="payment-form"
					action="Payment" method="post">

					<input type="hidden" name="userId" value="${user.getId()}">
					<div class="input-group">
						<label for="fname">First Name:</label> <input type="text"
							id="fname" name="firstName" required>
					</div>
					<div class="input-group">
						<label for="lname">Last Name:</label> <input type="text"
							id="lname" name="lastName" required>
					</div>
					<div class="input-group">
						<label for="address">Address:</label> <input type="text"
							id="address" name="address"
							placeholder="Street address, P.O. box, company name" required>
					</div>
					<div class="input-group">
						<label for="suburb">City/Suburb:</label> <input type="text"
							id="suburb" name="suburb" required>
					</div>
					<div class="input-group">
						<label for="state">State:</label> <input type="text" id="state"
							name="state" required>
					</div>
					<div class="input-group">
						<label for="postcode">Postcode:</label> <input type="text"
							id="postcode" name="postcode" required>
					</div>
					<div class="input-group">
						<label for="phone">Phone:</label> <input type="tel" id="phone"
							name="phone" required>
					</div>
					<div class="input-group">
						<label for="email">Email:</label> <input type="email" id="email"
							name="email" required>
					</div>

					<div class="text-lg-start mt-4 pt-2">
						<button type="submit" class="btn btn-primary btn-sm"
							style="padding: 0.5rem 1rem;">Place Your Order</button>
					</div>

				</form>

			</div>
		</div>

		<!-- ***** Footer Start ***** -->
		<%-- <jsp:include page="footer-section.jsp" /> --%>
		<!-- ***** Footer Start ***** -->
		<hr>
		<p>
			Need help? Check <a href="contact.jsp"> Contact us</a>
		</p>
		<p>When you click the "Place Your Order" button and complete payment, we'll send you an
			e-mail message acknowledging receipt of your order. Your contract to
			purchase an item will not be complete until we send you an e-mail to
			indicate that the item has been shipped.</p>
			<p>Need to add more items to your order? Continue shopping on the <a href="Home">Kitchenia Homepage</a></p>


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



		<script type="module" src="assets/js/checkout/hexa.js"></script>
		<script type="module" src="assets/js/checkout/cardDetails.js"></script>
</body>


</html>
