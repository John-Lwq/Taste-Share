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
import com.ts.common.pojo.Menu;

@Service
public class MenuService {

	@Autowired
	private HttpClientService client;

	@Autowired
	private ObjectMapper mapper = new ObjectMapper();

	// �������͵�collection json�ַ���ת��Ϊ����ķ���
	public JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}
	
	//1：根据菜谱ID查询一个菜谱的信息和详情
	public Menu queryMenu(Long menuId) throws Exception {

		String url = "http://manage.ts.com/menus/" + menuId;
		String jsonData = client.doGet(url);
		Menu menu = ObjectUtil.mapper.readValue(jsonData, Menu.class);
		return menu;
	}

	//2：获取按点击热度排序的菜谱信息列表
	public PageBean<Menu> queryHotMenu(Integer currPage, Integer pageSize) throws Exception {

		String url = "http://manage.ts.com/menus/hot";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);

		HttpResult response = client.doPost(url, map);

		String jsonData = response.getBody();
		PageBean<Menu> pageBean = ObjectUtil.mapper.readValue(jsonData, PageBean.class);
		return pageBean;
	}

	//3：获取按创建时间排序的菜谱信息列表
	public PageBean<Menu> queryTimeMenu(Integer currPage, Integer pageSize) throws Exception {

		String url = "http://manage.ts.com/menus/time";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);

		HttpResult response = client.doPost(url, map);
		
		String jsonData = response.getBody();
		PageBean<Menu> pageBean = ObjectUtil.mapper.readValue(jsonData, PageBean.class);
		return pageBean;
	}
}
