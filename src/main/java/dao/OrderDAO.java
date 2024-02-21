package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Order;
import entity.OrderDetails;
import sql.connection.DBConnection;

public class OrderDAO {

	public boolean addOrder(Order order, ArrayList<OrderDetails> orderDetailList) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		PreparedStatement preStmt = null;
		ResultSet rs = null;

		try {
			connection.setAutoCommit(false);

			String SQL_INSERT_ORDER = "INSERT INTO `order` (userId) VALUES (?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);

			preStmt.setInt(1, order.getUserId());

			preStmt.executeUpdate();
			rs = preStmt.getGeneratedKeys();

			int key = 0;

			if (rs.next()) {
				key = (int) rs.getInt(1);
			}

			String SQL_INSERT_ORDER_DETAIL = "INSERT INTO `order_detail` (orderId, productId, image, price, quantity) VALUES (?, ?, ?, ?, ?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER_DETAIL);

			for (OrderDetails orderDetails : orderDetailList) {
				preStmt.setInt(1, key);
				preStmt.setInt(2, orderDetails.getProductId());
				preStmt.setString(3, orderDetails.getImage());
				preStmt.setDouble(4, orderDetails.getPrice());
				preStmt.setInt(5, orderDetails.getQuantity());

				preStmt.executeUpdate();
			}
			// COMMIT HERE
			connection.commit();

		} catch (Exception e) {
			// ROLLBACK
			connection.rollback();
			return false;

		} finally {
			rs.close();
			preStmt.close();
			connection.close();
		}

		return true;
	}

	public int getOrderId(int userId, Date submitDate) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		String sql = "SELECT * FROM `order` WHERE userId = ? and submitDate = ?";

		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setInt(1, userId);
		preStmt.setDate(2, (java.sql.Date) submitDate);

		ResultSet resultSet = preStmt.executeQuery();

		if (resultSet.next()) {
			Order order = new Order();
			order.setId(resultSet.getInt("id"));
			order.setUserId(resultSet.getInt("userId"));
			order.setSubmitDate(resultSet.getDate("submitDate"));

			return order.getId();
		}
		return 0;

	}

	public void addOrderDetail(OrderDetails orderDetail) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		PreparedStatement preStmt = null;

		String SQL = "INSERT INTO `order_detail` (orderId, productId, price, quantity) VALUES (?, ?, ?, ?);";
		preStmt = connection.prepareStatement(SQL);

		preStmt.setInt(1, orderDetail.getOrderId());
		preStmt.setInt(2, orderDetail.getProductId());
		preStmt.setDouble(3, orderDetail.getPrice());
		preStmt.setInt(4, orderDetail.getQuantity());

		preStmt.executeUpdate();

	}

	public List<OrderDetails> getAllOrder(int userId) throws SQLException {
		Connection connection = DBConnection.makeConnection();

		String SQL = "SELECT * FROM `order` o JOIN order_detail od ON o.id = od.orderId WHERE userid = ?;";
		PreparedStatement preStmt = connection.prepareStatement(SQL);

		preStmt.setInt(1, userId);

		ResultSet resultSet = preStmt.executeQuery();

		ArrayList<OrderDetails> list = new ArrayList<OrderDetails>();

		while (resultSet.next()) {
			OrderDetails orderDetail = new OrderDetails();
			orderDetail.setId(resultSet.getInt("id"));
			orderDetail.setOrderId(resultSet.getInt("orderId"));
			orderDetail.setProductId(resultSet.getInt("productId"));
			orderDetail.setPrice(resultSet.getDouble("price"));
			orderDetail.setQuantity(resultSet.getInt("quantity"));

			list.add(orderDetail);
		}

		return list;
	}

	// Functions for checkOutController
	public int addOrder2(Order order, ArrayList<OrderDetails> orderDetailList) throws SQLException {
		Connection connection = DBConnection.makeConnection();
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		int key = 0;

		try {
			connection.setAutoCommit(false);

			String SQL_INSERT_ORDER = "INSERT INTO `order` (`userId`, `totalPrice`, `firstName`, `lastName`, `address`, `suburb`, `state`, `postcode`, `phone`, `email`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);

			preStmt.setInt(1, order.getUserId());
			preStmt.setDouble(2, order.getTotalPrice());
			preStmt.setString(3, order.getFirstName());
			preStmt.setString(4, order.getLastName());
			preStmt.setString(5, order.getAddress());
			preStmt.setString(6, order.getSuburb());
			preStmt.setString(7, order.getState());
			preStmt.setString(8, order.getPostcode());
			preStmt.setString(9, order.getPhone());
			preStmt.setString(10, order.getEmail());

			preStmt.executeUpdate();
			rs = preStmt.getGeneratedKeys();

			if (rs.next()) {
				key = (int) rs.getInt(1);
			}

			String SQL_INSERT_ORDER_DETAIL = "INSERT INTO `order_detail` (orderId, productId, price, quantity) VALUES (?, ?, ?, ?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER_DETAIL);

			for (OrderDetails orderDetails : orderDetailList) {
				preStmt.setInt(1, key);
				preStmt.setInt(2, orderDetails.getProductId());
				preStmt.setDouble(3, orderDetails.getPrice());
				preStmt.setInt(4, orderDetails.getQuantity());

				preStmt.executeUpdate();
			}
			// COMMIT HERE
			connection.commit();

		} catch (Exception e) {
			// ROLLBACK
			connection.rollback();
			return -1;

		} finally {
			rs.close();
			preStmt.close();
			connection.close();
		}

		return key;
	}

	public List<Order> getOrdersByUserId(int userId) throws SQLException {

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;
		List<Order> list = new ArrayList<Order>();
		try {
			connection = DBConnection.makeConnection();

			preStmt = connection.prepareStatement("SELECT * FROM `order` where userId = ?");
			preStmt.setInt(1, userId);

			resultSet = preStmt.executeQuery();
			while (resultSet.next()) {
				int orderId = resultSet.getInt("id");
				Date orderDate = resultSet.getDate("submitDate");
				double totalPrice = resultSet.getDouble("totalPrice");
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");

				String address = resultSet.getString("address");
				String suburb = resultSet.getString("suburb");
				String state = resultSet.getString("state");
				String postcode = resultSet.getString("postcode");
				String phone = resultSet.getString("phone");
				String email = resultSet.getString("email");

				Order order = new Order(orderId, userId, orderDate, totalPrice, firstName, lastName, address, suburb,
						state, postcode, postcode, phone, email);
				list.add(order);

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (resultSet != null) {
				resultSet.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return list;
	}

	public List<OrderDetails> getOrderDetailById(int orderId) throws SQLException {
		Connection connection = DBConnection.makeConnection();

		String SQL = "SELECT od.id, od.orderId, od.productId, od.price, od.quantity, p.name, p.image " +
                "FROM order_detail od " +
                "JOIN product p ON od.productId = p.id " +
                "WHERE od.orderId = ?;";
		PreparedStatement preStmt = connection.prepareStatement(SQL);

		preStmt.setInt(1, orderId);

		ResultSet resultSet = preStmt.executeQuery();

		ArrayList<OrderDetails> list = new ArrayList<OrderDetails>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			int productId = resultSet.getInt("productId");
			String image = resultSet.getString("image");
			String name = resultSet.getString("name");
			double price = resultSet.getDouble("price");
			int quantity = resultSet.getInt("quantity");

			OrderDetails orderDetail = new OrderDetails(id, orderId, productId, image, name, price, quantity);
			list.add(orderDetail);
		}
		return list;
	}

}
