package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Entity.Product;
import Entity.Type;
import service.Product_service;
import service.Type_service;
import until.JsonUtil;
import until.Result;
import until.ResultUtil;
import until.SearchInfo;

@Controller
@RequestMapping("Product")
public class Product_controller {
	@Autowired
	Product_service Product_service;
	@Autowired
	Type_service Type_service;
	
	Map<Integer, ArrayList<Type>> lists ;
	
	@RequestMapping("index")
	public void index() {
		
	}
	
	@RequestMapping("select")
	public @ResponseBody Map<String, Object> select(Integer select ,String txt, SearchInfo searchInfo,ModelMap map) {
		if (txt !=null && !txt.equals("")) {
			switch (select) {
			case 0:
				searchInfo.setWhere("where p.type_id = "+ Integer.valueOf(txt));
				break;
			default:
				break;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		if(txt != null && txt !="")
			result.put("count", Product_service.select(searchInfo).size());
		else
			result.put("count", Product_service.select(new SearchInfo()).size());
		result.put("data", Product_service.select(searchInfo));
		return result;
	}
	
	@RequestMapping("selectname")
	public @ResponseBody List<Type> select() {
		return Type_service.select(new SearchInfo());
	}
	
	@RequestMapping(value="edit",params= {"id"})
	public void edit(int id,ModelMap map) {
		Map<Integer, ArrayList<Type>> newtype = new HashMap<Integer, ArrayList<Type>>();
		SearchInfo searchInfo = new SearchInfo();

		searchInfo.setWhere("where p.id ="+id);
		
		gettypes(map);
		Product product = Product_service.select(searchInfo).get(0);
		Type type =  Type_service.selectid(product.getType_id());
		map.put("product", product);
		String typeids="";
		typeids=getpid(typeids, type);
		map.put("typeg", typeids);
		String [] tiStrings = typeids.split(",");
		for (int i = 0; i < tiStrings.length; i++) {
			if(i==0)
				newtype.put(Integer.valueOf(tiStrings[i]), lists.get(0));
			else {
				newtype.put(Integer.valueOf(tiStrings[i]), lists.get(Integer.valueOf(tiStrings[i-1])));
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			map.put("newtype", mapper.writeValueAsString(newtype));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String getpid(String typeids,Type type) {
		if(type.getParentid()!=0) {
			typeids+=getpid(typeids, Type_service.selectid(type.getParentid()))+",";
		}
		typeids+=type.getId();

		return typeids;
	}
	
	
	@RequestMapping("edit")
	public void edit(ModelMap map) {
		Map<Integer, ArrayList<Type>> newtype = new HashMap<Integer, ArrayList<Type>>();
		gettypes(map);
		map.put("0", new ArrayList<Type>());
		ObjectMapper mapper = new ObjectMapper();
		try {
			map.put("newtype", mapper.writeValueAsString(newtype));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("type", Type_service.select(new SearchInfo()));
		
	}
	
	public void gettypes(ModelMap m) {
		lists = new HashMap<Integer, ArrayList<Type>>();
		List<Type> list=Type_service.select(new SearchInfo());
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
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			m.put("types", mapper.writeValueAsString(types));
			m.put("lists", mapper.writeValueAsString(lists));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	public @ResponseBody JsonUtil genxin(Product product) {
		Product_service.update(product);
		return new JsonUtil(1,"");
	}
	
	@RequestMapping(value="save")
	public @ResponseBody JsonUtil add(HttpServletRequest request) {
		 String fullname =request.getParameter("fullname");
		 int type_id = Integer.valueOf(request.getParameter("type_id"));
		 String activity=request.getParameter("fullname");
		 String tip=request.getParameter("tip");
		 String sale=request.getParameter("sale");
		 String info=request.getParameter("info");
		 Double price= Double.valueOf(request.getParameter("price"));
		 Double nowprice=Double.valueOf(request.getParameter("nowprice"));
		 int salecount=0;
		 int collectcount=0;
		 int priority=Integer.valueOf(request.getParameter("nowprice"));
		 int status=Integer.valueOf(request.getParameter("status"));
		 String pics=request.getParameter("pics");
		 String comments =request.getParameter("comments");
		Product_service.insert(new Product(fullname, type_id, activity, tip, sale, info, price, nowprice, salecount, collectcount, priority, status, pics, comments));
		return new JsonUtil(1,"");
	}
	
	@RequestMapping(value="selecttypes")
	public @ResponseBody ArrayList<Type> selecttypes(int id) {
		
		return lists.get(id);
	}
	
	@RequestMapping("uploadImg")
	public @ResponseBody Result uploadImg(@RequestBody MultipartFile myFileName,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		String realName = "";
	if (myFileName != null) {
	String fileName = myFileName.getOriginalFilename();
	String fileNameExtension = fileName.substring(fileName.indexOf("."), fileName.length());
	// 生成实际存储的真实文件名

	realName = UUID.randomUUID().toString() + fileNameExtension;
	// "/upload"是你自己定义的上传目录
	String realPath = session.getServletContext().getRealPath("/upload");
	File uploadFile = new File(realPath, realName);
	myFileName.transferTo(uploadFile);
	}
	String [] str = {request.getContextPath() + "/upload/" + realName};
	return ResultUtil.success(str);
	}
	
}
