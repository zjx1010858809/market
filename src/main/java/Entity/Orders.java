package Entity;

public class Orders {
	private int id;
	private int user_id;
	private String date;
	private int status;
	private String code;
	private Double amount;
	private Double nowamount;
	private String comments;
	private int assessstatus;
	private int address_id;
	private String email;
	private String addr;
	
	private String[] statuss = {"未支付","已支付","已发货","已收货","已退货","取消"};
	private String[] assessstatuss = {"未评价","已评价"};
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}


	public Double getNowamount() {
		return nowamount;
	}


	public void setNowamount(Double nowamount) {
		this.nowamount = nowamount;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public int getAssessstatus() {
		return assessstatus;
	}


	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}


	public int getAddress_id() {
		return address_id;
	}


	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}


	public String getStatuss() {
		return statuss[status];
	}



	public String getAssessstatuss() {
		return assessstatuss[assessstatus];
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


}
