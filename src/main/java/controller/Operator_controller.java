package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Entity.Operator;
import service.Operator_service;
import until.JsonUtil;
import until.Md5Utils;
import until.SearchInfo;


@Controller
@RequestMapping("Operator")
public class Operator_controller {
	@Autowired
	Operator_service operator_service;
	
	@RequestMapping("index")
	public void index() {
		
	}
	
	@RequestMapping("select")
	public @ResponseBody Map<String, Object> select(Integer select ,String txt, SearchInfo searchInfo,ModelMap map) {
		
		if (select !=null && !txt.equals("")) {
			switch (select) {
			case 0:
				searchInfo.setWhere("where name like '%"+txt+"%'");
				break;
			case 1:
				searchInfo.setWhere("where sex = "+ Integer.valueOf(txt));
				break;
			default:
				break;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		if(txt != null && txt !="")
			result.put("count", operator_service.select(searchInfo).size());
		else
			result.put("count", operator_service.select(new SearchInfo()).size());
		result.put("data", operator_service.select(searchInfo));
		return result;
	}
	@RequestMapping("selectname")
	public @ResponseBody List<Operator> select() {
		return operator_service.select(new SearchInfo());
	}
	
	@RequestMapping(value="edit",params= {"id"})
	public void edit(int id,ModelMap map) {
		SearchInfo searchInfo = new SearchInfo();
		searchInfo.setWhere("where id ="+id);
		map.put("operator", operator_service.select(searchInfo).get(0));

	}
	@RequestMapping("edit")
	public void edit(ModelMap map) {
	}
	
	@RequestMapping(value="save",params={"id"})
	public @ResponseBody JsonUtil genxin(Operator operator) {
		operator_service.update(operator);
		return new JsonUtil(1,"");
	}
	
	@RequestMapping(value="save")
	public @ResponseBody JsonUtil add(Operator operator) {
		operator.setPassword(Md5Utils.md5("123456"));
		operator_service.insert(operator);
		return new JsonUtil(1,"");
	}
	
}
