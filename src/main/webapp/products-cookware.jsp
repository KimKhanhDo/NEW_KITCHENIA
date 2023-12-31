<!DOCTYPE html>

<%@ page import="dao.ProductDAO"%>
<%@ page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
 <%
 	String productCategory = request.getParameter("category"); 	
 	 	
 	pageContext.setAttribute("list", ProductDAO.getProductByCategory(productCategory));
 
 %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Kitchenia - Cookware Products Listing Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

    <link rel="stylesheet" href="assets/css/general.css">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.jsp" class="logo">
                            <img src="assets/images/Logo-1.png">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                           <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li class="scroll-to-section"><a
								href="products-cookware.jsp?category=Cookware">Cookware</a></li>
							<li class="scroll-to-section"><a
								href="products-bakeware.jsp?category=Bakeware">Bakeware</a></li>
							<li class="scroll-to-section"><a
								href="products-tabletop.jsp?category=Tabletop">TableTop</a></li>
							<li class="scroll-to-section"><a
								href="products-accessories.jsp?category=Accessories">Accessories</a></li>
							<li class="scroll-to-section"><a href="about.jsp">About
									Us</a></li>
							<li class="scroll-to-section"><a href="contact.jsp">Contact
									Us</a></li>
							<li class="scroll-to-section"><a href="explore.jsp">Explore</a></li>
							<li class="scroll-to-section"><a href="checkout.jsp">
                                <div class="cart-quantity js-cart-quantity">0</div>                                       
                                <img class="cart-icon" src="assets/icons/cart-icon.png">
                            </a></li>                             
                           
                           
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                    </div>
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
                        <h2>Masterful Tools For Every Culinary Quest.</h2>
                        <span>Every dish, whether a multi-course gourmet delight or a classic spag-bol, deserves the finest tools.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row js-products-grid ">      
            <c:forEach items="${list}" var="product">         
             <div class="col-lg-4">
        <div class="item">
            <div class="thumb">
                <div class="hover-content">
                   <ul>
                        <li><a href="single-product.jsp?productId=${product.id}"><i class="fa fa-eye"></i></a></li>
                        <li><a href="single-product.jsp?productId=${product.id}"><i class="fa fa-star"></i></a></li>
                        <li><a><i class="fa fa-shopping-cart button-primary js-add-to-cart" data-product-id="${product.id}"></i></a></li>
                    </ul>
                </div>
                <img src="assets/images/${product.image}" alt="">
            </div>
            <div class="down-content">
                <h4>${product.brand}</h4>
                <span>${product.name}</span>
                <span>$${product.price}</span>
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
            <div class="col-lg-12">
                <div class="pagination">
                    <ul>
                        <li>
                            <a href="#">1</a>
                        </li>
                        <li class="active">
                            <a href="#">2</a>
                        </li>
                        <li>
                            <a href="#">3</a>
                        </li>
                        <li>
                            <a href="#">4</a>
                        </li>
                        <li>
                            <a href="#">></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Products Area Ends ***** -->
    
    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img src="assets/images/Logo-2-1.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">585 Malvern Rd Toorak VIC 3142</a></li>
                            <li><a href="#">info@kitchenia.com.au</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>SHOPPING WITH US</h4>
                    <ul>
                      <li><a href="products-accessories.jsp?category=Cookware">Cookware</a></li>
                        <li><a href="products-accessories.jsp?category=Bakeware">Bakeware</a></li>
                        <li><a href="products-accessories.jsp?category=Tabletop">Tabletop</a></li>
                        <li><a href="products-accessories.jsp?category=Accessories">Accessories</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>ABOUT KITCHENIA</h4>
                    <ul>
                        <li><a href="index.html">Homepage</a></li>
                        <li><a href="about.html">Our Story</a></li>
                        <li><a href="explore.html">Kitchenia Magazine</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>HERE TO HELP</h4>
                    <ul>
                        <li><a href="contact.html">Contact Us</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright Â© 2025 Kitchenia Co, Ltd. All Rights Reserved. 
                        <p>Made with <i class="fa fa-heart"></i> by BE5</p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

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
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

 <script>
     const category = "Cookware";
  
   </script>
    
  </body>

</html>
