package com.ts.sso.controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ts.common.pojo.User;
import com.ts.common.util.ObjectUtil;
import com.ts.common.vo.SysResult;
import com.ts.sso.service.UserService;

import net.sf.json.JSONObject;


@Controller
@CrossOrigin(origins = "*", maxAge = 3600)
public class UserController {

	@Autowired
	private UserService userService;
	
	//用户注册
	@RequestMapping("user/register")
	public SysResult saveUser(User user){
		try {
			userService.saveUser(user);
			return SysResult.oK();
		} catch (Exception e) {
			return SysResult.build(201,"注册失败,请重试");
		}
	}
	
	//用户注销
	@RequestMapping("user/logout")
	public void logout(String ticket){
		userService.logout(ticket);
	}
	
	
	//登陆逻辑
	@RequestMapping("user/login")
	@ResponseBody
	public SysResult doLogin(@RequestParam("u")String username,@RequestParam("p")String password,Model model) throws JsonProcessingException{
	    Subject subject=SecurityUtils.getSubject();//获取当前的对象
			
		//参数:AuthenticationToken :令牌(票)
		//拿到当前登陆的用户的用户名和密码
		//令牌对象是由shiro提供的
		UsernamePasswordToken token=new UsernamePasswordToken(username, password);
		
		//shiro提供的登录方法
		try {
			//表示正常执行的业务逻辑,登录
			//此处已经将令牌对象传递给原材料realm了
			subject.login(token);
			
			//首先获得真实对象:从数据库中已经验证过的用户
			//如果运行到此处,代表用户输入的用户名和密码与数据库中的用户匹配
			//也就是说可以正常登录
			User user=(User) subject.getPrincipal();
			//将user信息放入作用域中
			//subject.getSession().setAttribute("user", user);
			//业务层user信息保存到redis的key值ticket
			String ticket=userService.doLogin(user);
		    return SysResult.oK(ticket);
		} catch (Exception e) {
			//System.out.println(token.getUsername());
			//System.out.println(token.getPassword());
			//表示令牌认证失败,不允许登陆
			e.printStackTrace();
		}
	    //登录失败,返回空字符串的ticket
	    return SysResult.build(201, "用户名/密码错误", false);
	}
		
	
	
	//用户数据的校验,js+ajax发起的请求,返回jsonp格式的数据
	//可以接受httpclient传来的方法
	@RequestMapping("user/check")
	@ResponseBody
	@CrossOrigin(origins = "*", maxAge = 3600)
	public String checkParam(String username,String callback) throws Exception{
		//System.out.println("**************ajax进入**********************");
		
		JSONObject result=userService.checkParam(username);
/*		if(callback==null){
			//说明是httpclient发起的请求
			return ObjectUtil.mapper.writeValueAsString(SysResult.oK(result));
		}*/
		return callback+"("+ObjectUtil.mapper.writeValueAsString(result)+")";

	}
	
	//通过ticket查询用户信息
	//验证用户是否登录并且获取对象的权限信息roleId
	@RequestMapping("user/query/{ticket}")
	@ResponseBody
	@CrossOrigin(origins = "*", maxAge = 3600)
	public String queryUserByTicket(@PathVariable("ticket")String ticket,String callback) throws JsonProcessingException{
		String userJson=userService.queryUserJson(ticket);
		JSONObject result=new JSONObject();
		result.put("ticket", userJson);
		return callback+"("+ObjectUtil.mapper.writeValueAsString(result)+")";
	}
	
}
