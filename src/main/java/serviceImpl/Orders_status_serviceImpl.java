package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Orders_status;
import dao.Orders_status_dao;
import service.Order_status_service;
import until.SearchInfo;

@Service
public class Orders_status_serviceImpl implements Order_status_service{

	@Autowired
	Orders_status_dao orders_status_dao;
	
	public List<Orders_status> select(SearchInfo searchInfo) {
		return orders_status_dao.select(searchInfo);
	}

	public void delete(int id) {
		orders_status_dao.delete(id);
		
	}

	public void update(Orders_status orders_status) {
		orders_status_dao.update(orders_status);
		
	}

	public void insert(Orders_status orders_status) {
		orders_status_dao.insert(orders_status);
		
	}

}
