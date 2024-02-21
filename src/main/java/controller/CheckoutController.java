package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import entity.Cart;
import entity.Order;
import entity.OrderDetails;
import entity.ProductInCart;
import entity.User;

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckoutController() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String action = request.getParameter("action");

			if (action == null) {
				action = "DEFAULT";
			}
			switch (action) {
			case "CHECK_OUT": {
				submitCart(request, response);
				break;
			}
			case "VIEW_ORDER_HISTORY":{
				showOrderHistory(request, response);
				break;
			}
			case "CONTINUE_SHOPPING":{
				 response.sendRedirect(request.getContextPath() + "/Home");
				    break;
			}
			default:
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void submitCart(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Cart cart = (Cart) session.getAttribute("cart");

			double totalPrice = cart.getTotal();
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String address = request.getParameter("address");
			String suburb = request.getParameter("suburb");
			String state = request.getParameter("state");
			String postcode = request.getParameter("postcode");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");

			Order order = new Order(user.getId(), totalPrice, firstName, lastName, address, suburb, state, postcode,
					postcode, phone, email);

			ArrayList<OrderDetails> orderDetailList = new ArrayList<OrderDetails>();

			for (ProductInCart cartItem : cart.getItems()) {
				OrderDetails orderDetails = new OrderDetails(cartItem.getId(), cartItem.getImage(), cartItem.getName(), cartItem.getPrice(),
						cartItem.getQuantity());

				orderDetailList.add(orderDetails);
			}

			OrderDAO orderDAO = new OrderDAO();
			int orderId = orderDAO.addOrder2(order, orderDetailList);

			if (orderId != -1) {

				// Clear cart
				request.getSession().removeAttribute("cart");
				request.getSession().removeAttribute("totalPrice");
				request.getSession().setAttribute("orderId", orderId);
				

				SendOrderConfirmation(email, firstName, lastName);

				showOrderDetail(request, response);

			} else {
				response.sendRedirect("404.jsp");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void showOrderDetail(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int orderId = (int) request.getSession().getAttribute("orderId");

		OrderDAO orderDAO = new OrderDAO();
		List<OrderDetails> orderDetails = orderDAO.getOrderDetailById(orderId);

		request.setAttribute("orderDetails", orderDetails);

		RequestDispatcher rd = request.getRequestDispatcher("checkout-successful.jsp");

		rd.forward(request, response);

		System.out.println("function works");

	}
	
	public void showOrderHistory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		OrderDAO orderDAO = new OrderDAO();
		
		List<Order> list = orderDAO.getOrdersByUserId(user.getId());
		System.out.println(user.getId());
		
		request.setAttribute("orderHistory", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("order-history.jsp");
	    dispatcher.forward(request, response);
		
	}
	
	public static void SendOrderConfirmation(String email, String firstName, String lastName) {
	    final String username = "javaIsFun12@gmail.com"; // Gmail email address
	    final String password = "qxfvthymqgvapxvt"; // Gmail app-specific password

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");

	    Session session = Session.getInstance(props, new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	    });

	    try {
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	        message.setSubject("Order Confirmation");

	        StringBuilder sb = new StringBuilder();
	       
	        sb.append("Hey ").append(firstName).append(" ").append(lastName).append(",\n\n");
	        sb.append("We've received your order. Your order will be processed shortly.\n\nThank you for shopping with us!");
	       
	        message.setText(sb.toString());

	        Transport.send(message);

	        System.out.println("Order confirmation email sent successfully.");
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	}
	
	
	 
}
