package com.ts.manage.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ts.common.pojo.Restaurant;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.RestaurantService;

@Controller
public class WebRestaurantController {

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private RedisClusterService redis;

	/**
	 * 获取该餐厅id的餐厅表格数据： String
	 * url="http://manage.ts.com/restaurant/"+restaurantId;
	 * 
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	@RequestMapping("/restaurants/{restaurantId}")
	@ResponseBody
	public Restaurant getRestaurantById(@PathVariable Long restaurantId) throws Exception {

		Restaurant restaurant;
		String key = "restaurant_" + restaurantId;
		String value = "";
		if (redis.exists(key)) {
			value = redis.get(key);
			restaurant = ObjectUtil.mapper.readValue(value, Restaurant.class);
		} else {
			
			restaurant = restaurantService.findRestaurantById(restaurantId);
			value = ObjectUtil.mapper.writeValueAsString(restaurant);
			redis.set(key, value);
		}
		System.out.println(restaurant);
		return restaurant;

	}
	
	@RequestMapping("/restaurants")
	@ResponseBody
	public PageBean getMycommend(int userId,Integer currPage,Integer pageSize){
		PageBean pageBean = restaurantService.queryMyRecommend(userId, currPage, pageSize);
		return pageBean;
	}

	
	
	
	
	
	// 通过餐厅id获得餐厅推荐菜
	@RequestMapping("recommends/{restaurantId}")
	@ResponseBody
	public PageBean queryRecommend(@PathVariable Long restaurantId, @RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {
		PageBean pageBean = restaurantService.queryRecommend(restaurantId, currPage, pageSize);
		return pageBean;

	}

	/**
	 * 获取该餐厅id的用户评论表格数据： String
	 * url="http://manage.ts.com/restaurantdescs/"+restaurantId;
	 */

	@RequestMapping("restaurantdescs/{restaurantId}")
	@ResponseBody
	public PageBean queryRestaurantDesc(@PathVariable Long restaurantId,
			@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize) {
		PageBean pageBean = restaurantService.queryRestaurantDesc(restaurantId, currPage, pageSize);
		return pageBean;

	}

	/**
	 * 获取该餐厅类型id的餐厅表格数据： String
	 * url="http://manage.jt.com/restaruants/type/"+typeId;
	 */
	@RequestMapping("restaruants/type/{typeId}")
	@ResponseBody
	public PageBean queryRestaurantByType(@PathVariable Integer typeId,
			@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize) {

		return restaurantService.queryRestaurantByType(typeId, currPage, pageSize);

	}

	/**
	 * 获取按热度排序的餐厅表格数据： String url="http://manage.ts.com/restaurants/hot";
	 * 
	 * @throws JsonProcessingException
	 */

	@RequestMapping("restaurants/hot")
	@ResponseBody
	public PageBean queryRestaurantByHot(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) throws JsonProcessingException {

		return restaurantService.queryRestaurantByHot(currPage, pageSize);

	}

	/**
	 * 获取按创建时间排序的餐厅表格数据： String url="http://manage.ts.com/restaurants/time";
	 */
	@RequestMapping("restaurants/time")
	@ResponseBody
	public PageBean queryRestaurantByTime(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {

		return restaurantService.queryRestaurantByTime(currPage, pageSize);

	}

	// 通过userid来查询用户的收藏
	@RequestMapping("users/collection/{userId}")
	@ResponseBody
	public PageBean queryCollectionRestaurantByUserId(@PathVariable Long userId,
			@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize) {

		return restaurantService.queryCollectionRestaurantByUserId(userId, currPage, pageSize);

	}

	// 商家通过自己id查询自己餐厅
	@RequestMapping("restaurants/user/{userId}")
	@ResponseBody
	public PageBean queryRestaurantByUserId(@PathVariable Long userId,
			@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize) {

		PageBean pageBean = restaurantService.queryRestaurantByUserId(userId, currPage, pageSize);
		return pageBean;
	}
	
	
	
	
	
	@RequestMapping("restaurants/users/{userId}")
	@ResponseBody
	public Restaurant queryRestaurantByUserId(@PathVariable Long userId) {

		Restaurant restaurant = restaurantService.queryRestaurantByUserId2(userId);
		return restaurant;
	}
	
	

	// 通过userId来修改用户自己的餐厅信息
	@RequestMapping("restaurants/update")
	@ResponseBody
	public SysResult updateRestaurantByUserId(Restaurant restaurant) {
		try {
			String key = "restaurant_" + restaurant.getRestaurantId();
			String value = "";
			int i = restaurantService.updateRestaurant(restaurant);
			if (i > 0) {
				if (redis.exists(key)) {
					redis.del(key);
				}
				Restaurant restaurant2 = restaurantService.findRestaurantById(restaurant.getRestaurantId());
				redis.set(key, restaurant2.toString());
				value = redis.get(key);
				value = ObjectUtil.mapper.writeValueAsString(value);
				return SysResult.oK();
			} else {
				return SysResult.build(201, "更新餐厅信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return SysResult.build(201, "更新餐厅信息失败");
		}

	}

	// 查看店主自己的店铺的评论
	@RequestMapping("restaurants/desc/{userId}")
	@ResponseBody
	public PageBean queryDescByOrderId(@PathVariable Long userId, @RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {
		return restaurantService.queryDescByOrderId(userId, currPage, pageSize);
	}

	@RequestMapping("restaurants/rank")
	@ResponseBody
	public PageBean queryRestaurantByRank(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {
		return restaurantService.queryRestaurantByRank(currPage, pageSize);
	}

}
