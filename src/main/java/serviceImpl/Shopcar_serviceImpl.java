package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entity.Shopcar;
import dao.Shopcar_dao;
import service.Shopcar_service;
import until.SearchInfo;

@Service
public class Shopcar_serviceImpl implements Shopcar_service{

	@Autowired
	Shopcar_dao shopcar_dao;
	
	public List<Shopcar> select(SearchInfo searchInfo) {
		
		return shopcar_dao.select(searchInfo);
	}

}
