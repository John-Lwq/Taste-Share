<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	
<head>
		<meta charset="utf-8">
		<title>Taste&Share-登录</title>
		<link rel="stylesheet" href="css/login_css/reset.css" />
		<link rel="stylesheet" href="css/login_css/common.css" />
		<link rel="stylesheet" href="css/login_css/font-awesome.min.css" />

</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							后台管理登录平台
						</div>
						<form action="/toindex" method="post">
							
							
							<span>${msg}</span>
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
								<span>不想登录了？</span><a href="../服装网页/index.html">返回首页</a>
							</div>
							
							
							
						</form>
						
					</div>
				</div>
			</div>
		</div>

	</body>
</html>
