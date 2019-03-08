package com.ts.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;
import com.ts.manage.service.RestaurantService;

@Controller
public class RestaurantController {
 
	@Autowired
	private RestaurantService restaurantService;
	
	/**
	 * 请求路径manage.ts.com:8100/restaurant/list
	 * 分页显示餐厅列表
	 * @return
	 */
	@RequestMapping("/restaurantlist")
	//@ResponseBody
	//public List<Restaurant> restaurantList(@PathVariable Integer currPage,@PathVariable Integer pageSize,Model model){
     public String restaurantList(
    		 @RequestParam(defaultValue="1") Integer currentPage,
    		 @RequestParam(defaultValue="10") Integer pageSize,Model model){
						
		PageBean pageBean = restaurantService.findRestaurantList(currentPage,pageSize);
		model.addAttribute("pageBean", pageBean);
		return "restaurant_manage";				
	}
	
	
	/**
	 * 请求路径manage.ts.com:8100/restaurant/add
	 * 请求跳转到新增餐厅页面？
	 */
	@RequestMapping("restaurant/add")
	//@ResponseBody
	public String toAddRestaurant(){
		return  "forward:";
	}
	 
	/**
	 * 请求路径manage.ts.com:8100/restaurant/toadd
	 * 新增餐厅
	 */
	@RequestMapping("restaurant/toadd")
	//@ResponseBody
	public String addRestaurant(Restaurant restaurant){
		
		
		restaurantService.addRestaurant(restaurant);
		
		return  "redirect:/restaurantlist";
	}
	
	/**
	 * 请求路径manage.ts.com:8100/restaurant/update
	 * 根据传入restaurantId查询餐厅信息，用于数据回显
	 * 请求到餐厅跟新页面？，转发
	 */
	@RequestMapping("/restaurantupdate")
	public String toUpdateRestaurant(Long restaurantId,Model model){
		Restaurant restaurant=restaurantService.findRestaurantById(restaurantId);
		model.addAttribute("restaurant", restaurant);
		return  "restaurant_update";
	}
	
	
	/**
	 * 请求路径manage.ts.com:8100/restaurant/toupdate
	 *餐厅更新 
	 */
	@RequestMapping("/restauranttoupdate")
	public String UpdateRestaurant(Restaurant restaurant){
		restaurantService.updateRestaurant(restaurant);
		return "redirect:/restaurantlist";
	}
	
	
	
	/**
	 * 请求路径//manage.ts.com:8100/restaurant/delete
	 * 商品批量删除
	 * 重定向到商品列表请求manage.ts.com:8100/restaurant/list
	 */
	@RequestMapping("/restaurantdelete")
	public String deleteRestaurant(@RequestParam(value="restaurantId") Long restaurantId){
		restaurantService.updateStatusById(restaurantId);
		
		return  "redirect:/restaurantlist";
	}
	
	
	@RequestMapping("/restaurantview")
	public String toViewRestaurant(Long restaurantId,Model model){
		Restaurant restaurant=restaurantService.findRestaurantById(restaurantId);
		model.addAttribute("restaurant", restaurant);
		return  "restaurant_view";
	}
	
	
	

}
