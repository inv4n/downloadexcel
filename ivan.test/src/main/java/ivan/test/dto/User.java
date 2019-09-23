package ivan.test.dto;

public class User {
	private Integer id;
	private String user;
	private String password;
	public User(Integer id, String user, String password) {
		super();
		this.id = id;
		this.user = user;
		password = password;
	}
	public User() {
		
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", user=" + user + ", Password=" + password + "]";
	}
	

}
