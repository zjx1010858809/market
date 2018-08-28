package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Type;
import dao.Type_dao;
import service.Type_service;
import until.SearchInfo;

@Service
public class Type_serviceImpl implements Type_service{
	
	@Autowired
	Type_dao type_dao;

	public List<Type> select(SearchInfo searchInfo) {
		return type_dao.select(searchInfo);
	}

	public void delete(int id) {
		type_dao.delete(id);
		
	}

	public void update(Type type) {
		type_dao.update(type);
		
	}

	public void insert(Type type) {
		type_dao.insert(type);
		
	}

	public Type selectid(int id) {
		SearchInfo searchInfo = new SearchInfo();
		searchInfo.setWhere("where id ="+ id);
		return type_dao.select(searchInfo).get(0);
	}

}
