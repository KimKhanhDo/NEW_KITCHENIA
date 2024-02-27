package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Authentication")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			
			if ("LOGOUT".equalsIgnoreCase(action)) {
				doLogOut(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			String action = request.getParameter("action");

			switch (action) {
			case "LOGIN": {
				doLogIn(request, response);
				break;
			}
			default:
				break;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doLogIn(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		User user = null;

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("login password" + password);

		boolean isLogin;

		isLogin = userDAO.doLogin(email, password);

		HttpSession session = request.getSession(true);

		if (isLogin) {
			user = userDAO.findUser(email);
			session.setAttribute("user", user);

			// Check for "Remember me" option
			String remember = request.getParameter("rememberMe");

			// User chose to be remembered, set cookies
			if ("true".equals(remember)) {
				addUserCookies(email, password, response);
			} else {
				removeUserCookies(response);
			}

			response.sendRedirect("Home");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("isLogin", false);
			request.setAttribute("errorMessage", "Incorrect Email or Password");
			rd.forward(request, response);
		}
	}

	private void doLogOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		// Clear any "Remember me" cookies
		removeUserCookies(response);

		response.sendRedirect("Home");
	}

	private void addUserCookies(String email, String password, HttpServletResponse response) {
		Cookie ckEmail = new Cookie("email", email);
		ckEmail.setMaxAge(30 * 24 * 60 * 60); // Expires in 30 days
		response.addCookie(ckEmail);

		Cookie ckPassword = new Cookie("password", password);
		ckPassword.setMaxAge(30 * 24 * 60 * 60); // Expires in 30 days
		response.addCookie(ckPassword);
	}

	private void removeUserCookies(HttpServletResponse response) {
		Cookie ckEmail = new Cookie("email", "");
		ckEmail.setMaxAge(0); // Delete the cookie
		response.addCookie(ckEmail);

		Cookie ckPassword = new Cookie("password", "");
		ckPassword.setMaxAge(0); // Delete the cookie
		response.addCookie(ckPassword);
	}

}
