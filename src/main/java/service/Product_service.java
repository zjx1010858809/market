package service;

import java.util.List;
import Entity.Product;
import until.SearchInfo;

public interface Product_service {
	
	public List<Product> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update (Product product);
	
	public void insert (Product product);
}
