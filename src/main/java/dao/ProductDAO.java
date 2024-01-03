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

	public List<Product> getAllProducts() throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String SQL = "SELECT * FROM product;";

		Statement stmt = connection.createStatement();
		ResultSet resultSet = stmt.executeQuery(SQL);

		ArrayList<Product> list = new ArrayList<Product>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			double price = resultSet.getDouble("price");
			String image = resultSet.getString("image");
			int quantity = resultSet.getInt("quantity");
			String description = resultSet.getString("description");

			Product product = new Product(id, name, brand, price, image, quantity, description);
			list.add(product);
		}
		return list;
	}

	public static Product getProductById(String productId) throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String sqlQuery = "SELECT * FROM product WHERE id =?";

		PreparedStatement stmt = connection.prepareStatement(sqlQuery);
		stmt.setString(1, productId);
		ResultSet resultSet = stmt.executeQuery();

		if (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			double price = resultSet.getDouble("price");
			String image = resultSet.getString("image");
			int quantity = resultSet.getInt("quantity");
			String description = resultSet.getString("description");

			Product product = new Product(id, name, brand, price, image, quantity, description);

			return product;
		}
		return null;
	}

	public static List<Product> getProductByCategory(String ProductCategory) throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String sqlQuery = "SELECT * FROM product WHERE category = ?";

		PreparedStatement stmt = connection.prepareStatement(sqlQuery);
		stmt.setString(1, ProductCategory);

		ResultSet resultSet = stmt.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			double price = resultSet.getDouble("price");
			String image = resultSet.getString("image");
			int quantity = resultSet.getInt("quantity");
			String description = resultSet.getString("description");

			Product product = new Product(id, name, brand, price, image, quantity, description);
			list.add(product);
		}
		return list;
	}
}
