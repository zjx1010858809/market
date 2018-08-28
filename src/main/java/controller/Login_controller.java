package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Entity.Operator;
import Entity.User;
import service.Operator_service;
import service.User_service;
import until.JsonUtil;
import until.Md5Utils;
import until.SearchInfo;

@Controller
public class Login_controller {
	
	@Autowired
	Operator_service operator_service;
	@RequestMapping("login")
	public @ResponseBody JsonUtil  login(Operator operator,HttpServletRequest request) {

		SearchInfo searchInfo = new SearchInfo();
		searchInfo.setWhere("where nike = '"+operator.getNike()+"' and password='"+Md5Utils.md5(operator.getPassword())+"'" );
		if( operator_service.select(searchInfo).size()>0) {
			Operator user2 =operator_service.select(searchInfo).get(0);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("user", user2);
			httpSession.setMaxInactiveInterval(600);
			return new JsonUtil(1,"");
		}
		return new JsonUtil(0,"");
	}
	
	@RequestMapping("alertpasseord")
	public @ResponseBody JsonUtil alertpasseord(String old,String password,HttpSession session) {
		Operator operator = (Operator) session.getAttribute("user");
		if(Md5Utils.md5(old).equals(operator.getPassword())) {
			operator.setPassword(Md5Utils.md5(password));
			session.setAttribute("user", operator);
			operator_service.update(operator);
			return new JsonUtil(1,"");
		}
		return new JsonUtil(0,"");
	}
}
