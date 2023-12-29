package entity;

public class Product {
	
	private int id;
	private String name;
	private String brand;
	private double price;
	private String image;
	private String category;
	private int quantity;
	private String description;
	
	
	public Product() {
		super();
	}


	public Product(int id, String name, String brand, double price, String image, String category, int quantity,
			String description) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.image = image;
		this.category = category;
		this.quantity = quantity;
		this.description = description;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	public double getPrice() {
		return price;
	}


	public void setPriceCents(double price) {
		this.price = price;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


}