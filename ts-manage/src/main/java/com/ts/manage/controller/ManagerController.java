package com.ts.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.User;
import com.ts.common.util.PageBean;
import com.ts.manage.service.UserService;

@Controller
public class ManagerController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/managerlist")
	public String managerList(@RequestParam(defaultValue="1") Integer currentPage,
	   		 @RequestParam(defaultValue="10") Integer pageSize,Model model){
		PageBean<User> pageBean = userService.managerList(currentPage, pageSize);
		model.addAttribute("pageBean",pageBean);
		return "manager_manage";
	}
	
	@RequestMapping("/managerupdate")
	public String managerUpdate(Long userId,Model model){
		User user = userService.selectOne(userId);
		model.addAttribute("user", user);
		return "manager_update";
	}
	
	
	@RequestMapping("/managertoupdate")
	public String managerToUpdate(User user,Model model){
		userService.updateUser(user);
		return "redirect:/managerlist";
	}
	

	// 删除管理员将status状态改为0
	@RequestMapping("/managerdelete")
	public String deleteManager(Long userId) {
		userService.deleteUser(userId);
		return "redirect:/managerlist";
	}
	// 查看页面
	@RequestMapping("/managerview")
	public String managerView(Long userId, Model model) {
		User user = userService.selectOne(userId);
		model.addAttribute(user);
		return "manager_view";
	}
	
}
