package Entity;

import java.io.Serializable;

public class User implements Serializable{
	
	private int id;
	private String email;
	private String password;
	private String tel;
	private int level;
	private double amount;
	private int status;
	private String comments;
	 
	private String[] levels = {"青铜","白银","黄金","铂金","钻石","大师","王者"};
	private String[] statuss= {"正常","封号"};
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getLevels() {
		return levels[level];
	}

	public String getStatuss() {
		return statuss[status];
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}
