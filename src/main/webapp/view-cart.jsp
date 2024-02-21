<!-- checkout.html -->
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

<title>Kitchenia - Check Out Page</title>


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

	<!-- ***** Header Area Start ***** -->

	<jsp:include page="header-section.jsp" />

	<!-- ***** Header Area End ***** -->

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

	<!-- ***** Explore Area Starts ***** -->
	<section>
		<div class="checkout-header-middle-section">
			Checkout (<a class="return-to-home-link" href="index.jsp">${sessionScope.cart.getItems().size()}
				Items</a>)
		</div>
	</section>
	<!-- ***** Explore Area Ends ***** -->

	<div class="main">
		<!-- <div class="page-title">Shopping Cart</div> -->


		<div class="checkout-grid">
			<div class="order-summary">
				<c:if test="${empty sessionScope.cart.items}">
					<h4>Cart is empty</h4>
				</c:if>

				<c:if test="${not empty sessionScope.cart.items}">
					<c:forEach var="item" items="${sessionScope.cart.items}">
						<div class="cart-item-container">
							<%-- <div class="delivery-date">Delivery date: ${dateString}</div> --%>

							<div class="cart-item-details-grid">
								<img class="product-image" src="assets/images/${item.image}">


								<div class="cart-item-details">
									<div class="product-name">${item.name}</div>
									<div class="product-price">Price: $${item.price}</div>
									<div class="product-price" id="sub-total">Total:
										$${item.subTotal}</div>
									<div class="product-quantity">
										Quantity:
										<form style="display: inline-block;">
											<input type="number" name="quantity" value="${item.quantity}"
												min="0" max="20" productId="${item.id}"
												onchange="updateCart(this)">
										</form>

										<span class="delete-quantity-link link-primary"> <a
											href="Cart?action=REMOVE&productId=${item.id}">Delete</a>
										</span>
									</div>
								</div>
								<!-- <div class="delivery-options">
									<div class="delivery-options-title">Choose a delivery
										option:</div>
								</div> -->
							</div>
						</div>
					</c:forEach>
				</c:if>


			</div>

			<div class="payment-summary ">
				<div class="payment-summary-title">Order Summary</div>
				<c:if test="${empty sessionScope.cart.getItems()}">
					<div class="payment-summary-row">
						<div>Item(s): (${sessionScope.cart.getItems().size()})</div>
						<div class="payment-summary-money"></div>
					</div>

				</c:if>

				<c:if test="${not empty sessionScope.cart.getItems()}">
					<div class="payment-summary-row">
						<div>Items (${sessionScope.cart.getItems().size()}):</div>
						<div class="payment-summary-money"></div>
					</div>

					<div class="payment-summary-row">
						<div>Shipping &amp; handling:</div>
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
						<div id="cart-totalWithTax">Order total:
							$${cart.getTotalWithTax()}</div>
						<div class="payment-summary-money"></div>
					</div>
				</c:if>

				<c:if test="${empty sessionScope.user}">
					<div class=" text-lg-start mt-4 pt-2">
						<a href="login.jsp" class="btn btn-primary btn-sm"
							style="padding: 0.5rem 1rem;">Please login to checkout</a>
					</div>
				</c:if>

				<c:if test="${not empty sessionScope.user}">
					<div class=" text-lg-start mt-4 pt-2">
						<a href="checkout.jsp" class="btn btn-primary btn-sm"
							style="padding: 0.5rem 1rem;">Proceed to Checkout</a>
					</div>
				</c:if>


				<%-- <c:if test="${empty sessionScope.cart.items}">
						<h2 class="cart-heading">Your Cart Is Empty</h2>
					</c:if> --%>

			</div>
		</div>
	</div>
	<!-- ***** Subscribe Area Ends ***** -->

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
	<script>
		function updateCart(updatedInput) {
			var productId = updatedInput.getAttribute("productId");
			var newQuantity = updatedInput.value;

			const xhttp = new XMLHttpRequest();
			xhttp.open("GET", "UpdateCart?productId=" + productId
					+ "&quantity=" + newQuantity, true);

			//https://www.w3schools.com/js/js_ajax_http.asp 

			xhttp.onreadystatechange = function() {

				if (xhttp.readyState === 4 && xhttp.status === 200) {

					var responseText = xhttp.responseText.split(",");
					var subTotal = responseText[0];
					var totalPrice = responseText[1];
					var tax = responseText[2];
					var totalWithTax = responseText[3];

					var subTotalElement = document.getElementById("sub-total");
					subTotalElement.innerText = "Total :$ " + subTotal;

					var TotalElement = document.getElementById("cart-total");
					TotalElement.innerText = "Total before tax: $" + totalPrice;

					var taxElement = document.getElementById("cart-tax");
					taxElement.innerText = "Estimated tax: $" + tax;

					var TotalWithTaxElement = document
							.getElementById("cart-totalWithTax");
					TotalWithTaxElement.innerText = "Order total: $"
							+ totalWithTax;

				}
			};

			xhttp.send();
		}
	</script>

	<script type="module" src="assets/js/checkout/checkout.js"></script>
	<script type="module" src="assets/js/checkout/hexa.js"></script>

</body>

</html>
