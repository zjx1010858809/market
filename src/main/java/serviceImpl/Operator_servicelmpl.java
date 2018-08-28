package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Operator;
import dao.Operator_dao;
import service.Operator_service;
import until.SearchInfo;

@Service
public class Operator_servicelmpl implements Operator_service{

	@Autowired
	Operator_dao operator_dao;
	
	public List<Operator> select(SearchInfo searchInfo) {
		
		return operator_dao.select(searchInfo);
	}

	public void delete(int id) {
		operator_dao.delete(id);
		
	}

	public void update(Operator operator) {
		operator_dao.update(operator);
		
	}

	public void insert(Operator operator) {
		operator_dao.insert(operator);
		
	}

}
