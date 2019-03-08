package com.ts.manage.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.User;
import com.ts.common.util.PageBean;
import com.ts.manage.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	
	// 用户管理员获取用户列表
	@RequestMapping("/userlist")
	public String queryUserList(@RequestParam(defaultValue="1")Integer currentPage, @RequestParam(defaultValue="10")Integer pageSize,Model model) {
		 PageBean pageBean = userService.queryUserList(currentPage, pageSize);
		 model.addAttribute("pageBean", pageBean);
		 return "user_manage";
		 
	}

	// 跳转用户更新页面 数据回显
	// 前台要一个不能更改的text框用来写userId给更新的时候传值
	@RequestMapping("/userupdate")
	public String userUpdate(Long userId, Model model) {
		User user = userService.selectOne(userId);
		model.addAttribute(user);
		return "user_update";
	}

	// 更新用户信息
	@RequestMapping("/usertoupdate")
	public String toUpdataUser(User user) {
		userService.updateUser(user);
		return "redirect:/userlist";

	}

	// 删除用户将status状态改为0
	@RequestMapping("/userdelete")
	public String deleteUser(Long userId) {
		userService.deleteUser(userId);
		return "redirect:/userlist";
	}
	
	@RequestMapping("/userview")
	public String userView(Long userId, Model model) {
		User user = userService.selectOne(userId);
		model.addAttribute(user);
		return "user_view";
	}


	
}
