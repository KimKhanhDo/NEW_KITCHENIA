package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor

public class User {

	private int id;
	private String first_name;
	private String last_name;
	private String username;
	private String phoneNumber;
	private String email;
	private String password;	
	private int failedCount;
	private String code;
	
	public User(String first_name, String last_name, String username, String phoneNumber, String email, String code) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.username = username;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.code = code;
	}
	
	
}