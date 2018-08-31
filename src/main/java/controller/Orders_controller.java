package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Entity.Operator;
import Entity.Orders;
import Entity.Orders_status;
import dao.Orders_status_dao;
import service.Order_status_service;
import service.Orders_service;
import until.JsonUtil;
import until.SearchInfo;

@Controller
@RequestMapping("Orders")
public class Orders_controller {
	
	@Autowired
	Orders_service orders_service;
	
	@Autowired
	Order_status_service order_status_service;
	
	@RequestMapping("index")
	public void index() {
		
	}
	
	@RequestMapping("select")
	public @ResponseBody Map<String, Object> select(Integer select ,String txt, SearchInfo searchInfo,ModelMap map) {
		
		if (txt != null && !txt.equals("")) {
			switch (select) {
			case 0:
				searchInfo.setWhere("where o.status = "+ Integer.valueOf(txt));
				break;
			case 1:{
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				 Calendar calendar = new GregorianCalendar(); 
				 calendar.setTime(new Date());
				 calendar.add(calendar.DATE,1);
				 String date2 = sdf.format(calendar.getTime());
				 if(Integer.valueOf(txt) == 3)
					 calendar.add(calendar.DATE,-30); 
				 if(Integer.valueOf(txt) == 2)
					 calendar.add(calendar.DATE,-7); 
				 if(Integer.valueOf(txt) == 1)
					 calendar.add(calendar.DATE,-3); 
				 if(Integer.valueOf(txt) == 0)
					 calendar.add(calendar.DATE,-1); 
				 Date date=calendar.getTime();		 
				 String date1 = sdf.format(date);
				
				
				searchInfo.setWhere("where o.date < '"+date2+"' and o.date > '"+date1+"'");
			}
			default:
				break;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		if(txt != null && txt !="")
			result.put("count", orders_service.select(searchInfo).size());
		else
			result.put("count", orders_service.select(new SearchInfo()).size());
		result.put("data", orders_service.select(searchInfo));
		return result;
	}
	
	@RequestMapping(value="edit",params= {"id"})
	public String edit(int id,ModelMap map,HttpSession session) {
		Operator operator = (Operator) session.getAttribute("user");
		SearchInfo searchInfo = new SearchInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		searchInfo.setWhere("where o.id ="+id);
		Orders orders =	orders_service.select(searchInfo).get(0);
		if(orders.getStatus() == 1) {
			map.put("id", orders.getId());
			return "Orders/edit";
		}
		searchInfo.setWhere("where o.id ="+id +" and os.dest_status = 4");
		System.out.println(searchInfo.getWhere());
		Orders_status orders_status =order_status_service.select(searchInfo).get(0);
		String date =sdf.format(new Date());
		orders_status.setDate(date);
		orders_status.setDest_status(5);
		orders_status.setNum(operator.getId());
		orders.setStatus(5);
		orders_service.update(orders);
		order_status_service.insert(orders_status);
		return "Orders/index";
	}
	
	@RequestMapping(value="save",params={"id"})
	public @ResponseBody JsonUtil genxin(Orders orders,String comments,String info,HttpSession session) {
		Operator operator = (Operator) session.getAttribute("user");
		SearchInfo searchInfo = new SearchInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		searchInfo.setWhere("where o.id = "+orders.getId());
		Orders orders2 = orders_service.select(searchInfo).get(0);
		orders2.setStatus(2);
		orders_service.update(orders2);
		
		searchInfo.setWhere("where o.id ="+orders.getId() +" and os.dest_status = 1");
		Orders_status orders_status =order_status_service.select(searchInfo).get(0);
		String date =sdf.format(new Date());
		orders_status.setDate(date);
		orders_status.setInfo(info);
		orders_status.setNum(operator.getId());
		orders_status.setDest_status(2);
		orders_status.setComments(comments);
		order_status_service.insert(orders_status);
		return new JsonUtil(1,"");
	}
	

	
}
