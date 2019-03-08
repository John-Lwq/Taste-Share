package com.ts.sso.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.codec.digest.DigestUtils;

import com.ts.common.util.ObjectUtil;
import com.ts.common.vo.SysResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.ts.common.pojo.User;
import com.ts.common.redis.RedisClusterService;
import com.ts.sso.mapper.UserMapper;

import net.sf.json.JSONObject;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public void saveUser(User user) throws Exception {
		try {
			user.setCreated(new Date());
			user.setUpdated(user.getCreated());
			user.setPassword(DigestUtils.md5Hex(user.getPassword()));
			userMapper.insertSelective(user);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	
	//shiro框架验证用户的权限
	public List<String> findModuleNameByUserId(Long userId) {
		return userMapper.findModuleNameByUserId(userId);
	}

	//shiro判断用户是否存在
	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);
	}

	@Autowired
	private RedisClusterService redis;
	

	//登录之后,需要将本人的信息放入redis缓存中
	public String doLogin(User user) throws JsonProcessingException {
	    //如果能够调用这个方法,说明shiro已经登录成功,只需将其存入缓存中
	    //将user信息json存入redis,避免session共享问题
		String ticket=DigestUtils.md5Hex("TS_TICKET_"+System.currentTimeMillis()+user.getUsername());
		String userJson=ObjectUtil.mapper.writeValueAsString(user);
		//存放时间为一小时,超过时间需要重新验证登陆信息
		redis.set(ticket,userJson,3600);
		return ticket;
	}


	public JSONObject checkParam(String param) {
		//逻辑判断type==1,查询username
		//type==2,查询phone
		User _user=new User();
		JSONObject jsonObject = new JSONObject();
		int count=0;
			_user.setUsername(param);
			count=userMapper.selectCount(_user);
			if(count==0){
				jsonObject.put("result", "false");
			}else
			jsonObject.put("result", "true");

		return jsonObject;
	}


	public String queryUserJson(String ticket) {
		return redis.get(ticket);
	}


	public void logout(String ticket) {
		redis.set(ticket,"",1);
	}

	
}
