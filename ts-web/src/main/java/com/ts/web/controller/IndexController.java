package com.ts.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;

@Controller
public class IndexController {

	/*//根据前台发来的itemId来判断跳转到那个主页
	@RequestMapping("/item/{itemId}")
	public String goItem(@PathVariable Long itemId){
		if(itemId==1){
			return "restaurant";
		}else if(itemId==2){
			return "menu";
		}else
			return "article";
	}*/
	
	@RequestMapping("/")
	public String goIndex(){
		return "index";
	}

	@RequestMapping("/index")
	public String goIndex2(){
		return "index";
	}
	
	@RequestMapping("/menu/list")
	public String goMenu(){
		return "menu/list";
	}
	
	@RequestMapping("our")
	public String goOur(){
		return "our";
	}

}
