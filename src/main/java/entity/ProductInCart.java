package entity;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProductInCart {
	private int id;
	private String name;
	private String image;
	private double price;
	private double subTotal;
	private int quantity;
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		   ProductInCart product = (ProductInCart) obj;
		return id == product.getId();
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	
}
