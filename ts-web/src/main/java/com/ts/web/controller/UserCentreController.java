package com.ts.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Restaurant;
import com.ts.common.pojo.User;
import com.ts.common.util.CookieUtils;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.web.service.UserCentreService;

@Controller
public class UserCentreController {
	
	@Autowired
	private UserCentreService userCentreService;
	
	//跳转用户中心页面
	@RequestMapping("usercentre/index/{roleId}")
	public String toUserCentre(@PathVariable("roleId")Integer roleId,Model model) throws Exception{
		if(roleId==1){
		return "usercentre/index";
		}else
			return "managercentre/index";
	}
	
	
	
	//用户信息更新页面
	//用户信息的回显
	@RequestMapping("usercentre/update/{userId}")
	public String queryUser(@PathVariable Long userId,Model model) throws Exception{
		User user=userCentreService.queryUser(userId);
		//携带数据到页面展示
		model.addAttribute("user",user);		
		return "usercentre/update";
	}
	
	//将用户的信息封装后发送给后台,之后发送给页面
	//可能发生错误
	@RequestMapping("usercentre/toupdate")
	public String updateUser(User user,Model model) throws Exception{
		try {
			System.out.println(user);
			userCentreService.updateUser(user);
			model.addAttribute("msg", "修改用户成功");
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		return "usercentre/index";
	}
	
	//通过userid来查询用户的评论,
	@RequestMapping("usercentre/mycomment/{userId}")
	public String userComment(@PathVariable Long userId,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize,Model model) throws Exception{
		
			try {
				PageBean<Desc> pageBean=userCentreService.userComment(userId,currPage,pageSize);
				//将获取的数据放入作用域中,返回给页面
				model.addAttribute("pageBean", pageBean);
			} catch (Exception e) {
				//如果没有pagebean,直接返回一个错误信息
				model.addAttribute("msg",e.getMessage());
			}
			return "usercentre/mycomment";
	}
	
	
	//查看我的收藏
	@RequestMapping("usercentre/mycollection/{userId}")
	 public String myCollection(@PathVariable Long userId,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize,Model model) throws Exception{
		try {
			PageBean<Restaurant> pageBean=userCentreService.queryMyCollection(userId,currPage,pageSize);
			//将获取的数据放入作用域中,返回给页面
			model.addAttribute("pageBean", pageBean);
		} catch (Exception e) {
			//如果没有pagebean,直接返回一个错误信息
			model.addAttribute("msg", e.getMessage());
		}	
			return "usercentre/mycollection";
	}

	//餐厅店主查看自己餐厅的信息
	@RequestMapping("managercentre/myrestaurant/{userId}")
	public String updateRestaurant(@PathVariable Long userId,Model model) throws Exception{
		
		Restaurant restaurant = userCentreService.queryRestaurant(userId);
			
			model.addAttribute("restaurant", restaurant);
		return "managercentre/myrestaurant";
	}
	
	//跳转餐厅户主修改页面
	//跳转餐厅页面,并且数据回显
	//能调用这个方法的一定是餐厅店主,肯定会有餐厅
	@RequestMapping("managercentre/update/{userId}")
	public String toupdateRestaurant(@PathVariable Long userId,Model model) throws Exception{
		
		Restaurant restaurant = userCentreService.queryRestaurant(userId);
			
			model.addAttribute("restaurant", restaurant);
		return "managercentre/update";
	}
	
	//修改餐厅信息
	@RequestMapping("managecentre/restaurants/update")
	public String updateRestaurant(Restaurant restaurant,Model model) throws Exception{
		try {
			userCentreService.updateRestaurant(restaurant);
			
			model.addAttribute("msg", "修改餐厅信息成功");
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		//返回商家的用户页面
		return "managercentre/index";
	}
	
	
	//餐厅主人查看自己餐厅的评论,没有删除选项
	@RequestMapping("managercentre/mycomment/{userId}")
	public String myComment(@PathVariable Long userId,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize,Model model) throws Exception{
		try {
			PageBean<Desc> pageBean=userCentreService.myComment(userId,currPage,pageSize);
			model.addAttribute("pageBean", pageBean);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		//重定向到商家的用户页面
		return "managercentre/mycomment";
	}
	
	//删除用户个人的评论
	@RequestMapping("usercentre/deleteDesc/{descId}")

	public String deleteDesc(@PathVariable Long descId,Model model){
		try {
			userCentreService.deleteDesc(descId);
			model.addAttribute("msg", "评论删除成功");
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		//重定向到原本的用户中心
		return "usercentre/index";
	}
	
	
	//删除个人的店铺收藏
	@RequestMapping("usercentre/delete/{userId}/{restaurantId}")
	public String deleteCollection(@PathVariable("userId") Long userId,@PathVariable("restaurantId") Long restaurantId,Model model){
		try {
			userCentreService.deleteCollection(userId,restaurantId);
			model.addAttribute("msg", "删除收藏成功");
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		return "usercentre/index";
	}
	
}
