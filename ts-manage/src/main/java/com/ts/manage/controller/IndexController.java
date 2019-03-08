package com.ts.manage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.tomcat.util.descriptor.DigesterFactory;
import org.apache.tomcat.util.digester.Digester;
import org.elasticsearch.cluster.DiffableUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ts.commom.config.HttpClient;
import com.ts.common.pojo.User;
import com.ts.common.service.HttpClientService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.ArticleService;
import com.ts.manage.service.MenuService;
import com.ts.manage.service.RestaurantService;
import com.ts.manage.service.UserService;


@Controller
public class IndexController {
	
	@Autowired
	private ArticleService artilceService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private HttpClientService client;
	
	@RequestMapping("/")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/toindex_home")
	public String index(Model model){
		int articleNum = artilceService.articleNum();
		int menuNum = menuService.menuNum();
		int managerNum = userService.managerNum();
		int restaurantNum = restaurantService.restaurantNum();
		int userNum = userService.userNum();
		model.addAttribute("articleNum", articleNum);
		model.addAttribute("menuNum", menuNum);
		model.addAttribute("managerNum", managerNum);
		model.addAttribute("restaurantNum", restaurantNum);
		model.addAttribute("userNum", userNum);
		return "index_home";
		
	}
	
	@RequestMapping("/index")
	public String toIndex(){
	
		return "index";
		
	}
	
	@RequestMapping("/toindex")
	public String toLogin(User user,Model model) throws Exception{
	
		String url="http://sso.ts.com/user/login";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("p", user.getPassword());
		map.put("u", user.getUsername());
		String result = client.doGet(url, map);
		SysResult sysResult = ObjectUtil.mapper.readValue(result, SysResult.class);
		if(sysResult.getStatus().equals(200)){
			return "redirect:/index";
		}else{
			model.addAttribute("msg", "用户名密码错误");
			return "login";
		}
	
	}
	
	
	
	
}
