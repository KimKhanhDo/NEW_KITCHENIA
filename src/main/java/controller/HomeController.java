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
import javax.servlet.http.HttpSession;

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

	public HomeController() {
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
			case "SEARCH": {
				getSearchedProducts(request, response);
				break;
			}
			case "SHOW_PRODUCT_BY_CATEGORY": {
				getProductByCategory(request, response);
				break;
			}
			case "LOGOUT": {
				HttpSession session = request.getSession();
				session.invalidate();
				request.getRequestDispatcher("logout.jsp").forward(request, response);

				break;
			}
			case "SHOW_ALL": {
				showAllProducts(request, response);
				break;
			}

			default:
				getLastestHomePage(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void dispatchAttributeToView(HttpServletRequest request, HttpServletResponse response, String view)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(view);

		request.setAttribute("categories", categories);
		rd.forward(request, response);
	}

	
	private void getProductByCategory(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException, SQLException {

	    String categoryId = request.getParameter("categoryId");
	    String page = request.getParameter("page");

	    int currentPage = 1;
	    if (page != null && categoryId != null) {
	        currentPage = Integer.parseInt(page);
	    }

	   
	        int totalPages = CategoryDAO.getTotalPageByCategory(categoryId);
	        products = categoryDao.pagingProductByCategoryId(categoryId, currentPage);
	        categories = categoryDao.showCategories();


	        request.setAttribute("productsByCategory", products);
	        request.setAttribute("totalPages", totalPages);
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("categoryId", categoryId);
	        
	        // Test
	        System.out.println("Function active");

	        dispatchAttributeToView(request, response, "/index.jsp");

	}

	private void getSearchedProducts(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		categories = categoryDao.showCategories();
		String productName = request.getParameter("searchField");

		request.setAttribute("productBySearch", ProductDAO.getProductBySearch(productName));
		dispatchAttributeToView(request, response, "/search-section.jsp");
	}

	private void getLastestHomePage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		categories = categoryDao.showCategories();

		for (Category category : categories) {
			products = categoryDao.getLatestProductsByCategoryId(category.getId());
			request.setAttribute("latestProducts_" + category.getId(), products);
		}
		dispatchAttributeToView(request, response, "/index.jsp");
	}

	private void showAllProducts(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {

	    int currentPage = 1;
	    String page = request.getParameter("page");

	    if (page != null) {
	        currentPage = Integer.parseInt(page);
	    }

	    
	        categories = categoryDao.showCategories();
	        products = productDao.getProductsByPage(currentPage);

	       
	        request.setAttribute("totalPage", ProductDAO.getTotalPage());
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("categories", categories);
	        request.setAttribute("allProducts", products);
	        
	        // Test
	        System.out.println("active");
	        System.out.println("hello");
	        
	        
	        RequestDispatcher rd = request.getRequestDispatcher("/all-products.jsp");
			rd.forward(request, response);
	}
}