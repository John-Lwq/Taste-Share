<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	
<head>
		<meta charset="utf-8">
		<title>Taste&Share-登录</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/common.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" />

</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<span>${msg}</span>
						<form action="toindex" method="post">
							
							<div class="form_text_ipt">
								<input name="username" type="text" placeholder="用户名">
							</div>

							
							
							<div class="form_text_ipt">
								<input name="password" type="password" placeholder="密码">
							</div>

							
							
							<div class="form_check_ipt">
								
								<div class="left check_left">
									<label><input name="remname" type="checkbox"> 下次自动登录</label>
								</div>
								
								<div class="right check_right">
									<a href="#">忘记密码</a>
								</div>
								
							</div>
							
							
							
							<div class="form_btn">
								<input name="denglu" type="submit" value="登录"/>
							</div>
							
							
							
							<div class="form_reg_btn">
								<span>还没有帐号？</span><a href="register.html">马上注册</a>
							</div>
							<div class="form_reg_btn">
								<span>不想登录了？</span><a href="index.html">返回首页</a>
							</div>
							
							
							
						</form>
						
						
						<div class="other_login">
							<div class="left other_left">
								<span>其它登录方式</span>
							</div>
							<div class="right other_right">
								<a href="#"><i class="fa fa-qq fa-2x"></i></a>
								<a href="#"><i class="fa fa-weixin fa-2x"></i></a>
								<a href="#"><i class="fa fa-weibo fa-2x"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>
