package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProductDAO productDao = new ProductDAO();
	CategoryDAO categoryDao = new CategoryDAO();
	List<Product> products;
	List<Category> categories;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String action = request.getParameter("action");
			if (action == null) {
				action = "DEFAULT";
			}

			switch (action) {
			case "SEARCH": {
				getSearchedProducts(request, response);
				break;
			}
			case "SHOW_PRODUCT_BY_CATEGORY": {
				getProductByCategory(request, response);
				break;
			}
			default:
				getLastestHomePage(request, response);
			}

			dispatchAttributeToView(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	private void dispatchAttributeToView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		request.setAttribute("products", products);
		request.setAttribute("categories", categories);
		rd.forward(request, response);
	}

	private void getProductByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String categoryId = request.getParameter("categoryId");

		products = categoryDao.getProductByCategoryId(categoryId);
		request.setAttribute("productsByCategory", products);

	}

	private void getSearchedProducts(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		String productName = request.getParameter("searchField");
		RequestDispatcher rd = request.getRequestDispatcher("/search-section.jsp");

		request.setAttribute("productBySearch", ProductDAO.getProductBySearch(productName));
		rd.forward(request, response);
	}

	private void getLastestHomePage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		categories = categoryDao.showCategories();

		for (Category category : categories) {
			products = categoryDao.getLatestProductsByCategoryId(category.getId());
			request.setAttribute("latestProducts_" + category.getId(), products);
		}

	}
	


}
