package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Entity.Product;
import Entity.User;
import service.Product_service;
import service.Shopcar_service;
import service.User_service;
import until.SearchInfo;

@Controller
@RequestMapping("Shopcar")
public class Shopcar_Controller {
	@Autowired
	Shopcar_service shopcar_service;
	@Autowired
	User_service user_service;
	@Autowired
	Product_service product_service;
	
	@RequestMapping("index")
	public void index() {
		
	}
	
	@RequestMapping("select")
	public @ResponseBody Map<String, Object> select(Integer select ,String txt, SearchInfo searchInfo,ModelMap map) {
		if (txt !=null  && !txt.equals("")) {
			switch (select) {
			case 0:
				searchInfo.setWhere("where c.user_id = "+ Integer.valueOf(txt));
				break;
			case 1:
				searchInfo.setWhere("where c.product_id = "+ Integer.valueOf(txt));
			default:
				break;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		if(txt != null && txt !="")
			result.put("count", shopcar_service.select(searchInfo).size());
		else
			result.put("count", shopcar_service.select(new SearchInfo()).size());
		result.put("data", shopcar_service.select(searchInfo));
		return result;
	}
	
	@RequestMapping("selectuser")
	public @ResponseBody List<User> select() {
		return user_service.select(new SearchInfo());
	}
	
	@RequestMapping("selectproduct")
	public @ResponseBody List<Product> select2() {
		return product_service.select(new SearchInfo());
	}
	
	
}
