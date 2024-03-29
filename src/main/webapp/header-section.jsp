<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ***** Preloader Start ***** -->

<!-- ***** Preloader End ***** -->


<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
	<!-- bootstrap.min -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<a href="Home" class="logo"> <img
						src="assets/images/Logo-1.png">
					</a>
					<!-- ***** Logo End ***** -->

					<!-- ***** Category Menu Start & Category's products href link ***** -->
					<ul class="nav" style="padding-bottom: 50px;">
						<li class="scroll-to-section"><a href="Home" class="active">Home</a></li>
						<c:forEach items="${categories}" var="category">
							<li class="scroll-to-section"><a
								href="Home?action=SHOW_PRODUCT_BY_CATEGORY&categoryId=${category.id}">${category.name}</a></li>
						</c:forEach>
						<!-- end category menu -->

						<li class="scroll-to-section"><a href="contact.jsp">Contact Us</a></li>

						<!-- LOGIN/ LOGOUT area start -->
						<c:if test="${user.username == null }">
							<li class="scroll-to-section"><a href="login.jsp"><i
									class="fa fa-user fa-lg" aria-hidden="true"></i> </a></li>
						</c:if>


						<c:if test="${not empty user.username}">
							<li class="scroll-to-section dropdown"><a href="#"
								data-toggle="dropdown"> <span>${user.username}</span> <i
									class="fa fa-caret-down"></i>
							</a>
								<ul class="dropdown-menu">
									<li><form class="dropdown-item" action="Checkout" method="post">
											<input type="hidden" name="action" value="VIEW_ORDER_HISTORY">
											<button type="submit" class="dropdown-item" >Your Order</button>
										</form>
									<li><a class="dropdown-item" href="forgot-password.jsp">Change
											Password</a></li>
									<li><a class="dropdown-item"
										href="Authentication?action=LOGOUT">Log Out <i
											class="fa fa-sign-out" aria-hidden="true"></i>
									</a></li>
								</ul></li>
						</c:if>
						<!-- LOGIN/ LOGOUT area end -->

						<li class="scroll-to-section"><a href="Cart?action=VIEW_CART"> <img
								class="cart-icon" src="assets/icons/cart-icon.png">
								(${empty sessionScope.cart.getItems()? 0 : sessionScope.cart.getItems().size()})
						</a></li>

					</ul>
					<!-- ***** Menu End ***** -->

				</nav>
			</div>
		</div>
	</div>

</header>
<!-- ***** Header Area End ***** -->

