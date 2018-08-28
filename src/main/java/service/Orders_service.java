package service;

import java.util.List;

import Entity.Orders;
import until.SearchInfo;

public interface Orders_service {
	public List<Orders> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update (Orders orders);
	
	public void insert (Orders orders);
}
