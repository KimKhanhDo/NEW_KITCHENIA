package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();

	public RegisterController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("ACTION");
			String first_name = request.getParameter("firstName");
			String last_name = request.getParameter("lastName");
			String phoneNo = request.getParameter("phoneNo");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String code = userDAO.getRandom();

			boolean isUsernameRegistered = userDAO.isUsernameRegistered(username);
			boolean isEmailRegistered = userDAO.isEmailRegistered(email);
			boolean isEmailValid = userDAO.validateEmailPattern(email);

			HttpSession session = request.getSession();
			User verificationUser = new User();

			switch (action) {
			case "submitUsername": {
				if (username != null && !isUsernameRegistered) {
					request.setAttribute("enteredUsername", username);
					request.setAttribute("enteredFirstname", first_name);
					request.setAttribute("enteredLastname", last_name);
					request.setAttribute("enteredPhoneNo", phoneNo);

					request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
				} else {
					request.setAttribute("isUsernameRegistered", isUsernameRegistered);
					request.setAttribute("usernameError", "Username already exists.");
					request.getRequestDispatcher("register-step1-username.jsp").forward(request, response);
				}

				break;
			}
			case "submitEmail": {
				if(!isEmailValid) {
					request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
				}
				if(isEmailRegistered) {
					request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
				}
				if (email != null && isEmailValid && !isEmailRegistered) {
					verificationUser.setFirst_name(first_name);
					verificationUser.setLast_name(last_name);
					verificationUser.setPhoneNumber(phoneNo);
					verificationUser.setUsername(username);
					verificationUser.setEmail(email);
					verificationUser.setCode(code);

					boolean isEmailSend = userDAO.sendEmail(verificationUser);
					
					if (isEmailSend) {
						session.setAttribute("verificationUser", verificationUser);
						response.sendRedirect("register-step3-validateEmail.jsp");
					} else {
						// Failed to send email
						request.setAttribute("emailError", "Failed to send verification email. Please try again.");
						request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
					}

				}

				break;
			}
			case "submitVerifyCode": {
				verificationUser = (User) session.getAttribute("verificationUser");
				String authcode = request.getParameter("authcode");

				if (verificationUser != null && authcode.equals(verificationUser.getCode())) {
					request.getRequestDispatcher("register-step4-password.jsp").forward(request, response);
					System.out.println(verificationUser.getUsername());
				} else {
					request.setAttribute("verificationError", "Incorrect verification code. Please try again.");
					request.getRequestDispatcher("register-step3-validateEmail.jsp").forward(request, response);
				}
				break;
			}
			case "submitPassword": {

				if (password != null) {
					String encodedPassword = BCrypt.withDefaults().hashToString(6, password.toCharArray());
					userDAO.registerNewUser(first_name, last_name, phoneNo, username, email, encodedPassword);
					response.sendRedirect("login.jsp");
					System.out.println(encodedPassword);
					session.removeAttribute("verificationUser");
				} else {
					request.getRequestDispatcher("register-step4-password.jsp").forward(request, response);
				}
				break;
			}
			default: {
				break;

			}
			}

		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

}
