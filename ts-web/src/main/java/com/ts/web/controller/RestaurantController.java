package com.ts.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Recommend;
import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;
import com.ts.web.service.RestaurantService;


//����ģ��
@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	
	//餐厅模块
	//1：根据餐厅ID查询一个餐厅的信息和详情-----3个对象表：餐厅信息表，推荐菜表，评论表
	@RequestMapping("restaurant/details")
	public String queryRestaurantInfo(Long restaurantId,Model model) throws Exception{
		try {
		Restaurant restaurant=restaurantService.queryRestaurant(restaurantId);
		PageBean<Desc> restaurantdesc=restaurantService.queryRestaurantDesc(restaurantId);
		List<Desc> pageList = restaurantdesc.getPageList();
		PageBean<Recommend> recommend=restaurantService.queryRecommend(restaurantId);
		List<Recommend> pageList2 = recommend.getPageList();
		//Я�����ݵ�ҳ��չʾ
		model.addAttribute("restaurant",restaurant);
		model.addAttribute("restaurantdesc",pageList);
		model.addAttribute("recommend",pageList2);
		} catch (Exception e) {
		model.addAttribute("msg", "查询餐厅信息失败");
		}
		return "restaurant/details";
	}
	
	
	//2：根据餐厅类型ID查询此类别的所有餐厅，用...page&rows获取页数和行数
	@RequestMapping("restaurant/type/{typeId}")
	public String queryTypeRestaurant(@PathVariable Integer typeId,Model model,
			@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Restaurant> pageBean=restaurantService.queryRestaurantList(typeId,currPage,pageSize);
			model.addAttribute("pageBean", pageBean);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		return "restaurant/type";
	}
	
	//点击restaurant首页的类别,跳转type页面
	@RequestMapping("restaurant/type")
	public String queryTypeRestaurant3(Model model,
			@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Restaurant> pageBean=restaurantService.queryRestaurantListByRank(currPage,pageSize);
			model.addAttribute("pageBean", pageBean);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		return "restaurant/type";
	}
	
	//直接默认返回一些餐厅种类信息
	@RequestMapping("restaurant/list")
	public String queryTypeRestaurant2(Model model,
			@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Restaurant> pageBean=restaurantService.queryRestaurantListByRank(currPage,pageSize);
			model.addAttribute("pageBean", pageBean);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		return "restaurant/list";
	}
	
	//3:返回按照热度排序的餐厅list
	@RequestMapping("restaurant/hot")
	public String queryHotRestaurant(Model model,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Restaurant> pageBean = restaurantService.queryHotRestaurantList(currPage, pageSize);
			//Я�����ݵ�ҳ��չʾ
			model.addAttribute("pageBean",pageBean);
		} catch (Exception e) {
			model.addAttribute("msg",e.getMessage());
		}
		return "restaurant/hot";
	}
	
	//4：返回按照创建时间排序的餐厅list
	@RequestMapping("restaurant/time")
	public String queryTimeRestaurant(Model model,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Restaurant> pageBean = restaurantService.queryTimeRestaurantList(currPage, pageSize);
			model.addAttribute("pageBean",pageBean);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}

		return "restaurant/time";
	}
	
}
