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

<title>Kitchenia - Product Listing Page</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/general.css">

<style>
.product__pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn.btn-success {
	background-color: grey;
	border-color: grey;
	color: white; /* Optionally, you can set the text color */
}
</style>

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


	<!-- ***** Products Area Starts ***** -->
	<section class="section" id="products">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Elevate Your Culinary Experience with Kitchenia</h2>
						<span>Every dish, whether a multi-course gourmet delight or
							a classic spag-bol, deserves the finest tools.</span>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${allProducts}" var="product">
					<div class="col-lg-4">
						<div class="item">
							<div class="thumb">
								<div class="hover-content">
									<ul>
										<li><a href="ProductDetail?productId=${product.id}"><i
												class="fa fa-eye"></i></a></li>
										<li><a href="ProductDetail?productId=${product.id}"><i
												class="fa fa-star"></i></a></li>
										<li><a href="ProductDetail?productId=${product.id}"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
								<img src="assets/images/${product.image}" alt="">
							</div>
							<div class="down-content">
								<h4>${product.brand}</h4>
								<span>${product.name}</span> <span>${product.price}</span>
								<ul class="stars">
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- pagination-area-start -->
			<div class="product__pagination">
				<div class="list-page"></div>
				<div class="page-number">
					<a
						href="Home?action=SHOW_ALL&page=${currentPage > 1 ? currentPage - 1 : 1}"
						class="btn"> &lt; </a>
					<c:forEach var="pageNumber" begin="1" end="${totalPage}">
						<a href="Home?action=SHOW_ALL&page=${pageNumber}"
							class="btn ${pageNumber == currentPage ? 'btn-success' : ''}">
							${pageNumber} </a>
					</c:forEach>
					<a
						href="Home?action=SHOW_ALL&page=${currentPage < totalPage ? currentPage + 1 : totalPage}"
						class="btn"> &gt; </a>
				</div>
			</div>
			<!-- pagination-area-end -->
	</section>
	<!-- ***** Products Area Ends ***** -->

	<jsp:include page="contact.jsp" />

</body>

</html>
