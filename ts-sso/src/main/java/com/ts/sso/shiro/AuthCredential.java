package com.ts.sso.shiro;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.springframework.stereotype.Component;


//shiro安全中心根据用户的密码,进行内部的密码规则的校验
@Component
public class AuthCredential extends SimpleCredentialsMatcher{
	
	//验证,加密
	//内部的密码规则
	public boolean doCredentialsMatch(AuthenticationToken token,AuthenticationInfo info) {
		//通过令牌获取登陆的对象
		UsernamePasswordToken usertoken=(UsernamePasswordToken) token;
		//获取用户名和密码
		String username=usertoken.getUsername();
		//此时获得的密码还是明文密码
		String password=String.valueOf(usertoken.getPassword());

		//因为数据库中的密码是用md5算法加密过的
		//使用md5算法对密码进行加密
		//使用工具类
		String md5password=DigestUtils.md5Hex(password); 
		//System.out.println(md5password);
		//token的密码是以char[]形式存储的
		usertoken.setPassword(md5password.toCharArray());
		
		//调用父类的内部校验规则,令牌和info信息
		//此处应该是令牌与数据库查到的信息进行匹配验证,
		return super.doCredentialsMatch(usertoken, info);
	}; 

}
