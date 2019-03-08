package com.ts.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.Menu;
import com.ts.common.util.PageBean;
import com.ts.manage.service.MenuService;

@Controller
public class MenuController {

	
	@Autowired
	private MenuService menuService;
	
	// 显示所有菜谱列表
	@RequestMapping("/menulist")
	public String menuList(@RequestParam(defaultValue="1") Integer currentPage,
	   		 @RequestParam(defaultValue="10") Integer pageSize,Model model){
		PageBean pageBean = menuService.menuList(currentPage, pageSize);
		model.addAttribute("pageBean", pageBean);
		return "menu_manage";
	}
	
	// 跳转更新menu的页面
	@RequestMapping("/menuupdate")
	public String updateMenu(Long menuId,Model model){
		Menu menu = menuService.queryMenuById(menuId);
		model.addAttribute("menu", menu);
		return "menu_update";
		
	}
	
	// 更新menu 重定向list
	@RequestMapping("/menutoupdate")
	public String toupdate(Menu menu){
		menuService.updateMenu(menu);
		return "redirect:/menulist";
	}
	
	// 跳转更新menu的页面
		@RequestMapping("/menuview")
		public String viewMenu(Long menuId,Model model){
			Menu menu = menuService.queryMenuById(menuId);
			model.addAttribute("menu", menu);
			return "menu_view";
			
		}
		
		
		@RequestMapping("/menudelete")
		public String deleteMenu(Long menuId){
			menuService.deleteMenu(menuId);
			return "redirect:/menulist";
		}
	
	
	
}
