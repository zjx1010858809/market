package service;

import java.util.List;
import Entity.Operator;
import until.SearchInfo;

public interface Operator_service {
	public List<Operator> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update(Operator operator);
	
	public void insert(Operator operator);
}
