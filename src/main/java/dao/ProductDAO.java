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

		try {
			connection = DBConnection.makeConnection();
			stmt = connection.createStatement();

			String sqlQuery = "SELECT * FROM product WHERE is_new = 1";
			resultSet = stmt.executeQuery(sqlQuery);

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
			if (stmt != null) {
				stmt.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public List<Product> getAllProducts() throws SQLException {

		Connection connection = null;
	    Statement stmt = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBConnection.makeConnection();
	        String SQL = "SELECT * FROM product;";
	        stmt = connection.createStatement();
	        resultSet = stmt.executeQuery(SQL);

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
	}
	finally {
       
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

	public static List<Product> getProductBySearch(String productName) throws SQLException {
		 Connection connection = null;
		    PreparedStatement preStmt = null;
		    ResultSet resultSet = null;

		    try {
		        connection = DBConnection.makeConnection();
		        String sqlQuery = "SELECT * FROM product WHERE name LIKE ?";
		        preStmt = connection.prepareStatement(sqlQuery);
		        preStmt.setString(1, "%" + productName + "%");
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
