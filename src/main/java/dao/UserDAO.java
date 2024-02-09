package dao; //data access object

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Verifyer;
import entity.User;
import sql.connection.DBConnection;

public class UserDAO {
	public boolean doLogin(String email, String password) throws SQLException {

		Connection connection = DBConnection.makeConnection();

		String sql = "SELECT * FROM user WHERE email = ?";

		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);

		ResultSet resultSet = preStmt.executeQuery();

		if (!resultSet.next()) {
			return false;
		}

		User user = new User();
		user.setId(resultSet.getInt("id"));	
		user.setPassword(resultSet.getString("password"));
		user.setEmail(resultSet.getString("email"));
		user.setFailedCount(resultSet.getInt("failedCount"));

		if (!verifyPassword(password, user.getPassword())) {
			updateFailedCount(user.getEmail());
			return false;
		}

		if (user.getFailedCount() >= 4) {

			return false;
		}

		return true;
	}

	public static boolean verifyPassword(String inputPassword, String hashedPassword) {
		Verifyer verifier = BCrypt.verifyer();
		BCrypt.Result result = verifier.verify(inputPassword.toCharArray(), hashedPassword);

		return result.verified;
	}

	public void updateFailedCount(String email) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		String sql = "UPDATE user SET `failedCount` = failedCount + 1 WHERE email = ?";

		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);

		preStmt.executeUpdate();

	}

	public User findUser(String email) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		String sql = "SELECT * FROM user WHERE email = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);
		ResultSet resultSet = preStmt.executeQuery();

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

	}

	public void registerNewUser(String first_name, String last_name, String phoneNo, String username, String email, String password)
			throws SQLException {
		Connection connection = DBConnection.makeConnection();
		PreparedStatement preStmt = null;

		String SQL = "INSERT INTO user (first_name, last_name, phoneNo, username, email, password) VALUES (?,?,?,?,?,?);";
		preStmt = connection.prepareStatement(SQL);
		

		preStmt.setString(1, first_name);
		preStmt.setString(2, last_name);
		preStmt.setString(3, phoneNo);
		preStmt.setString(4, username);
		preStmt.setString(5, email);
		preStmt.setString(6, password);
		
		preStmt.executeUpdate();

	}

	public boolean isUsernameRegistered(String username) throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String sql = "SELECT COUNT(*) FROM user WHERE username = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);

		preStmt.setString(1, username);
		ResultSet resultSet = preStmt.executeQuery();

		if (resultSet.next()) {
			int count = resultSet.getInt(1);
			return count > 0;
		}
		return false;
	}
	
	public boolean isEmailRegistered(String email) throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);

		preStmt.setString(1, email
				);
		ResultSet resultSet = preStmt.executeQuery();

		if (resultSet.next()) {
			int count = resultSet.getInt(1);
			return count > 0;
		}
		return false;
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
	    
	    
	    
		//get session from mail api
		Session mailSession = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, appPassword);
			}
					
		});
		
		//set up the message 
		MimeMessage mess = new MimeMessage(mailSession);
		
		mess.setFrom(new InternetAddress(fromEmail));
		mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		
		mess.setSubject("User Email Verification");
		mess.setText("Registration successfully. Please verify your account using this code: " + user.getCode());
		
		
		//send email
		Transport.send(mess);
		test = true;
		System.out.println("message sent successfully");
		return test;
	}
}
