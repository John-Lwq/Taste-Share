package com.ts.web.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.common.pojo.User;
import com.ts.common.service.HttpClientService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.vo.HttpResult;
import com.ts.common.vo.SysResult;
@Service
public class UserService {

	@Autowired
	private HttpClientService client;
	
	//web前端的用户注册,通过client发送给sso,实现用户的注册
	public void register(User user) throws Exception {
		String url="http://sso.ts.com/user/register";
		Map<String,Object> map=new HashMap<>();
		map.put("username", user.getUsername());
	    map.put("password", user.getPassword());
	    map.put("nickname", user.getNickname());
		map.put("birthday", user.getBirthday());
		map.put("gender", user.getGender());
		map.put("phoneNumber", user.getPhoneNumber());
		map.put("name", user.getName());
		map.put("location", user.getLocation());
		map.put("roleId", user.getRoleId());
		map.put("status", 1);
		client.doPost(url, map);
/*		String jsonData=response.getBody();
		SysResult result=ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		Integer status = result.getStatus();
		if(status!=200){
			throw new Exception("注册用户失败,请稍后再试");
			}*/
	}

	public String doLogin(User user) throws Exception {
		if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword())){
			return "";
		}
		String url="http://sso.ts.com/user/login";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u", user.getUsername());
		map.put("p", user.getPassword());
		HttpResult response = client.doPost(url, map);
		String jsonData=response.getBody();
		//{"status":200,"msg":"ok"
		//"data":"213lhwei23lndsiy23o"}
		//从json中解析data的数据 ticket
		SysResult result=ObjectUtil.mapper.readValue(jsonData, SysResult.class);
		//字符串内容,在mapper传递转化过程,会添加额外的""   "json"
		
		String ticket=(String)result.getData();
		//如果登录失败有可能是"" "null"
		return ticket;
	}

	public void logout(String ticket) throws Exception {
		String url="http://sso.ts.com/user/logout";
		Map<String, Object> map=new HashMap<>();
		map.put("ticket", ticket);
		client.doGet(url, map);
	}

	public User toUserCentre(String result) throws Exception {
		String url="http://manage.ts.com/usercentre/getTicket/"+result;
		String jsonData = client.doGet(url);
		User user = ObjectUtil.mapper.readValue(jsonData, User.class);
		return user;
	}

}
