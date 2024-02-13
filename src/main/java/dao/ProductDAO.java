package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Product;
import sql.connection.DBConnection;

public class ProductDAO {
	
	public List<Product> getLastestProducts() throws SQLException {
		Connection connection = null;
		Statement stmt = null;
		ResultSet resultSet = null;
		List<Product> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			stmt = connection.createStatement();

			String sqlQuery = "SELECT * FROM product WHERE is_new = 1";
			resultSet = stmt.executeQuery(sqlQuery);

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
			if (stmt != null) {
				stmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return list;
	}

	public List<Product> getAllProducts() throws SQLException {

		Connection connection = null;
		Statement stmt = null;
		ResultSet resultSet = null;
		List<Product> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			String SQL = "SELECT * FROM product;";
			stmt = connection.createStatement();
			resultSet = stmt.executeQuery(SQL);

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
			if (stmt != null) {
				stmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return list;
	}

	public static Product getProductById(String productId) throws SQLException {

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product WHERE id =?";
			stmt = connection.prepareStatement(sqlQuery);
			stmt.setString(1, productId);
			resultSet = stmt.executeQuery();

			if (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String brand = resultSet.getString("brand");
				double price = resultSet.getDouble("price");
				String image = resultSet.getString("image");
				int quantity = resultSet.getInt("quantity");
				String description = resultSet.getString("description");
				boolean is_new = resultSet.getBoolean("is_new");

				Product product = new Product(id, name, brand, price, image, quantity, description, is_new);

				return product;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static List<Product> getProductBySearch(String productName) throws SQLException {
		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet resultSet = null;
		List<Product> list = new ArrayList<>();

		try {
			connection = DBConnection.makeConnection();
			String sqlQuery = "SELECT * FROM product WHERE name LIKE ?";
			preStmt = connection.prepareStatement(sqlQuery);
			preStmt.setString(1, "%" + productName + "%");
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
	
	public static int getTotalPage() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			ps = conn.prepareStatement("SELECT COUNT(*) as total_product FROM product;");

			rs = ps.executeQuery();

			if (rs.next()) {
				int totalProduct = rs.getInt("total_product");
				return (int) Math.ceil((double) totalProduct / 9);
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

	public List<Product> getProductsByPage(int page) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DBConnection.makeConnection();
			ps = conn.prepareStatement("SELECT * FROM product LIMIT ?, ?;");
			ps.setInt(1, (page - 1) * 9);
			ps.setInt(2, 9);

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
