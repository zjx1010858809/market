package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageTranscoder;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Entity.Product;
import Entity.Type;
import service.Product_service;
import service.Type_service;
import until.JsonUtil;
import until.SearchInfo;

@Controller
@RequestMapping("Type")
public class Type_controller {
	@Autowired
	Type_service type_service;
	@Autowired
	Product_service product_service;
	
	Map<Integer, ArrayList<Type>> lists ;
	String idString = "";
	
	@RequestMapping(value="selectall")
	public @ResponseBody Map<String, Object> selectall(int id,SearchInfo searchInfo) {
		idString = "";

		lists = new HashMap<Integer, ArrayList<Type>>();
		List<Type> list=type_service.select(new SearchInfo());
		ArrayList<Type> types = new ArrayList<Type>();
		for(Type type:list) {
			if(!lists.containsKey(type.getParentid())) {
				lists.put(type.getParentid(), new ArrayList<Type>());
			}	
			lists.get(type.getParentid()).add(type);
		}
		
		for(Type type : lists.get(0)) {
			pu(type);
			types.add(type);
		}
		
		
		if(lists.containsKey(id)) {
			for(Type type : lists.get(id)) {
				pu2(type);
			}
		}
		idString += id;
		searchInfo.setWhere("where p.type_id in ("+idString+")");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("data", product_service.select(searchInfo));
		SearchInfo searchInfo2 = new SearchInfo();
		searchInfo2.setWhere("where p.type_id in ("+idString+")");
		result.put("count", product_service.select(searchInfo2).size());	
		return result;
	}
	
	private void pu2(Type type) {
		if(type.getChildren() == null) {
			idString+=type.getId()+",";
			}
		else {
			for(Type typ2: type.getChildren()) {
				pu2(typ2);
				idString+=typ2.getId()+",";
			}
			idString+=type.getId()+",";
		}
	}
	
	@RequestMapping("index")
	public void index(ModelMap m,HttpServletRequest req) {
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			m.put("types", mapper.writeValueAsString(getptyes(m)));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private ArrayList<Type> getptyes(ModelMap m) {
		lists = new HashMap<Integer, ArrayList<Type>>();
		List<Type> list=type_service.select(new SearchInfo());
		ArrayList<Type> types = new ArrayList<Type>();
		for(Type type:list) {
			if(!lists.containsKey(type.getParentid())) {
				lists.put(type.getParentid(), new ArrayList<Type>());
			}	
			lists.get(type.getParentid()).add(type);
		}
		
		for(Type type : lists.get(0)) {
			pu(type);
			types.add(type);
		}
		
		return types;
		
	}
	
	private void pu(Type type) {
		if(lists.containsKey(type.getId())) {
			type.setChildren(lists.get(type.getId()));
			for(Type type2 : lists.get(type.getId())) {
				pu(type2);
			}
		}
	} 
	
	@RequestMapping(value="save",params={"id"})
	public @ResponseBody JsonUtil genxin(Type type) {
		type_service.update(type);
		return new JsonUtil(1,"");
	}
	
	@RequestMapping(value="save")
	public @ResponseBody JsonUtil add(Type type) {
		type_service.insert(type);
		SearchInfo searchInfo = new SearchInfo();
		searchInfo.setWhere("where parentid = "+type.getParentid() +" and name='"+ type.getName()+"'");
		
		return new JsonUtil(type_service.select(searchInfo).get(0).getId(),"");
	}
	
	
	
}
