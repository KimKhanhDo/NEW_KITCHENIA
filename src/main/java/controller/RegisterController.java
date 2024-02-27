package controller;

import java.io.IOException;

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
			HttpSession session = request.getSession();

			switch (action) {
			case "submitUsername": {
				stepOneSubmitUsername(request, response, session);
				break;
			}
			case "submitEmail": {
				stepTwoSubmitEmail(request, response, session);

				break;
			}
			case "submitVerifyCode": {
				stepThreeValidateEmail(request, response, session);
				break;
			}
			case "submitPassword": {
				stepFourSubmitPassword(request, response, session);

				break;
			}
			case "resendVerifyCode": {
			    resendVerifyCode(request, response, session);
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

	public void stepOneSubmitUsername(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNo = request.getParameter("phoneNo");
		String username = request.getParameter("username");
		boolean isUsernameRegistered = userDAO.isUsernameRegistered(username);

		if (username != null && !isUsernameRegistered) {
			User verificationUser = new User();
			verificationUser.setFirst_name(firstName);
			verificationUser.setLast_name(lastName);
			verificationUser.setPhoneNumber(phoneNo);
			verificationUser.setUsername(username);

			session.setAttribute("verificationUser", verificationUser);

			request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
		} else {
			request.setAttribute("isUsernameRegistered", isUsernameRegistered);
			request.setAttribute("usernameError", "Username already exists.");
			request.getRequestDispatcher("register-step1-username.jsp").forward(request, response);
		}
	}

	public void stepTwoSubmitEmail(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException, MessagingException {

		String code = userDAO.getRandom();
		String email = request.getParameter("email");

		boolean isEmailRegistered = userDAO.isEmailRegistered(email);
		boolean isEmailValid = userDAO.validateEmailPattern(email);

		if (!isEmailValid || isEmailRegistered) {
			request.getRequestDispatcher("register-step2-email.jsp").forward(request, response);
			return;
		}

		if (email != null && isEmailValid && !isEmailRegistered) {
			User verificationUser = (User) session.getAttribute("verificationUser");

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

	}

	public void stepThreeValidateEmail(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {

		User verificationUser = (User) session.getAttribute("verificationUser");
		String authcode = request.getParameter("authcode");

		if (verificationUser != null && authcode.equals(verificationUser.getCode())) {
			request.getRequestDispatcher("register-step4-password.jsp").forward(request, response);
			System.out.println(verificationUser.getUsername());
		} else {
			request.setAttribute("verificationError", "Incorrect verification code. Please try again.");
			request.getRequestDispatcher("register-step3-validateEmail.jsp").forward(request, response);
		}

	}

	public void stepFourSubmitPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException, MessagingException {
		String password = request.getParameter("password");

		if (password != null) {
			String encodedPassword = BCrypt.withDefaults().hashToString(6, password.toCharArray());

			User verificationUser = (User) session.getAttribute("verificationUser");

			userDAO.registerNewUser(verificationUser.getFirst_name(), verificationUser.getLast_name(),
					verificationUser.getPhoneNumber(), verificationUser.getUsername(), verificationUser.getEmail(),
					encodedPassword);
			response.sendRedirect("login.jsp");
			System.out.println(encodedPassword);
			session.removeAttribute("verificationUser");
		} else {
			request.getRequestDispatcher("register-step4-password.jsp").forward(request, response);
		}

	}
	
	public void resendVerifyCode(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException, MessagingException {
	    
	    User verificationUser = (User) session.getAttribute("verificationUser");
	    
	    if (verificationUser != null) {
	    	
	         String newCode = userDAO.getRandom();
	         verificationUser.setCode(newCode);
	         
	         System.out.println("New verification code generated: " + newCode);
	        boolean isEmailSend = userDAO.sendEmail(verificationUser);
	        
	        if (isEmailSend) {
	            // Email sent successfully
	            response.sendRedirect("register-step3-validateEmail.jsp?resend=true");
	        } else {
	            // Failed to send email
	            request.setAttribute("emailError", "Failed to resend verification email. Please try again.");
	            request.getRequestDispatcher("register-step3-validateEmail.jsp").forward(request, response);
	        }
	    } else {
	        response.sendRedirect("register-step1-username.jsp");
	    }
	}
}
