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

		Connection connection = DBConnection.makeConnection();
		Statement stmt = connection.createStatement();
		
		String sqlQuery = "SELECT * FROM category ORDER BY priority;";
		ResultSet resultSet = stmt.executeQuery(sqlQuery);
		
		List<Category> list = new ArrayList<Category>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			int priority = resultSet.getInt("priority");
			Category category = new Category(id, name, priority);
			list.add(category);
		}
		return list;
	}
	
	public List<Product> getProductByCategoryId(String categoryId) throws SQLException {

		Connection connection = DBConnection.makeConnection();
		String sqlQuery = "SELECT * FROM product p " 
						+ "JOIN category c ON p.category_id = c.id " 
						+ "WHERE c.id = ?";

		PreparedStatement preStmt = connection.prepareStatement(sqlQuery);
		preStmt.setString(1, categoryId);
		
		ResultSet resultSet = preStmt.executeQuery();
		List<Product> list = new ArrayList<Product>();

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

	public List<Product> getLatestProductsByCategoryId(int categoryId) throws SQLException {
	    Connection connection = DBConnection.makeConnection();
	    String sqlQuery = "SELECT * FROM product WHERE category_id = ? AND is_new = 1";
	    
	    PreparedStatement preStmt = connection.prepareStatement(sqlQuery);
	    preStmt.setInt(1, categoryId);

	    ResultSet resultSet = preStmt.executeQuery();

	    List<Product> list = new ArrayList<>();

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
