package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.User;
import dao.User_dao;
import service.User_service;
import until.SearchInfo;

@Service
public class User_serviceImpl implements User_service{
	@Autowired
	User_dao user_dao;
	public List<User> select(SearchInfo searchInfo) {
		// TODO Auto-generated method stub
		return user_dao.select(searchInfo);
	}

	public void delete(int id) {
		user_dao.delete(id);
		
	}

	public void update(User user) {
		user_dao.update(user);
		
	}

	public void insert(User user) {
		user_dao.insert(user);
		
	}

}
