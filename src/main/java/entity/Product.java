package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Product {

	private int id;
	private String name;
	private String brand;
	private double price;
	private String image;
	private int quantity;
	private String description;
	private boolean is_new;

	public boolean getIs_new() {
		return is_new;
	}

	public void setIs_New(boolean is_new) {
		this.is_new = is_new;
	}

}