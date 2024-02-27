package dao; //data access object

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Verifyer;
import entity.User;
import sql.connection.DBConnection;

public class UserDAO {

	private void closeResources(ResultSet resultSet, PreparedStatement preStmt, Connection connection) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			if (preStmt != null) {
				preStmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
	}

	public boolean doLogin(String email, String password) {
		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sql = "SELECT * FROM user WHERE email = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, email);
			resultSet = preStmt.executeQuery();

			if (!resultSet.next()) {
				return false;
			}

			User user = new User();
			user.setId(resultSet.getInt("id"));
			user.setPassword(resultSet.getString("password"));
			user.setEmail(resultSet.getString("email"));
			user.setFailedCount(resultSet.getInt("failedCount"));

			if (!password.equals(user.getPassword())) {
				updateFailedCount(user.getEmail());
				return false;
			}

			if (user.getFailedCount() >= 4) {
				return false;
			}

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeResources(resultSet, preStmt, connection);
		}
	}

//	public static boolean verifyPassword(String inputPassword, String hashedPassword) {
//		Verifyer verifier = BCrypt.verifyer();
//		BCrypt.Result result = null;
//
//		try {
//			result = verifier.verify(inputPassword.toCharArray(), hashedPassword);
//			return result.verified;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		}
//	}

	public void updateFailedCount(String email) {
		Connection connection = null;
		PreparedStatement preStmt = null;

		try {
			connection = DBConnection.makeConnection();
			String sql = "UPDATE user SET `failedCount` = failedCount + 1 WHERE email = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, email);
			preStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResources(null, preStmt, connection);
		}
	}

	public User findUser(String email) {
		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sql = "SELECT * FROM user WHERE email = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, email);
			resultSet = preStmt.executeQuery();

			if (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFirst_name(resultSet.getString("first_name"));
				user.setLast_name(resultSet.getString("last_name"));
				user.setPhoneNumber(resultSet.getString("phoneNo"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setEmail(resultSet.getString("email"));
				user.setFailedCount(resultSet.getInt("failedCount"));

				return user;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			closeResources(resultSet, preStmt, connection);
		}
	}

	public void registerNewUser(String first_name, String last_name, String phoneNo, String username, String email,
			String password) {
		Connection connection = null;
		PreparedStatement preStmt = null;

		try {
			connection = DBConnection.makeConnection();
			String SQL = "INSERT INTO user (first_name, last_name, phoneNo, username, email, password) VALUES (?,?,?,?,?,?);";
			preStmt = connection.prepareStatement(SQL);

			preStmt.setString(1, first_name);
			preStmt.setString(2, last_name);
			preStmt.setString(3, phoneNo);
			preStmt.setString(4, username);
			preStmt.setString(5, email);
			preStmt.setString(6, password);

			preStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResources(null, preStmt, connection);
		}
	}

	public boolean isUsernameRegistered(String username) {
		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sql = "SELECT COUNT(*) FROM user WHERE username = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, username);
			resultSet = preStmt.executeQuery();

			if (resultSet.next()) {
				int count = resultSet.getInt(1);
				return count > 0;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeResources(resultSet, preStmt, connection);
		}
	}

	public boolean isEmailRegistered(String email) {
		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, email);
			resultSet = preStmt.executeQuery();

			if (resultSet.next()) {
				int count = resultSet.getInt(1);
				return count > 0;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeResources(resultSet, preStmt, connection);
		}
	}

	public boolean validateEmailPattern(String email) {
		if (email == null) {
			return false;
		}

		String regexPattern = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
				+ "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";

		return Pattern.compile(regexPattern).matcher(email).matches();
	}

	public String getRandom() {
		Random random = new Random();
		int number = random.nextInt(999999);
		return String.format("%06d", number);

	}

	public boolean sendEmail(User user) throws MessagingException {
		boolean test = false;

		String toEmail = user.getEmail();
		String fromEmail = "javaIsFun12@gmail.com";
		String appPassword = "qxfv thym qgva pxvt";

		// setup properties for email provider
		Properties pr = new Properties();
		pr.setProperty("mail.smtp.host", "smtp.gmail.com");
		pr.setProperty("mail.smtp.socketFactory.port", "465");
		pr.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		pr.setProperty("mail.smtp.auth", "true");
		pr.setProperty("mail.smtp.port", "465"); // Set port to 465 for SSL

		// get session from mail api
		Session mailSession = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, appPassword);
			}

		});

		try {
			// set up the message
			MimeMessage mess = new MimeMessage(mailSession);

			mess.setFrom(new InternetAddress(fromEmail));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

			mess.setSubject("User Email Verification");
			mess.setText("Registration successfully. Please verify your account using this code: " + user.getCode());

			// send email
			Transport.send(mess);
			test = true;
			System.out.println("message sent successfully");
		} catch (MessagingException e) {
			// Handle MessagingException (e.g., log or throw a custom exception)
			e.printStackTrace();
		}

		return test;
	}

	public void updatePassword(String newPassword, String email) {
		try {
			Connection connection = DBConnection.makeConnection();
			String query = "UPDATE user SET password = ? WHERE email = ?";
		
			try (PreparedStatement pst = connection.prepareStatement(query)) {
				pst.setString(1, newPassword);
				pst.setString(2, email);

				pst.executeUpdate();

				// Check on console
				System.out.println("Password updated successfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
