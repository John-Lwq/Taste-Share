package com.ts.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Recommend;
import com.ts.common.pojo.Restaurant;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recommendService;

	@Autowired
	private RedisClusterService redis;

	/**
	 * 获取该餐厅id的推荐菜表格数据： String
	 * url="http://manage.ts.com/recommend/"+restaurantId;
	 */
//	@RequestMapping("/recommend/{restaurantId}")
//	@ResponseBody
//	public List getRecommendById(@PathVariable Long restaurantId, Model model,Integer currPage,Integer pageSize) {
//
//		PageBean<Recommend> pageBean=recommendService.findRestaurantRecommendById(restaurantId,currPage,pageSize);
//		List<Recommend> list = pageBean.getPageList();
//		model.addAttribute("recommendList", list);
//		return list;
//
//	}
//	
	
	
	@RequestMapping("/restaurantrecommendview")
	//@ResponseBody
	public String getRecommendById( Long restaurantId, Model model,@RequestParam(defaultValue="1")Integer currentPage,@RequestParam(defaultValue="10")Integer pageSize) {
		System.err.println(currentPage);
		PageBean<Recommend> pageBean=recommendService.findRestaurantRecommendById(restaurantId,currentPage,pageSize);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("restaurantId", restaurantId);
		return "recommend_view";
	}
	
}
