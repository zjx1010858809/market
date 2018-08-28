package Entity;

import java.io.Serializable;

public class Operator implements Serializable{
	private int id;
	private int sex;
	private int power=1;
	private int status;
	private String nike;
	private String password;
	private String name;
	private String tel;
	private String comments="";
	
	private String[] sexs = {"男" ,"女"};
	private String[] statuss = {"在职","离职"};
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getSexs() {
		return sexs[this.sex];
	}
	public String getStatuss() {
		return statuss[this.status];
	}
	public Operator() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Operator(int id, int sex, int power, int status, String nike, String password, String name, String tel,
			String comments) {
		super();
		this.id = id;
		this.sex = sex;
		this.power = power;
		this.status = status;
		this.nike = nike;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.comments = comments;
	}

}
