package com.ts.manage.controller;

import java.io.IOException;
import java.util.List;

import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ts.common.pojo.User;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.UserService;

@Controller
public class WebUserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RedisClusterService redis;
	
	
	
	

	// 前台通过userId查询用户信息
	@RequestMapping("users/{userId}")
	@ResponseBody
	public User queryUserByUserId(@PathVariable Long userId) throws Exception {
		User user;

		String key = "user_" + userId;
		String value = "";
		if (redis.exists(key)) {
			value = redis.get(key);
			user = ObjectUtil.mapper.readValue(value, User.class);
		} else {
			user = userService.selectOne(userId);
			value = ObjectUtil.mapper.writeValueAsString(user);
			redis.set(key, value);
		}
		return user;
	}

	@RequestMapping("users/update")
	@ResponseBody
	public SysResult updateUserByUserId(String user) throws Exception  {
		User user1 = ObjectUtil.mapper.readValue(user, User.class);
		try{
			String key="user_"+user1.getUserId();
			String value="";
			int i=userService.updateUser(user1);
			if(i>0){
				if(redis.exists(key)){
					redis.del(key);
				}
				User user2 = userService.selectOne(user1.getUserId());
				value=ObjectUtil.mapper.writeValueAsString(user2);
				redis.set(key, value);
				return SysResult.oK();
			}else{
				return SysResult.build(201, "更新用户信息失败");
			}
			}catch(Exception e){
				e.printStackTrace();
				return SysResult.build(201, "更新用户信息失败");
			}
	}


	// 通过userid来查询用户的评论
	@RequestMapping("users/comment/{userId}")
	@ResponseBody
	public PageBean queryCommentByUserId(@PathVariable Long userId, @RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {

		return userService.queryCommentByUserId(userId, currPage, pageSize);
	}

	@RequestMapping("/usercentre/getTicket/{result}")
	@ResponseBody
	public String queryUser(@PathVariable String result) {
		return userService.queryUser(result);

	}

}
