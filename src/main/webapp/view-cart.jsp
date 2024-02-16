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


<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
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
			Checkout (<a class="return-to-home-link" href="index.jsp">${sessionScope.cart.getItems().size()} Items</a>)
		</div>
	</section>
	<!-- ***** Explore Area Ends ***** -->

	<div class="main">
		<div class="page-title">Review your order</div>


		<div class="checkout-grid">
			<div class="order-summary">
				<c:if test="${empty sessionScope.cart.items}">
					<h4>Cart is empty</h4>
				</c:if>

				<c:if test="${not empty sessionScope.cart.items}">
					<c:forEach var="item" items="${sessionScope.cart.items}">
						<div class="cart-item-container">
							<div class="delivery-date">Delivery date: ${dateString}</div>

							<div class="cart-item-details-grid">
								<img class="product-image" src="assets/images/${item.image}">


								<div class="cart-item-details">
									<div class="product-name">${item.name}</div>
									<div class="product-price">Price: $${item.price}</div>
									<div class="product-price">Total: $${item.subTotal}</div>
									<div class="product-quantity">
										<span> Quantity: <span class="quantity-label">${item.quantity}</span>
										</span> <span class="update-quantity-link link-primary">
											Update </span> <span
											class="delete-quantity-link link-primary js-delete-link">
											<a href="Cart?action=REMOVE&productId=${item.id}">Delete
										</a>
										</span>
									</div>
								</div>
								<div class="delivery-options">
									<div class="delivery-options-title">Choose a delivery
										option:</div>

								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>


			</div>

			<div class="payment-summary ">
				<div class="payment-summary-title">Order Summary</div>
			<c:if test="${empty sessionScope.cart.getItems()}">
				<div class="payment-summary-row">
					<div>Items (${sessionScope.cart.getItems().size()}):</div>
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
							
					<div>Total before tax: ${cart.getTotal()}</div>
					<div class="payment-summary-money"></div>
				
					
				</div>

				<div class="payment-summary-row">
					<div>Estimated tax (10%): ${cart.getTotal() * 10/100}</div>
					<div class="payment-summary-money"></div>
				</div>

				<div class="payment-summary-row total-row">
					<div>Order total: ${cart.getTotal() + (cart.getTotal() * 10/100)} </div>
					<div class="payment-summary-money"></div>
				</div>
			</c:if>
				<a href="#">
					<button class="place-order-button button-primary">Go to checkout</button>
				</a>
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

	<script type="module" src="assets/js/checkout/checkout.js"></script>
	<script type="module" src="assets/js/checkout/hexa.js"></script>

</body>

</html>
