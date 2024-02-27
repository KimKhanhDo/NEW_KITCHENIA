package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

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

import dao.UserDAO;

/**
 * Servlet implementation class ResetPasswordController
 */
@WebServlet("/ResetPassword")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResetPasswordController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");

			switch (action) {
			case "FORGOT_PASSWORD": {
				forgotPassword(request, response);
				break;
			}
			case "VALIDATE_OTP": {
				validateOTP(request, response);
				break;
			}
			case "RESEND_OTP": {
	            resendOTP(request, response);
	            break;
	        }
			case "SET_NEW_PASSWORD": {
				setNewPassword(request, response);
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

	@SuppressWarnings("null")
	private void forgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		HttpSession mySession = request.getSession();

		 if (email != null && !email.isEmpty()) { // Corrected logical condition
		        int otpValue = new Random().nextInt(1255650);

		        mySession.setAttribute("otp", otpValue);
		        mySession.setAttribute("email", email);

		        try {
		            sendOTPEmail(email, otpValue);
		            request.setAttribute("message", "OTP is sent to your email id");
		        } catch (MessagingException e) {
		            e.printStackTrace();
		            request.setAttribute("message", "Failed to send OTP. Please try again.");
		        }

		        dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
		        dispatcher.forward(request, response);
		    }
	}

	private void validateOTP(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int value = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		int otp = (int) session.getAttribute("otp");

		RequestDispatcher dispatcher = null;

		if (value == otp) {

			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("new-password.jsp");
			dispatcher.forward(request, response);

		} else {
			request.setAttribute("message", "wrong otp");

			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private void resendOTP(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String email = (String) session.getAttribute("email");
	    RequestDispatcher dispatcher = null;

	    if (email != null && !email.isEmpty()) {
	        int otp = new Random().nextInt(1255650);
	        session.setAttribute("otp", otp);

	        try {
	            sendOTPEmail(email, otp);
	            request.setAttribute("message", "A new OTP has been sent to your email.");
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            request.setAttribute("message", "Error resending OTP. Please try again.");
	        }

	        dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        dispatcher = request.getRequestDispatcher("errorPage.jsp");
	        request.setAttribute("message", "Email not found in session. Please initiate the process again.");
	        dispatcher.forward(request, response);
	    }
	}

	private void sendOTPEmail(String email, int otp) throws MessagingException {
	    final String user = "javaIsFun12@gmail.com"; // Your email
	    final String password = "qxfv thym qgva pxvt"; // Your password

	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(user, password);
	        }
	    });

	    MimeMessage message = new MimeMessage(session);
	    message.setFrom(new InternetAddress(user)); // Sender email
	    message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // Recipient email
	    message.setSubject("OTP Verification");
	    message.setText("Your OTP is: " + otp);

	    Transport.send(message);
	    System.out.println("OTP email sent successfully to " + email);
	}

	private void setNewPassword(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;

		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
			try {
				// Create an instance of UserDAO
				UserDAO userDAO = new UserDAO();

				// Call the updatePassword method from UserDAO
				userDAO.updatePassword(newPassword, (String) session.getAttribute("email"));

				// Password updated successfully
				request.setAttribute("status", "Password Successfully Reset");
				dispatcher = request.getRequestDispatcher("login.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				// Password update failed
				request.setAttribute("status", "Reset Failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}

			dispatcher.forward(request, response);
		}

	}

}
