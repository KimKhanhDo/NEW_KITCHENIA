package entity;

import java.util.HashSet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Cart {
	
	private HashSet<ProductInCart> items;
	private double total;	
	private double tax;
	private double totalWithTax;
	
}
