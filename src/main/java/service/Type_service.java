package service;

import java.util.List;

import Entity.Type;
import until.SearchInfo;

public interface Type_service {
	public List<Type> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update(Type type);
	
	public void insert(Type type);
	
	public Type selectid(int id);
}
