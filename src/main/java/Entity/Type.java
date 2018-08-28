package Entity;

import java.io.Serializable;
import java.util.ArrayList;

public class Type implements Serializable{
	private int id;
	private String name;
	private int parentid;
	private ArrayList<Type> children; 
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
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	
	public ArrayList<Type> getChildren() {
		return children;
	}
	public void setChildren(ArrayList<Type> children) {
		this.children = children;
	}
	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Type(int id, String name, int parentid) {
		super();
		this.id = id;
		this.name = name;
		this.parentid = parentid;
	}
	
	
}
