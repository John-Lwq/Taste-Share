package com.ts.sso.shiro;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ts.common.pojo.User;
import com.ts.sso.service.UserService;


//原材料realm
public class AuthRealm extends AuthorizingRealm{

	@Autowired
	private UserService userService;
	
	
	//权限认证的重写,根据具体的业务逻辑完成方法的定义
	//查询数据库中,档期那用户对应的权限模块
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		//获取当前用户的信息
		Subject subject=SecurityUtils.getSubject();
		User user=(User) subject.getPrincipal();
		//获取用户的id信息和username/password信息
		Long userId=user.getUserId();
		String username=user.getUsername();
		String password=user.getPassword();
		//获取数据库中userId对应的模块名称
		List<String> pList=userService.findModuleNameByUserId(userId);
		
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		info.addStringPermissions(pList);
		
		return info;
	}

	
	//用户登录的认证,当前的用户的用户名和密码,
	//拿到密码之后,需要进行加密码模块的验证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获取用户名和密码:存放在登录认证的令牌中
		UsernamePasswordToken logintoken=(UsernamePasswordToken) token;
		//通过令牌对象,获取前端页面输入的用户名信息
		String username=logintoken.getUsername();
		//根据username去数据库查询当前用户是否存在
		//手动准备的原材料信息
		User user=userService.findUserByUsername(username);
        
		//返回值类型为AuthenticationInfo
		//结果只是根据用户名去查询了数据库
		//得到正式的密码,因为是从user处取得的
		/*
		 * principals:表示真实的用户user
		 * hashedCredentials:表示user对象的密码
		 * credentialsSalt 原材料的类名String
		 */
		AuthenticationInfo info=new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
		
		return info;
	}

}
