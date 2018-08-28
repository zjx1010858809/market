package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Product;
import dao.Product_dao;
import service.Product_service;
import until.SearchInfo;

@Service
public class Product_serviceImpl implements Product_service{
	
	@Autowired
	Product_dao product_dao;

	public List<Product> select(SearchInfo searchInfo) {
		// TODO Auto-generated method stub
		return product_dao.select(searchInfo);
	}

	public void delete(int id) {
		product_dao.delete(id);
		
	}

	public void update(Product product) {
		product_dao.update(product);
		
	}

	public void insert(Product product) {
		product_dao.insert(product);
		
	}

}
