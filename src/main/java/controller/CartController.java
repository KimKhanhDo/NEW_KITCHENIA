package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;

import entity.Cart;
import entity.Category;
import entity.Product;
import entity.ProductInCart;

@WebServlet("/Cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO productDAO = new ProductDAO();
	CategoryDAO categoryDAO = new CategoryDAO();

	List<Category> category;

	public CartController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		String action = request.getParameter("action");
		if (action == null) {
			action = "DEFAULT";
		}
		switch (action) {
		case "ADD_TO_CART": {

			addToCart(request, response);

			break;
		}
		case "VIEW_CART": {
			category = categoryDAO.showCategories();
			RequestDispatcher rd = request.getRequestDispatcher("view-cart.jsp");
			request.setAttribute("allCategory", category);
			rd.forward(request, response);
			break;
		}
		case "REMOVE": {
			removeCartItems(request, response);

		}
		default:
			break;
		}

	} catch (NumberFormatException | IOException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	
	private void addToCart(HttpServletRequest request, HttpServletResponse response)
			throws IOException, NumberFormatException, SQLException {
		String productId = request.getParameter("productId");
		String quantity = request.getParameter("quantity");

		Product product = productDAO.getProductById(productId);
		ProductInCart productInCart = new ProductInCart(product.getId(), product.getName(), product.getImage(),
				product.getPrice(), 0, Integer.parseInt(quantity));
		Cart cart;
		double totalPrice = 0;

		HttpSession session = request.getSession();

		if (session.getAttribute("cart") == null) {
			cart = new Cart();
			cart.setItems(new HashSet<ProductInCart>());

		} else {
			cart = (Cart) session.getAttribute("cart");
		} 

		if (cart.getItems().contains(productInCart)){
			for(ProductInCart item : cart.getItems()) {
				if(item.getId() == productInCart.getId()){
					int currentQuantity = item.getQuantity();
					productInCart.setQuantity(currentQuantity + Integer.parseInt(quantity));
					productInCart.setSubTotal(productInCart.getPrice() * productInCart.getQuantity());
					System.out.println("SubTotal: " + productInCart.getSubTotal());
				}			
				
			}
			cart.getItems().remove(productInCart);

			cart.getItems().add(productInCart);

		} else {
			productInCart.setSubTotal(productInCart.getPrice() * productInCart.getQuantity());
			cart.getItems().add(productInCart);
		}

		// calculate total
		for (ProductInCart i : cart.getItems()) {
			totalPrice += i.getPrice() * i.getQuantity();
			System.out.println("total: " + totalPrice);
			cart.setTotal(totalPrice);
		}

		session.setAttribute("cart", cart);
		response.sendRedirect("ProductDetail?productId=" + productId);

	}

	private void removeCartItems(HttpServletRequest request, HttpServletResponse response)
			throws NumberFormatException, SQLException, IOException {

		String productId = request.getParameter("productId");
		Product product = productDAO.getProductById(productId);
		ProductInCart productInCart = new ProductInCart(product.getId(), product.getName(), product.getImage(),
				product.getPrice(), 0, 0);
		Cart cart;

		HttpSession session = request.getSession();
		cart = (Cart) session.getAttribute("cart");
		int removedQuantity = 0;
		
		if (cart.getItems().contains(productInCart)) {
			for(ProductInCart item : cart.getItems()) {
				if(item.getId() == productInCart.getId()){
					removedQuantity = item.getQuantity();
				}			
				
			}

			// get the quantity of removed items
			
			cart.getItems().remove(productInCart);

			// calculate sub-total of removed item
			double totalPriceOfRemovedItem = productInCart.getPrice() * removedQuantity;

			// update total Price by minus the removed item sub total
			cart.setTotal(cart.getTotal() - totalPriceOfRemovedItem);

		} else {
			addToCart(request, response);
		}
		response.sendRedirect("Cart?action=VIEW_CART");
	}


}
