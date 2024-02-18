package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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

			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Cart cart = (Cart) session.getAttribute("cart");
			OrderDAO orderDAO = new OrderDAO();
			Order order = new Order();

			order.setUserId(user.getId());
			System.out.println("userId " + order.getUserId() );

			ArrayList<OrderDetails> orderDetailList = new ArrayList<OrderDetails>();

			for (ProductInCart cartItem : cart.getItems()) {
				OrderDetails orderDetails = new OrderDetails(cartItem.getId(), cartItem.getImage(), cartItem.getPrice(), cartItem.getQuantity());

				orderDetailList.add(orderDetails);
			}

			boolean result = orderDAO.addOrder(order, orderDetailList);
			if (result) {
				// clear cart
				request.getSession().removeAttribute("cart");

				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			} else {
				response.sendRedirect("support.jsp");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
