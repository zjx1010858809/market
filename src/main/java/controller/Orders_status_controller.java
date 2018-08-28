package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Order_status_service;
import until.SearchInfo;

@Controller
@RequestMapping("Orders_status")
public class Orders_status_controller {
	
	@Autowired
	Order_status_service order_status_service;
	
	@RequestMapping("index")
	public void index() {
		System.out.println("ASD");
	}
	
	@RequestMapping("select")
	public @ResponseBody Map<String, Object> select(Integer select ,String txt, SearchInfo searchInfo,ModelMap map) {
		
		if (txt != null  && !txt.equals("")) {
			switch (select) {
			case 0:
				searchInfo.setWhere("where os.dest_status = "+ Integer.valueOf(txt));
				break;
			case 1:{
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				 Calendar calendar = new GregorianCalendar(); 
				 calendar.setTime(new Date());
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
				
				searchInfo.setWhere("where os.date < '"+date2+"' and os.date > '"+date1+"'");
			}
			default:
				break;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		if(txt != null && txt !="")
			result.put("count", order_status_service.select(searchInfo).size());
		else
			result.put("count", order_status_service.select(new SearchInfo()).size());
		result.put("data", order_status_service.select(searchInfo));
		return result;
	}
	

	
}
