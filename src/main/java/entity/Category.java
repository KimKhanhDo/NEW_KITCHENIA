package entity;

public class Category {

	private int id;
	private String name;
	private int priority;

	public Category(int id, String name, int priority) {
		super();
		this.id = id;
		this.name = name;
		this.priority = priority;
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

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

}
