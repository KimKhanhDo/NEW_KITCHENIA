package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Category;
import entity.Product;
import sql.connection.DBConnection;

public class CategoryDAO {

	public List<Category> showCategories() throws SQLException {
		Connection connection = null;
		Statement stmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			stmt = connection.createStatement();

			String sqlQuery = "SELECT * FROM category ORDER BY priority;";
			resultSet = stmt.executeQuery(sqlQuery);

			List<Category> list = new ArrayList<>();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				int priority = resultSet.getInt("priority");
				Category category = new Category(id, name, priority);
				list.add(category);
			}
			return list;
		} finally {
			if (resultSet != null) {
				resultSet.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public List<Product> getProductByCategoryId(String categoryId) throws SQLException {

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product p " + "JOIN category c ON p.category_id = c.id "
					+ "WHERE c.id = ?";

			preStmt = connection.prepareStatement(sqlQuery);
			preStmt.setString(1, categoryId);

			resultSet = preStmt.executeQuery();
			List<Product> list = new ArrayList<>();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String brand = resultSet.getString("brand");
				double price = resultSet.getDouble("price");
				String image = resultSet.getString("image");
				int quantity = resultSet.getInt("quantity");
				String description = resultSet.getString("description");
				boolean is_new = resultSet.getBoolean("is_new");

				Product product = new Product(id, name, brand, price, image, quantity, description, is_new);
				list.add(product);
			}
			return list;

		} finally {
			if (resultSet != null) {
				resultSet.close();
			}
			if (preStmt != null) {
				preStmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public List<Product> getLatestProductsByCategoryId(int categoryId) throws SQLException {

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product WHERE category_id = ? AND is_new = 1";

			preStmt = connection.prepareStatement(sqlQuery);
			preStmt.setInt(1, categoryId);

			resultSet = preStmt.executeQuery();
			List<Product> list = new ArrayList<>();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String brand = resultSet.getString("brand");
				double price = resultSet.getDouble("price");
				String image = resultSet.getString("image");
				int quantity = resultSet.getInt("quantity");
				String description = resultSet.getString("description");
				boolean is_new = resultSet.getBoolean("is_new");

				Product product = new Product(id, name, brand, price, image, quantity, description, is_new);
				list.add(product);
			}
			return list;

		} finally {
			if (resultSet != null) {
				resultSet.close();
			}
			if (preStmt != null) {
				preStmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}
}
