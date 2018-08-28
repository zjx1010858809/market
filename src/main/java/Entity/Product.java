package Entity;

import java.io.Serializable;
import java.util.Arrays;

public class Product implements Serializable{
	private int id;
	private String fullname;
	private int type_id;
	private String activity;
	private String tip;
	private String sale;
	private String info;
	private Double price;
	private Double nowprice;
	private int salecount=0;
	private int collectcount=0;
	private int priority;
	private int status;
	private String pics="";
	private String comments ="";
	
	private String[] statuss= {"有货","无货"};
	private String type_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getNowprice() {
		return nowprice;
	}
	public void setNowprice(Double nowprice) {
		this.nowprice = nowprice;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getCollectcount() {
		return collectcount;
	}
	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getStatuss() {
		return statuss[status];
	}
	
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String[] getPiclist() {
		if(pics.length()<5)return new String[0];
		return pics.split(",");
	}
	public String getPic() {
		if(pics.length()<5) return null;
		String [] pic=pics.split(",");
		
		if(pic.length>0)
		return pic[0];
		else return null;
	}
	public Product(String fullname, int type_id, String activity, String tip, String sale, String info, Double price,
			Double nowprice, int salecount, int collectcount, int priority, int status, String pics, String comments) {
		super();
		this.fullname = fullname;
		this.type_id = type_id;
		this.activity = activity;
		this.tip = tip;
		this.sale = sale;
		this.info = info;
		this.price = price;
		this.nowprice = nowprice;
		this.salecount = salecount;
		this.collectcount = collectcount;
		this.priority = priority;
		this.status = status;
		this.pics = pics;
		this.comments = comments;
	}
	
	
	
	 
}
