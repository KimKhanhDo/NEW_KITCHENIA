package entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor

public class Order {
	private int id;
	private int userId;
	private Date submitDate;
	private double totalPrice;
	
	private String firstName;
	private String lastName;
	private String address;
	private String suburb;
	private String state;
	private String postcode;
	private String paymentMethod;
	private String phone;
	private String email;
	
	public Order(int userId, double totalPrice, String firstName, String lastName, String address, String suburb,
			String state, String postcode, String paymentMethod, String phone, String email) {
		super();
		this.userId = userId;
		this.totalPrice = totalPrice;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.suburb = suburb;
		this.state = state;
		this.postcode = postcode;
		this.paymentMethod = paymentMethod;
		this.phone = phone;
		this.email = email;
	}

	public Order(int userId) {
		super();
		this.userId = userId;
	}


}
