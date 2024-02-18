package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import entity.ProductInCart;

/**
 * Servlet implementation class UpdateCartWebService
 */
@WebServlet("/UpdateCart")
public class UpdateCartWebService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateCartWebService() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// using Ajax - JS onchange to get the parameter instantly without click submit button
			String productId = request.getParameter("productId");
			String newQuantity = request.getParameter("quantity");

			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.getProductById(productId);
			ProductInCart productInCart = new entity.ProductInCart(product.getId(), product.getName(), product.getImage(), product.getPrice(), 0, 0);

			Cart cart;
			HttpSession session = request.getSession();
			cart = (Cart) session.getAttribute("cart");
			double totalPrice = 0;

			if (cart.getItems().contains(productInCart)) {
				for (ProductInCart item : cart.getItems()) {
					if (item.getId() == productInCart.getId()) {
						
						productInCart.setQuantity(Integer.parseInt(newQuantity));
						productInCart.setSubTotal(productInCart.getPrice() * productInCart.getQuantity());
						System.out.println("SubTotal: " + productInCart.getSubTotal());
					}

				}
			}
			
				cart.getItems().remove(productInCart);
				cart.getItems().add(productInCart);

			// update total price			
				
				for (ProductInCart i : cart.getItems()) {
					totalPrice += Math.round(i.getPrice() * i.getQuantity() * 100) / 100;
					System.out.println("total: " + totalPrice);
					cart.setTotal(totalPrice);
				}
				cart.setTax(Math.ceil(totalPrice * 10.0) / 100.0);
				
				cart.setTotalWithTax(cart.getTotal() + cart.getTax());

			String responseText = productInCart.getSubTotal()  + "," + cart.getTotal() + "," + cart.getTax() + "," + cart.getTotalWithTax();
			
			response.setContentType("text/plain");

	        response.getWriter().write(responseText);	            
			
		
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
