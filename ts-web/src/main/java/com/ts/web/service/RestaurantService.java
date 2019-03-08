package com.ts.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ts.common.service.HttpClientService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.HttpResult;
import com.ts.common.vo.SysResult;
import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Recommend;
import com.ts.common.pojo.Restaurant;

@Service
public class RestaurantService {

	@Autowired
	private HttpClientService client;

	@Autowired
	private ObjectMapper mapper = new ObjectMapper();

	// �������͵�collection json�ַ���ת��Ϊ����ķ���
	public JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}

	// �Ӻ�̨��ȡ����

	//1：根据餐厅ID查询一个餐厅的信息和详情-----3个对象表：餐厅信息表，推荐菜表，用户评论表
	//1）获取餐厅信息表格数据
	public Restaurant queryRestaurant(Long restaurantId) throws Exception {

		String url = "http://manage.ts.com/restaurants/" + restaurantId;
		// ������Ӧ���е��ַ���
		String restaurantJson = client.doGet(url);
		// ת��json��item���� readValue�ǽ����������jsonת���ɶ���ķ���
		// ����ת��json writeValueAsString
		
		Restaurant restaurant = ObjectUtil.mapper.readValue(restaurantJson, Restaurant.class);
		return restaurant;
	}

	//2）获取推荐菜表格数据
	public PageBean<Recommend> queryRecommend(Long restaurantId) throws Exception {

		String url = "http://manage.ts.com/recommends/" + restaurantId;
		// ������Ӧ���е��ַ���
		HttpResult response = client.doPost(url);
		// ת��json��item���� readValue�ǽ����������jsonת���ɶ���ķ���
		String jsonData = response.getBody();
    	PageBean<Recommend> pageBean = ObjectUtil.mapper.readValue(jsonData, PageBean.class);
    	return pageBean;
	}

	//3）获取用户评论表格数据
	public PageBean<Desc> queryRestaurantDesc(Long restaurantId) throws Exception {

		String url = "http://manage.ts.com/restaurantdescs/" + restaurantId;
		// ������Ӧ���е��ַ���
		HttpResult response = client.doPost(url);
		String jsonData = response.getBody();
		// ת��json��item���� readValue�ǽ����������jsonת���ɶ���ķ���
		// ����ת��json writeValueAsString
    	PageBean<Desc> pageBean = ObjectUtil.mapper.readValue(jsonData, PageBean.class);
    	return pageBean;
	}

	//2：根据餐厅类型id获取餐厅列表----page/rows传入后台进行分页
	public PageBean<Restaurant> queryRestaurantList(Integer typeId, Integer currPage, Integer pageSize) throws Exception {
		String url = "http://manage.ts.com/restaruants/type/" + typeId;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		HttpResult response = client.doPost(url, map);
		String jsonData = response.getBody();
	    	PageBean<Restaurant> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
	    	return pageBean;
		
	}

	//3：获取按点击热度排序的餐厅信息列表
	public PageBean<Restaurant> queryHotRestaurantList(Integer currPage, Integer pageSize) throws Exception {
		String url = "http://manage.ts.com/restaurants/hot";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		HttpResult response = client.doPost(url, map);
		String jsonData = response.getBody();
	    	PageBean<Restaurant> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
	    	return pageBean;
}

	//4：获取按创建时间排序的餐厅信息列表
	public PageBean<Restaurant> queryTimeRestaurantList(Integer currPage, Integer pageSize) throws Exception {
		String url = "http://manage.ts.com/restaurants/time";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		HttpResult response = client.doPost(url, map);
		String jsonData = response.getBody();
	    	PageBean<Restaurant> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
	    	return pageBean;
		
	}

	public PageBean<Restaurant> queryRestaurantListByRank(Integer currPage, Integer pageSize) throws Exception {
		String url = "http://manage.ts.com/restaurants/rank";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		HttpResult response = client.doPost(url, map);
		String jsonData = response.getBody();
    	PageBean<Restaurant> pageBean=ObjectUtil.mapper.readValue(jsonData, PageBean.class);
    	return pageBean;
	}

}
