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

import dao.CategoryDAO;
import dao.OrderDAO;
import entity.Cart;
import entity.Category;
import entity.Order;
import entity.OrderDetails;
import entity.ProductInCart;
import entity.User;

@WebServlet("/SuccessfullPayment")
public class SuccessfullPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SuccessfullPaymentController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			Order billingOrder = (Order) session.getAttribute("billingOrder");
			Cart cart = (Cart) session.getAttribute("cart");

			Order order = new Order(billingOrder.getUserId(), billingOrder.getTotalPrice(), billingOrder.getFirstName(), 
					billingOrder.getLastName(), billingOrder.getAddress(), billingOrder.getSuburb(), billingOrder.getState(), billingOrder.getPostcode(),
					billingOrder.getPhone(), billingOrder.getEmail());

			ArrayList<OrderDetails> orderDetailList = new ArrayList<OrderDetails>();

			for (ProductInCart cartItem : cart.getItems()) {
				OrderDetails orderDetails = new OrderDetails(cartItem.getId(), cartItem.getImage(), cartItem.getName(),
						cartItem.getPrice(), cartItem.getQuantity());

				orderDetailList.add(orderDetails);
			}

			OrderDAO orderDAO = new OrderDAO();
			int orderId = orderDAO.addOrder2(order, orderDetailList);

			if (orderId != -1) {

				// Clear cart
				request.getSession().removeAttribute("cart");
				request.getSession().removeAttribute("billingOrder");
				request.getSession().removeAttribute("totalPrice");
				request.getSession().setAttribute("orderId", orderId);

				SendOrderConfirmation(billingOrder.getEmail(), billingOrder.getFirstName(), billingOrder.getLastName());

				showOrderDetail(request, response);

//			RequestDispatcher rd = request.getRequestDispatcher("checkout-successful.jsp");
//			rd.forward(request, response);

			} else {
				response.sendRedirect("404.jsp");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
			sb.append(
					"Your order has been received and will be processed shortly.\n\nThank you for shopping with us!");

			message.setText(sb.toString());

			Transport.send(message);

			System.out.println("Order confirmation email sent successfully.");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void showOrderDetail(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int orderId = (int) request.getSession().getAttribute("orderId");
		
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Category> categories = categoryDAO.showCategories();

		OrderDAO orderDAO = new OrderDAO();
		List<OrderDetails> orderDetails = orderDAO.getOrderDetailById(orderId);

		request.setAttribute("orderDetails", orderDetails);
		request.setAttribute("categories", categories);
		
		RequestDispatcher rd = request.getRequestDispatcher("/checkout-successful.jsp");

		rd.forward(request, response);

		System.out.println("Hello Co Khanh!!!!! chai tim - function work");

	}

}