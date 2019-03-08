package com.ts.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.util.PageBean;
import com.ts.manage.service.DescService;
import com.ts.manage.service.RestaurantService;
import com.ts.manage.service.UserService;

@Controller
public class DescController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private UserService userService;
	
	// 根据餐厅id获取评论列表
	@RequestMapping("/restaurantdescview")
	public String queryDescByRestaurantId(Long restaurantId,@RequestParam(defaultValue="1")Integer currentPage,@RequestParam(defaultValue="10")Integer pageSize,Model model){
		PageBean pageBean = restaurantService.queryRestaurantDesc(restaurantId, currentPage, pageSize);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("restaurantId", restaurantId);
		return "restaurant_desc_view";
	}
	
	// 根据userid获取评论列表
		@RequestMapping("/userdescview")
		public String queryDescByUserId(Long userId,@RequestParam(defaultValue="1")Integer currentPage,@RequestParam(defaultValue="10")Integer pageSize,Model model){
			System.out.println(userId);
			PageBean pageBean = userService.queryCommentByUserId(userId, currentPage, pageSize);
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("userId", userId);
			return "user_desc_view";
		}
		

}
