package com.ts.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.User;
import com.ts.common.util.CookieUtils;
import com.ts.common.util.VerifyCode;
import com.ts.web.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	//跳转到用户注册页面
	@RequestMapping("user/register")
	public String register(){
		return "register";
	}
	
	//用户注销
	@RequestMapping("user/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String ticket=CookieUtils.getCookieValue(request, "TS_TICKET");
		//删除redis中存储的ticket
		userService.logout(ticket);
		Cookie cookie =new Cookie("TS_TICKET", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:/";
	}
	
	
	
	//使用画图工具将验证码发送给前台,并且将正确答案存入作用域中
	@RequestMapping("drawImg")
	@ResponseBody
	public void drawPicture(HttpServletRequest request,HttpServletResponse response) throws IOException{
		VerifyCode vc=new VerifyCode();
		vc.drawImage(response.getOutputStream());
		request.getSession().setAttribute("code", vc.getCode());
	}
	
	//使用httpclient,将用户的信息发送到sso,实现用户的注册
	@RequestMapping("user/toregister")
	public String toRegister(User user,String code,Model model,HttpServletRequest request){
		String correctCode=(String) request.getSession().getAttribute("code");
		System.out.println(correctCode);
		//在web中就可以先进行验证码的判断,如果错误,直接返回
		if(!code.equalsIgnoreCase(correctCode)){
			model.addAttribute("msg", "验证码错误,请重试");
			model.addAttribute("user", user);
			return "forward:register";
		}
		try {
			userService.register(user);
			//注册成功,直接跳转回首页
			return "redirect:/";
		} catch (Exception e) {
			//说明登陆失败,将用户信息回填,返回注册页面
			e.printStackTrace();
			model.addAttribute("user", user);
			model.addAttribute("msg", "发生了某个错误,请稍后重试");
			return "forward:register";
		}
	}
	
	//跳转用户登录页面
	@RequestMapping("user/index")
	public String goIndex(){
		return "login";
	}
	
	//登录功能
	@RequestMapping("user/toindex")
	public String doLogin(User user,HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{
		try {
			String ticket=userService.doLogin(user);
			//判断是否有登录结果;一旦失败,ticket为空
			if("".equals(ticket)||"null".equals(ticket)||ticket==null){
				//登录失败 ajax提交,返回失败信息,201
				model.addAttribute("msg", "登录失败,请重试");
				return "forward:index";
			}else{
				//登录成功
				//创建cookie,与redis配合解决session共享问题
				CookieUtils.setCookie(request, response, 
						"TS_TICKET", ticket);
				//通过和后台发送ticket获得用户的全部信息
				//放入作用域中
				User user2=userService.toUserCentre(ticket);
				HttpSession session = request.getSession();
				Long userId = user2.getUserId();
				Integer roleId = user2.getRoleId();
				//携带数据到页面展示
				session.setAttribute("userId",userId);		
				session.setAttribute("roleId",roleId);
				//登陆成功后,重定向到首页
			    return "redirect:/";
			}
		} catch (Exception e) {
			//说明登陆失败
			model.addAttribute("msg", "用户名/密码错误,请重试");
			return "forward:index";
		}
		
			
		}

	
}
