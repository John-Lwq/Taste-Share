package com.ts.web.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Restaurant;
import com.ts.common.pojo.User;
import com.ts.common.service.HttpClientService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.HttpResult;
import com.ts.common.vo.SysResult;

@Service
public class UserCentreService {
	@Autowired
	private HttpClientService client;

	@Autowired
	private ObjectMapper mapper = new ObjectMapper();

	// 带泛型的集合转化为json
	public JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}
	
	public User queryUser(Long userId) throws Exception {
        //业务层代码,需要发起夸系统的访问,使用的是httpclient
		/*请求url:"http://www.ts.com/usercentre/update/{userId}"
		请求方式:get
		参数:Long userId 
                     返回数据: user的json字符串返回放到响应体中;*/
		//url地址
		String url="http://manage.ts.com/users/"+userId;
	    
		String jsonData = client.doGet(url);
		//转化json成user对象 readValue是将单个对象的json转化成对象的方法
		//对象转成json writeValueAsString
		User user = ObjectUtil.mapper.readValue(jsonData, User.class);
		return user;
	    }

	public void updateUser(User user) throws Exception {
		String url="http://manage.ts.com/users/update";
		Map<String,Object> map=new HashMap<String, Object>();
/*		map.put("userId",user.getUserId());
		map.put("username", user.getUsername());
	    map.put("password", user.getPassword());
		map.put("nickname", user.getNickname());
		map.put("birthday", user.getBirthday());
		map.put("name", user.getName());
		map.put("gender", user.getGender());
		map.put("phoneNumber", user.getPhoneNumber());
		map.put("location", user.getLocation());*/
		String str = ObjectUtil.mapper.writeValueAsString(user);
		map.put("user", str);
		HttpResult result = client.doPost(url, map);
		String jsonData = result.getBody();
		SysResult answer= ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		Integer status=answer.getStatus();
		if(status!=200){
			throw new Exception("修改失败,请稍后重试");
		}
	}

	
	public PageBean<Desc> userComment(Long userId,Integer currPage,Integer pageSize) throws Exception {
		String url="http://manage.ts.com/users/comment/"+userId;
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("currPage",currPage);
		map.put("pageSize",pageSize);
		String jsonData = client.doGet(url,map);
			PageBean<Desc> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
			return pageBean;
	}

	public PageBean<Restaurant> queryMyCollection(Long userId,Integer currPage,Integer pageSize) throws Exception {
		String url="http://manage.ts.com/users/collection/"+userId;
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("currPage",currPage);
		map.put("pageSize",pageSize);
		String jsonData=client.doGet(url,map);
		
		PageBean<Restaurant> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
		return pageBean;
	}

	public Restaurant queryRestaurant(Long userId) throws Exception {
		String url="http://manage.ts.com/restaurants/users/"+userId;
		String jsonData=client.doGet(url);
		//因为只有商家才能查询自己的店铺,所以肯定会对应一个餐厅,肯定能找到
		//不需要管status
		//需要考虑到可能一个户主有多个餐厅
		Restaurant restaurant = ObjectUtil.mapper.readValue(jsonData, Restaurant.class);
		
		return restaurant;
	}

	
	public void updateRestaurant(Restaurant restaurant) throws Exception {
		String url="http://manage.ts.com/restaurants/update";
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("restaurantId", restaurant.getRestaurantId());
		//map.put("userId", restaurant.getUserId());
		map.put("shopName", restaurant.getShopName());
		map.put("shopAddress", restaurant.getShopAddress());
		//map.put("averPrice", restaurant.getAverPrice());
		//map.put("type",restaurant.getType());
		//map.put("tasteScore", restaurant.getTasteScore());
		//map.put("environmentScore", restaurant.getEnvironmentScore());
		//map.put("serviceScore", restaurant.getServiceScore());
		//map.put("defaultPic", restaurant.getDefaultPic());
		//map.put("sign", restaurant.getSign());
		//map.put("status", restaurant.getStatus());
		HttpResult response=client.doPost(url,map);
		//此处还需要添加后台传来的sysresult来判断是否成功
		//如果状态码不为200,不是ok,需要另加判断
		String jsonData = response.getBody();
		SysResult result = ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		Integer status = result.getStatus();
		if(status!=200)
			throw new Exception("修改失败,请重试");
	}

	//查看店主自己的店铺的评论
	public PageBean<Desc> myComment(Long userId,Integer currPage,Integer pageSize) throws Exception {
		String url="http://manage.ts.com/restaurants";
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("currPage",currPage);
		map.put("pageSize",pageSize);
		map.put("userId", userId);
		String jsonData=client.doGet(url,map);
		PageBean<Desc> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
		return pageBean;
	}

	public void deleteDesc(Long descId) throws Exception {
		String url="http://manage.ts.com/deleteDesc/"+descId;
		String jsonData = client.doGet(url);
		SysResult result = ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		Integer status = result.getStatus();
		if(status!=200)
			throw new Exception("删除评论错误,请稍后重试");
	}

	public void deleteCollection(Long userId, Long restaurantId) throws Exception {
		String url="http://manage.ts.com/deleteCollection/"+userId+"/"+restaurantId;
		String jsonData = client.doGet(url);
		SysResult result = ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		Integer status = result.getStatus();
		if(status!=200)
			throw new Exception("收藏店铺删除错误,请稍后重试");
	}


	
}
