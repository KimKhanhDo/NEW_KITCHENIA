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

<title>Kitchenia Home Kitchenware & Kitchen Supplies</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/general.css">

<!-- pagination css -->
<style>
.product__pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn.btn-success {
	background-color: grey;
	border-color: grey;
	color: white; 
}
</style>

</head>

<body>

<jsp:include page="header-section.jsp"/>
<jsp:include page="main-banner.jsp"/>

	<!-- ***** Cookware Area Starts ***** -->
	<c:if test="${not empty latestProducts_1}">
		<section class="section" id="men">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="section-heading">
							<h2>Cookware</h2>
							<span> Check back here for the newest offerings in quality
								cookware</span> <a class="section-heading-discover-more"
								href="products-accessories.jsp?category=Cookware"><span>Discover
									More</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">

				<div class="row">
					<div class="col-lg-12">
						<div class="men-item-carousel">
							<div class="owl-men-item owl-carousel">
								<c:forEach items="${latestProducts_1}" var="product">
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
											<img src="assets/images/${product.image}" alt="cookware">
										</div>
										<div class="down-content">

											<h4>${product.brand}</h4>
											<span>${product.name}</span> <span>$${product.price}</span>
											<ul class="stars">
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
											</ul>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- ***** Cookware Area Ends ***** -->

	<!-- ***** Bakeware Area Starts ***** -->
	<c:if test="${not empty latestProducts_2}">
		<section class="section" id="women">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="section-heading">
							<h2>Bakeware</h2>
							<span>Craft, bake, and delight with our exquisite bakeware
								collection.</span> <a class="section-heading-discover-more"
								href="products-accessories.jsp?category=Bakeware"><span>Discover
									More</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="women-item-carousel">
							<div class="owl-women-item owl-carousel">
								<c:forEach items="${latestProducts_2}" var="product">
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
											<img src="assets/images/${product.image}" alt="cookware">
										</div>
										<div class="down-content">

											<h4>${product.brand}</h4>
											<span>${product.name}</span> <span>$${product.price}</span>
											<ul class="stars">
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
											</ul>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- ***** Bakeware Area Ends ***** -->

	<!-- ***** Tabletop Area Starts ***** -->
	<c:if test="${not empty latestProducts_3}">
		<section class="section" id="kids">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="section-heading">
							<h2>Tabletop</h2>
							<span>When you’ve worked hard in the kitchen to achieve
								culinary perfection, you deserve to show it off magnificently.</span> <a
								class="section-heading-discover-more"
								href="products-accessories.jsp?category=Tabletop"><span>Discover
									More</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="kid-item-carousel">
							<div class="owl-kid-item owl-carousel">
								<c:forEach items="${latestProducts_3}" var="product">
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
											<img src="assets/images/${product.image}" alt="tabletop">
										</div>
										<div class="down-content">
											<h4>${product.brand}</h4>
											<span>${product.name}</span> <span>$${product.price}</span>
											<ul class="stars">
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
											</ul>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- ***** Tabletop Area Ends ***** -->

	<!-- ***** Accessories Area Starts ***** -->
	<c:if test="${not empty latestProducts_4}">

		<section class="section" id="kids">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="section-heading">
							<h2>Accessories</h2>
							<span>Slice, Dice, and Savour with Hexa</span> <a
								class="section-heading-discover-more"
								href="products-accessories.jsp?category=Accessories"><span>Discover
									More</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="kid-item-carousel">
							<div class="owl-kid-item owl-carousel">
								<c:forEach items="${latestProducts_4}" var="product">
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
											<img src="assets/images/${product.image}" alt="accessories">
										</div>
										<div class="down-content">
											<h4>${product.brand}</h4>
											<span>${product.name}</span> <span>$${product.price}</span>
											<ul class="stars">
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
											</ul>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- ***** Accessories Area Ends ***** -->


	<!-- ***** Show Product by CATEGORY Area Starts ***** -->
	<c:if test="${not empty productsByCategory}">
		<section class="section" id="products">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-heading">
							<h2>Refine Your Cooking Experience with Kitchenia</h2>
							<span>Premium Cookware & Cooking Supplie.</span>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${productsByCategory}" var="product">
						<div class="col-lg-4">
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="ProductDetail?productId=${product.id}"><i
															class="fa fa-eye"></i></a></li>
											<li><a href="#"><i
													class="fa fa-star"></i></a></li>
											<li><a href="#"><i
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
				<div class="row">
					<div class="col-lg-12">
					
					
					<!-- Store the category ID in a hidden input field -->
						<input type="hidden" name="categoryId" value="${categoryId}" />

						<!-- pagination-area-start -->
						<div class="product__pagination">
							<div class="list-page"></div>
							<div class="page-number">
								<a
									href="Home?action=SHOW_PRODUCT_BY_CATEGORY&categoryId=${categoryId}&page=${currentPage > 1 ? currentPage - 1 : 1}"
									class="btn"> &lt; </a>

								<c:forEach var="pageNumber" begin="1" end="${totalPages}">
									<a
										href="Home?action=SHOW_PRODUCT_BY_CATEGORY&categoryId=${categoryId}&page=${pageNumber}"
										class="btn ${pageNumber == currentPage ? 'btn-success' : ''}">
										${pageNumber} </a>
								</c:forEach>

								<a
									href="Home?action=SHOW_PRODUCT_BY_CATEGORY&categoryId=${categoryId}&page=${currentPage < totalPages ? currentPage + 1 : totalPages}"
									class="btn"> &gt; </a>
							</div>
						</div>
						<!-- pagination-area-end -->

						
						
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- ***** Show Product by CATEGORY Area Ends ***** -->

	<jsp:include page="footer-section.jsp"/>
	
</body>
</html>