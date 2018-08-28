package service;

import java.util.List;

import Entity.Shopcar;
import until.SearchInfo;

public interface Shopcar_service {
	public List<Shopcar> select(SearchInfo searchInfo);
}
