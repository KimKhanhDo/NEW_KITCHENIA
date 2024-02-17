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
		List<Category> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			stmt = connection.createStatement();

			String sqlQuery = "SELECT * FROM category ORDER BY priority;";
			resultSet = stmt.executeQuery(sqlQuery);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				int priority = resultSet.getInt("priority");
				Category category = new Category(id, name, priority);
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		return list;
	}

	public List<Product> getProductByCategoryId(String categoryId) throws SQLException {

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;
		List<Product> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product p " + "JOIN category c ON p.category_id = c.id "
					+ "WHERE c.id = ?";

			preStmt = connection.prepareStatement(sqlQuery);
			preStmt.setString(1, categoryId);

			resultSet = preStmt.executeQuery();

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
		} catch (Exception e) {
			e.printStackTrace();

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
		return list;
	}

	public List<Product> getLatestProductsByCategoryId(int categoryId) throws SQLException {

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;
		List<Product> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product WHERE category_id = ? AND is_new = 1";

			preStmt = connection.prepareStatement(sqlQuery);
			preStmt.setInt(1, categoryId);

			resultSet = preStmt.executeQuery();

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
		} catch (Exception e) {
			e.printStackTrace();
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
		return list;
	}
	

	public static int getTotalPageByCategory(String categoryId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			 ps = conn.prepareStatement("SELECT COUNT(*) as total_product FROM product p "
                     + "JOIN category c ON p.category_id = c.id "
                     + "WHERE c.id = ?;");
			 
			 ps.setInt(1, Integer.parseInt(categoryId));

			rs = ps.executeQuery();

			if (rs.next()) {
				int totalProduct = rs.getInt("total_product");
				return (int) Math.ceil((double) totalProduct / 6);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return 0;
	}
	
	public List<Product> pagingProductByCategoryId(String categoryId, int page) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try {
			conn = DBConnection.makeConnection();
			ps = conn.prepareStatement("SELECT * FROM product p JOIN category c ON p.category_id = c.id WHERE c.id = ? LIMIT ?, ?;");
			ps.setInt(1, Integer.parseInt(categoryId));
			ps.setInt(2, (page - 1) * 6);
			ps.setInt(3, 6);

			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String brand = rs.getString("brand");
				double price = rs.getDouble("price");
				String image = rs.getString("image");
				int quantity = rs.getInt("quantity");
				String description = rs.getString("description");
				boolean is_new = rs.getBoolean("is_new");

				Product product = new Product(id, name, brand, price, image, quantity, description, is_new);
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}

}
