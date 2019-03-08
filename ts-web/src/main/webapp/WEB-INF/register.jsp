<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<title>Taste&Share-注册</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/common-register.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery-1.4.2.js"></script>
		<script type="text/javascript">
			var formObj={
				"setMsg":function(name,msg){
					$("input[name='"+name+"']").nextAll("span").html(msg).css("color","red");
				},
				"checkNull":function(name,msg){
					var value=$("input[name='"+name+"']").val();
					if($.trim(value)==""){
						this.setMsg(name,msg);
						return false;
					}else{
						this.setMsg(name,"");
						return true;
					}
				},
				"checkPassword":function(name,msg){
					var password=$("input[name='"+name+"']").val();
					var password2=$("input[name='"+name+"2']").val();
					if($.trim(password)!=""&&$.trim(password2)!=""){
						if(password!=password2){
							this.setMsg(name+"2",msg);
							return false;
						}else{
							this.setMsg(name+"2","");
							return true;
						}
					}
					return false;
				},
				"checkForm":function(){
					var flag=true;//控制表单是否提交的变量
					// 非空验证
					flag=this.checkNull("username","用户名不能为空")&&flag;
					flag=this.checkNull("password","密码不能为空")&&flag;
					flag=this.checkNull("password2","确认密码不能为空")&&flag;
					flag=this.checkNull("nickname","昵称不能为空")&&flag;
					flag=this.checkNull("birthday","生日不能为空")&&flag;
					flag=this.checkNull("name","姓名不能为空")&&flag;
					flag=this.checkNull("phoneNumber","手机号不能为空")&&flag;
					flag=this.checkNull("code","验证码不能为空")&&flag;
					// 两次密码一致验证
					flag=this.checkPassword("password","两次密码应该一致")&&flag;
					return flag;
				}
			};
			
			$(function(){
				// 为每一个input添加一个失去焦点的事件
				$("input[name='username']").blur(function(){
					formObj.checkNull("username","用户名不能为空");
				});
				$("input[name='password']").blur(function(){
					formObj.checkNull("password","密码不能为空");
				});
				$("input[name='password2']").blur(function(){
					formObj.checkNull("password2","确认密码不能为空");
					formObj.checkPassword("password","两次密码应该一致");
				});
				$("input[name='nickname']").blur(function(){
					formObj.checkNull("nickname","昵称不能为空");
				});
				$("input[name='birthday']").blur(function(){
					formObj.checkNull("birthday","生日不能为空");
				});
				$("input[name='name']").blur(function(){
					formObj.checkNull("name","真实姓名不能为空");
				});
				$("input[name='phoneNumber']").blur(function(){
					formObj.checkNull("phoneNumber","手机号不能为空");
				});
				$("input[name='code']").blur(function(){
					formObj.checkNull("code","验证码不能为空");
				});
				
				
				
				// ajax校验
				$("input[name='username']").blur(function(){
					var username=$(this).val();
					var flag=formObj.checkNull("username","用户名不能为空");
					if(flag){
						// 发送一个AJAX请求
						//var url="http://sso.ts.com/user/register";
						// $.get(url,data,callback)
						// function方法，其参数result，就是服务器返回的内容
						//$.get(url,{"username":username},function(data){
							/* $("#msg_username").html(result); */
							//if (data.result == "true") {
								//$("#msg_username").html("该用户名已被占用");
							//}
							//部门编号不存在
							//else {
								//$("#msg_username").html("该用户名可以使用");
							//}
						//});
						$.ajax({
							url:"http://sso.ts.com/user/check",
							data:{"username":username},//data中存放的为deptId的key 和 value
							type:"get",//请求的发送方式
							async : true,//异步请求
							dataType:"jsonp",//结果的返回值类型
							jsonp: "callback",
							success:function (data) {
							if (data.result == "true") {
								$("#msg_username").html("该用户名已被占用");
							}
							else {
								$("#msg_username").html("该用户名可以使用");
							}
							}
							});
					}
				});
				
				// 添加一个click事件,点击按钮刷新验证码图片
				$("#yzm_imgbutton").click(function(){
					// 每次点击，获取当前事件的毫秒值
					var dateStr=new Date().getTime();
					// 修改组件的src属性的值
					$(this).attr("src","http://www.ts.com/drawImg?time="+dateStr);
				});
			});
		</script>
</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							注册
						</div>
						<span>${msg}</span>
						<form action="toregister" method="post" onSubmit="return formObj.checkForm()">
							
							<div class="form_text_ipt">
								<input name="username" type="text" placeholder="用户名">
								<span id="msg_username"></span>
							</div>
					
							
							
							<div class="form_text_ipt">
								<input name="password" type="password" placeholder="密码">
								<span></span>
							</div>

							
							
							<div class="form_text_ipt">
								<input name="password2" type="password" placeholder="确认密码">
								<span></span>
							</div>


							
							<div class="form_text_ipt">
								<input name="nickname" type="text" placeholder="昵称">
								<span></span>
							</div>
							
							
							<div class="form_text_ipt">
								<input name="birthday" type="text" placeholder="生日">
								<span></span>
							</div>
							
							
							<div class="form_text_ipt">
								<input name="name" type="text" placeholder="真实姓名">
								<span></span>
							</div>
							
							
							<div class="form_text_ipt">
								<input name="phoneNumber" type="text" placeholder="手机号">
								<span></span>
							</div>
							
							
							<div class="form_text_sex">
								<td>性别：</td>									
								<td>
									<input type="radio" name="gender" value="0" checked="checked"/>男
									<input type="radio" name="gender" value="1"/>女
									<span></span>
								</td>
							</div>
							<div class="form_text_sex">
								<td>身份：</td>									
								<td>
									<input type="radio" name="roleId" value="2" checked="checked"/>食客用户
									<input type="radio" name="roleId" value="1"/>商家
									<span></span>
								</td>
							</div>
							
							<div class="form_text_city">
								<td>居住地 :</td>
								<td>
									<select name="location">
										<option value="bj">北京</option>
										<option value="tj">天津</option>
										<option value="sh">上海</option>
										<option value="cq">重庆</option>
										<option value="hb">河北</option>
										<option value="sx">山西</option>
										<option value="ln">辽宁</option>
										<option value="jl">吉林</option>
										<option value="hlj">黑龙江</option>
										<option value="js">江苏</option>
										<option value="zj" selected='selected'>浙江</option>
										<option value="aw">安徽</option>
										<option value="fj">福建</option>
										<option value="js">江西</option>
										<option value="sd">山东</option>
										<option value="hn">河南</option>
										<option value="aw">湖北</option>
										<option value="hn">湖南</option>
									</select>
								</td>
							</div>
							
							
							<div class="form_text_code">
								<td>验证码：</td>									
								<td>
									<input name="code" type="text"  id="code" />
									<img src="/drawImg" width="60px" height="30px"/>
									<input id="yzm_imgbutton" type="button" value="刷刷更健康"/>
									<span></span>
								</td>	
							</div>
							
							
							
							<div class="form_btn">
								<input name="zhuce" type="submit" value="注册"/>
								<input name="chongzhi" type="reset" value="重置"/>
							</div>

							
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="login.html">马上登录</a>
							</div>
							<div class="form_reg_btn">
								<span>返回首页？</span><a href="../服装网页/index.html">返回首页</a>
							</div>
							
							
						</form>
						
						<div class="other_login">
						<div class="left other_left">
							<span>其它登录方式（暂不支持）</span>
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
