package com.ts.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Article;
import com.ts.common.pojo.Menu;
import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;
import com.ts.web.service.EsService;

@Controller
public class EsController {

	@Autowired
	private EsService esService;

	// 通过餐厅名字查询餐厅
	@RequestMapping("search/restaurant_item")
	public String searchRestaurantByShopName(String info,@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize,Model model) {
		try{
		PageBean<Restaurant> pageBean = esService.searchRestaurantByShopName(info, currPage, pageSize);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("info", info);
		}catch (Exception e) {
			model.addAttribute("msg",e.getMessage());
		}
		
		return "restaurant/search";
	}

	// 通过name和assort两个域来查找menu
	@RequestMapping("search/menu_item")
	public String searchMenuByTitle(String info,@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize,Model model) throws Exception{
		PageBean<Menu> pageBean=esService.searchMenuByTitle(info,currPage,pageSize);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("info", info);
		return "menu/search";
	}

	
	  // 通过name和assort两个域来查找article
		@RequestMapping("search/article_item")
		public String searchArticleByContent(String info,@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "10") Integer pageSize,Model model) throws Exception{
			PageBean<Article> pageBean=esService.searchArticleByContent(info,currPage,pageSize);
			model.addAttribute("pageBean", pageBean);
			return "menu/search";
		}
}
