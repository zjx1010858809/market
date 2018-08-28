package Entity;

import java.io.Serializable;

public class Orders_status implements Serializable{
	
	private int id;
	private int orders_id;
	private String date;
	private int dest_status;
	private String info;
	private Double amount;
	private int num;
	private String comments;
	
	private String[] statuss = {"未支付","已支付","已发货","已收货","已退货","取消"};
	
	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public int getOrders_id() {
		return orders_id;
	}




	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}




	public String getDate() {
		return date;
	}




	public void setDate(String date) {
		this.date = date;
	}




	public int getDest_status() {
		return dest_status;
	}




	public void setDest_status(int dest_status) {
		this.dest_status = dest_status;
	}




	public String getInfo() {
		return info;
	}




	public void setInfo(String info) {
		this.info = info;
	}




	public Double getAmount() {
		return amount;
	}




	public void setAmount(Double amount) {
		this.amount = amount;
	}




	public Integer getNum() {
		return num;
	}




	public void setNum(Integer num) {
		this.num = num;
	}




	public String getComments() {
		return comments;
	}




	public void setComments(String comments) {
		this.comments = comments;
	}




	public String getStatuss() {
		return statuss[dest_status];
	}






	public Orders_status() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	
}
