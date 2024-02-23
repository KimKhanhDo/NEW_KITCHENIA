package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import entity.Cart;
import entity.Order;
import entity.ProductInCart;

import com.stripe.model.Price;

@WebServlet("/Payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String STRIPE_API_KEY = "sk_test_51OmJuDLHXp4eUWrCZxhNZgm1XA91KyrxNbCb7k8qlxo4trziqtInxhD1DU7m283kf96T3UHyh24FWBDroRPoP21w00oMficRba";

	public PaymentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String suburb = request.getParameter("suburb");
		String state = request.getParameter("state");
		String postcode = request.getParameter("postcode");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		Order billingOrder;		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		double totalPrice = cart.getTotal();
		
		if (session.getAttribute("billingOrder") == null) {
			billingOrder = new Order(userId, totalPrice, firstName, lastName, address, suburb, state, postcode, phone, email);
			session.setAttribute("billingOrder", billingOrder);

		} else {
			billingOrder = (Order) session.getAttribute("billingOrder");
		}

		
		    try {
		        Stripe.apiKey = STRIPE_API_KEY;     
		        SessionCreateParams.Builder paramsBuilder = SessionCreateParams.builder()
		                .setMode(SessionCreateParams.Mode.PAYMENT)
		                .setSuccessUrl("http://localhost:8080/NEW-KITCHENIA/SuccessfullPayment")
		                .setCancelUrl("http://localhost:8080/UrbanEasyTT/Payment");

		        // Iterate over the products and add line items
		        for (ProductInCart item : cart.getItems()) {
		        	String baseURL = "http://localhost:8080";
		            String imageURL = baseURL + request.getContextPath() + "/assets/images/" + item.getImage();  	
		        	
		            System.out.println(imageURL);
		            
		            SessionCreateParams.LineItem lineItem = SessionCreateParams.LineItem.builder()
		                    .setPriceData(
		                            SessionCreateParams.LineItem.PriceData.builder()
		                                    .setCurrency("aud")
		                                    .setUnitAmount((long) (item.getPrice() * 100)) // Stripe expects amount in cents    
		                                    .setProductData(
		                                            SessionCreateParams.LineItem.PriceData.ProductData.builder()
		                                                    .setDescription("Kitchenia - card payment")
		                                                    .addImage(imageURL) 
		                                                    .setName(item.getName())
		                                                    .build())
		                                    .build())
		                    .setQuantity((long) item.getQuantity())
		                    .build();
		            
		            paramsBuilder.addLineItem(lineItem);
		        }
		

		        // Build SessionCreateParams
		        SessionCreateParams params = paramsBuilder.build();

		        // Create session
		        Session stripeSession = Session.create(params);
		        
	      response.sendRedirect(stripeSession.getUrl());
		} catch (StripeException e) {
			e.printStackTrace();
		}

	}
	

}
