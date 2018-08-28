package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Orders;
import dao.Order_dao;
import service.Orders_service;
import until.SearchInfo;

@Service
public class Orders_serviceImpl implements Orders_service{

	@Autowired
	Order_dao order_dao;
	
	public List<Orders> select(SearchInfo searchInfo) {
		
		return order_dao.select(searchInfo);
	}

	public void delete(int id) {
		order_dao.delete(id);
		
	}

	public void update(Orders orders) {
		order_dao.update(orders);
		
	}

	public void insert(Orders orders) {
		order_dao.insert(orders);
		
	}

}
