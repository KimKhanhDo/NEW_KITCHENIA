<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Kitchenia - Check Out Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

    <link rel="stylesheet" href="assets/css/general.css">
 
    <link rel="stylesheet" href="assets/css/order.css">
   
    <link rel="stylesheet" href="assets/css/checkout-header.css">

    <link rel="stylesheet" href="assets/css/checkout.css">

<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
    </head>
    
    <body>
  
    
    <!-- ***** Header Area Start ***** -->
    
  <jsp:include page="header-section.jsp"/>
  
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading about-page-heading" id="top">
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

    <!-- ***** Customer Orders Area Starts ***** -->
    <section>
      <div class="main">
        <div class="page-title">Order Successfully</div>
  
        <div class="checkout-grid">
          <div>
            <div class="order-summary js-order-summary">  </div>      
            <div class="cart-item-container">

              <h3 class="payment-summary-title">Customer  Details </h3>
                     
              <form class="customer-billing-address">
                <div class="input-group"><label for="fname">First Name: </label>
                  <input type="text" ></div>
                <div class="input-group"><label for="lname">Last Name: </label>
                  <input type="text" ></div>
                <div class="input-group"> <label for="email">Email: </label>
                  <input type="email" ></div>
                <div class="input-group"> <label for="company">Company: </label>
                  <input type="text" ></div>
                <div class="input-group"><label for="address1">Address 1: </label>
                  <input type="text"></div>
                <div class="input-group"><label for="address2">Address 2: </label>
                  <input type="text" ></div>
                <div class="input-group"><label for="postcode">Postcode: </label>
                  <input type="text" ></div>
                <div class="input-group"><label for="suburb">Suburb: </label>
                  <input type="text" ></div>
                <div class="input-group">  <label for="phone">Phone: </label>
                  <input type="tel" ></div>            
                    
              </form>
              <input type="button" value="Save billing address" class="button-save-billing-address">
            </div>

            <!-- PAYMENT METHOD -->
            <div class="cart-item-container">
              <h3 class="payment-summary-title">Payment Method </h3>
            <form>
              <div class="payment-method"> 
                <input type="radio" id="creditCard" name="paymentMethod">
                <label>Credit Card <span> ($2.00)</span></label>
              </div>
              <div class="payment-method"> 
                <input type="radio" id="americanExpress" name="paymentMethod">
                <label>American Express <span> ($2.00)</span></label>
              </div>
              <div class="payment-method"> 
                <input type="radio" id="paypal" name="paymentMethod">
                <label>Paypal <span> ($2.00)</span></label>
              </div>
              <div class="payment-method"> 
                <input type="radio" id="afterPay" name="paymentMethod">
                <label>After Pay </label>
              </div>
            </form>
            </div>

            <div class="cart-item-container" id="creditCardDetails" style="display: none;">
              <h3 class="payment-summary-title">Enter Your Card Details</h3>
              <form class="card-detail-form">
                <div>
                  <label  for="cardNumber">Card Number:</label>                  
                  <input type="text" id="cardNumber">
                </div>
                 <div>
                  <label for="expirationDate">Expiration Date:</label>                
                 <input type="text" id="expirationDate">
                </div>
                <div>
                  <label for="cvv">CVV:</label>                   
                 <input type="text" id="cvv">
                </div>                  
              </form>
              <input type="button" value="Validate your card" class="button-save-billing-address">
              </div>

          </div>          
          
          <div class="payment-summary">          	
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
					<div id="cart-totalWithTax">Order total: $${cart.getTotalWithTax()} </div>
					<div class="payment-summary-money"></div>
				</div>	
          </div>
         </div>
      </div>
    </section>
    <!-- ***** Customer Orders Area Ends ***** -->   
      
    <!-- ***** Subscribe Area Starts ***** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>By Subscribing To Our Newsletter You Can Get 10% Off</h2>
                        <span>Entertaining Ideas For Your Life</span>
                    </div>
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-5">
                            <fieldset>
                              <input name="name" type="text" id="name" placeholder="Your Name" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-5">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-2">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <ul>
                                <li>Store Location:<br><span>585 Malvern Rd Toorak VIC 3142</span></li>
                                <li>Phone:<br><span>010-020-0340</span></li>
                                <li>Office Location:<br><span>9-11 Little Bridge St Ballarat Central VIC 3350</span></li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul>
                                <li>Work Hours:<br><span>09:00 AM - 5:30 PM Daily</span></li>
                                <li>Email:<br><span>info@kitchenia.com.au</span></li>
                                <li>Social Media:<br><span><a href="#">Facebook</a>, <a href="#">Instagram</a>, <a href="#">Behance</a>, <a href="#">Linkedin</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Subscribe Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
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
 <script type ="module" src="assets/js/checkout/hexa.js"></script> 
 <script type="module" src="assets/js/checkout/checkout.js"></script>
 <script type="module" src="assets/js/checkout/cardDetails.js"></script>
  </body>

</html>
