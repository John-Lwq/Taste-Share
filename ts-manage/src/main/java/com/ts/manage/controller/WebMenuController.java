package com.ts.manage.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ts.common.pojo.Menu;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.MenuService;

@Controller
public class WebMenuController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private RedisClusterService redis;

	// 通过菜谱id查询菜谱
	@RequestMapping("menus/{menuId}")
	@ResponseBody
	public Menu queryMenuById(@PathVariable Long menuId) throws Exception {
		Menu menu;
			String key = "menu_" + menuId;
			String value = "";
			//if (redis.exists(key)) {
			//	value = redis.get(key);
			//	menu = ObjectUtil.mapper.readValue(value, Menu.class);
			//} else {
				menu = menuService.queryMenuById(menuId);
			//	value=ObjectUtil.mapper.writeValueAsString(menu);
			//	redis.set(key,value);
		//	}
			return menu;
		
	}

	// 通过热度查询菜谱
	@RequestMapping("menus/hot")
	@ResponseBody
	public PageBean queryMenuByHot(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {
			return menuService.queryMenuByHot(currPage, pageSize);
		
	}

	// 通过创建时间查询菜谱
	@RequestMapping("menus/time")
	@ResponseBody
	public PageBean queryMenuByTime(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {

			return menuService.queryMenuByTime(currPage, pageSize);
	}
}
