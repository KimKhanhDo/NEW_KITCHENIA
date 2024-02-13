package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
			 {
		UserDAO userDAO = new UserDAO();
		User user = null;

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean isLogin;

		isLogin = userDAO.doLogin(email, password);

		HttpSession session = request.getSession(false);

		if (isLogin) {
			user = userDAO.findUser(email);
			session.setAttribute("user", user);
			response.sendRedirect("Home");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("isLogin", isLogin);
			request.setAttribute("errorMessage", "Incorrect Email or Password");
			rd.forward(request, response);
		}
	}

}
