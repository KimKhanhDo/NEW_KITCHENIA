package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class OrderDetails {
	private int id;
	private int orderId;
	private int productId;
	private String image;
	private String name;
	private double price;
	private int quantity;
	
	public OrderDetails(int productId, String image, String name, double price, int quantity) {
		super();
		this.productId = productId;
		this.image = image;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	

	
	
}