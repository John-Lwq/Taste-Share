package com.ts.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Menu;
import com.ts.common.util.PageBean;
import com.ts.web.service.MenuService;


//����ģ��
@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	//1：根据菜谱ID查询一个菜谱的信息和详情
	@RequestMapping("menu/details")
	public String queryRestaurantInfo( Long menuId,Model model) throws Exception{
		
		Menu menu=menuService.queryMenu(menuId);

		//Я�����ݵ�ҳ��չʾ
		model.addAttribute("menu",menu);

		
		return "menu/details";
	}
	

	//2:返回按照热度排序的菜谱list
	@RequestMapping("menu/hot")
	public String queryHotMenu(Model model,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Menu> pageBean = menuService.queryHotMenu(currPage, pageSize);
			//Я�����ݵ�ҳ��չʾ
			model.addAttribute("pageBean",pageBean);

		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}

		return "menu/hot";
	}
	
	//3：返回按照创建时间排序的菜谱list
	@RequestMapping("menu/time")
	public String queryTimeMenu(Model model,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		try {
			PageBean<Menu> pageBean = menuService.queryTimeMenu(currPage, pageSize);
			//Я�����ݵ�ҳ��չʾ
			model.addAttribute("pageBean",pageBean);
		} catch (Exception e) {
			model.addAttribute("msg",e.getMessage());
		}
		

		return "menu/time";
	}
	
}
