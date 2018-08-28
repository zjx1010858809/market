package service;

import java.util.List;
import Entity.User;
import until.SearchInfo;

public interface User_service {
	public List<User> select(SearchInfo searchInfo);
	
	public void delete(int id);
	
	public void update(User user);
	
	public void insert(User user);
}
