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
	
}
