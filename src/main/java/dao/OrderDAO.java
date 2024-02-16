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
		ResultSet rs = preStmt.getGeneratedKeys();
		try {

			connection.setAutoCommit(false);

			String SQL_INSERT_ORDER = "INSERT INTO `order` (userId) VALUES (?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);

			preStmt.setInt(1, order.getUserId());

			preStmt.executeUpdate();
			int key = 0;

			if (rs.next()) {
				key = (int) rs.getInt(1);
			}

			String SQL_INSERT_ORDER_DETAIL = "INSERT INTO `order_detail` (orderId, productId, price, quantity) VALUES (?, ?, ?, ?);";
			preStmt = connection.prepareStatement(SQL_INSERT_ORDER_DETAIL);

			for (OrderDetails orderDetail : orderDetailList) {
				preStmt.setInt(1, key);
				preStmt.setInt(2, orderDetail.getProductId());
				preStmt.setDouble(3, orderDetail.getPrice());
				preStmt.setInt(4, orderDetail.getQuantity());

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


}
