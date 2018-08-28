package service;

import java.util.List;
import Entity.Orders_status;
import until.SearchInfo;

public interface Order_status_service {
	public List<Orders_status> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update (Orders_status orders_status);
	
	public void insert (Orders_status orders_status);
}
