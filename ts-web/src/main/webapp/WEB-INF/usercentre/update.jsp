<!--<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>用户信息更改</title>
<style>
	.body{margin:0;}
	.all{width:1320px;margin:0 auto;}
	.span{margin:0;display:block;}
	.top{font-size:18px;}
	.top span{font-weight:bold;}
	img{display:block;margin:0;padding:0;}
	body,h1,h2,h3,p{margin:0 auto;font-weight: normal;}
	a{text-decoration: none;}
	 
	 
	 /*导航栏*/
	.daohang{width: 1920px;margin: 0 auto;margin-top:20px;}
	.daohang a{color: black;}
	.daohang a:hover{color: red;}
	.daohangwenzi{width:1320px;margin:0 auto;}
		/*导航栏模块1*/
		.daohang1_zuo p{float: left;padding-right: 4px;}
		.daohang1_you{float: right;}
		.daohang1_you p{float: left;padding-right: 10px;}
	
		.zhongwen{position:relative;}
	   	.english{width:60px;
					height:20px;
			   	 color: black;
					background-color:#BBBBBB;
					position: absolute;
					left:0;top:18px;
				
					display: none}
		.zhongwen:hover .english{display: block;}

	   	 .jiuyue{position:relative;float: left;}
	   	 .yue{  width:80px;
					height:90px;
			   	 color: black;
					background-color:;
					position: absolute;
					left:0px;top:18px;
				
					display: none}
		.jiuyue:hover .yue{display: block;}
		.yue div{background-color: #BBBBBB}
	    .yue div:hover{color: red;background-color: ;}
		/*导航栏模块2*/
		.daohang2{width:1320px; height: 160px; clear: left;}
		.daohang2_zuo{width:510px;height: 160px;float: left;}
		.daohang2_logo{width:300px;height: 160px;float: left; }
		.daohang2_logo img{margin: 40px auto 0 auto;}
		
		.daohang2_you{width:510px;;height: 160px;float: left;}
		.daohang2_you_da{width: 400px;margin-top: 88px;float: right;}
		.daohang2_you_sousuokuan{height: 30px;}
		.daohang2_you_kuan{position: relative;}
		.daohang2_you_kuan p{color: #908989;line-height: 30px;margin-left: 15px;}
		
		.daohang2_you_kuan input{border:2px solid #908989;outline:none;
								background-color: white;
								color: #666;
								line-height: 30px;
								padding-left: 10px;
								border-radius:30px;width: 320px;height: 30px;}
		.daohang2_you_kuan button{width: 50px;height: 38px;overflow: hidden;padding: 0;background-color: #908989;border-radius:30px;}
		
		.daohang2_you_daohang{margin-top: 10px;}
		.daohang2_you_daohang p{float:left;height: 16px;margin-left: 15px;font-size:14px;}
		/*导航栏模块3*/
		.daohang3{height: 60px;background-color: black;margin-bottom: 30px;}
		.daohang3_daohang{width: 1320px;margin: 0 auto;}
		.daohang3_daohang text{float: left;background-color: aqua;width: 60px;}
		.daohang3_daohang a{color: white;text-align: center;line-height:3px;padding:0 85px;position:relative;}
		.daohang3_daohang span{position: absolute;width: 8px;height:2px;background-color:white;top:24px;left:33px;transition: 0.3s;opacity: 0;margin: 0 auto;}
		.daohang3_daohang a:hover{font-weight: bold;}
		.daohang3_daohang a:hover span{opacity: 1;width: 150px;}
	 
	/*one-one*/
	.one_one{float:left;margin-top:20px;cursor:pointer;}
	.one_one_tupian{background-color:white;margin-bottom:20px;overflow:hidden;hight:800px;position:absolute;left:20%;top:35%;}
	.fenxiang{float:left;width:60px;}
	.weibo,.weixing,.kongjian,.qq {width:30px;;height:30px;float:left;margin-right:10px;background-color:red;}
	.weibo{background-image:url(image2/weibo.png);background-size:cover;}
	.weixing{background-image:url(image2/weixing.png);background-size:cover;}
	.kongjian{background-image:url(image2/kongjian.png);background-size:cover;}
	.qq{background-image:url(image2/qq.png);background-size:cover;}
	.weibo:hover,.weixing:hover,.kongjian:hover,.qq:hover{transform:scale(1.2)}
	.one_one_tupian:hover,.one_two:hover{cursor:pointer;}
	.one_bottom{margin-top:20px;position:absolute;left:20%;top:70%;}
	.one{margin-top:20px;clear:left;}
	.one_one{width:239px;height:600px;float:left;margin-right:30px;overflow:hidden;}
	.one_last{width:239px;height:400px;float:left;overflow:hidden;}
	.one_one img:hover,.one_last img:hover{transform:scale(1.1);}
	
	.six{margin-top:40px;clear:left;}
	.six_six{width:239px;height:400px;float:left;margin-right:10px;overflow:hidden;}
	.six_last{width:239px;height:400px;float:left;overflow:hidden;}
	
	
/*    one-two*/
	.one_two{margin_left:10px;float:left;margin-top:20px;margin-left:10px;}
	.one_two_top,.one_two_bottom{width:100px;height:133px;background-color:grey;margin-bottom:30px;}
		.two{width:1320px;border:1px solid black;height:30px;clear:both;heght:1000px;margin-top:30px;background-color；red;}
	.two{border:none;}
	.one_two_top{background-color:white;background-size:cover;}
	.one_two_bottom{background-color:white;background-size:cover;}
	
	
	
	
	
	/*one-three*/
	
	.one_three{margin-left:100px;float:left;}
	.biaoti{font-size:20px;font-weight:bold;margin-top:20px;}
	.biaoti:hover{text-decoration:underline;}
	.erweima{float:right;}
	.erweima_wenzi{float:right;width:80px;margin-right:50px;margin-left:10px;margin-top:30px;}
	
	hr{width:620px;margin:30px 0;}
	.diaopai,.yanse,.chima{margin-bottom:30px;}
	.cuxiao span,.cuxiao_two span{background:grey;padding:5px;color:white;}
	.cuxiao_two{margin-left:56px;margin-top:10px;}
	
	.yanse span{padding:5px 20px;border:1px solid black;}
	.chima span{background:black;padding:5px 10px;color:white;}
	.shuliang span:nth-child(1),.shuliang span:nth-child(3){background:grey;padding:5px 10px;margin-right:5px;color:white}
	.shuliang span:nth-child(2){border:1px solid grey;padding:5px 30px;margin-right:5px;color:color;}
	
	
	.shoucangjia{width:200px;height:50px;border:1px solid black;text-align:center;float:left;background-image:url(image2/xingxing.png);
	         background-repeat:no-repeat;background-position:40px center;line-height:50px;}
	.shijian{clear:left;line-height:50px;}
	
	
	
	
	/*主体部分*/
	
	.middle{width:1200px;height:800px;border:1px solid black;margin:0 auto;}
	.middle_content{width:820px;margin:0 auto;}
	
	.hengxian_zuo,.hengxian_you{width:300px;border:1px solid #9B9797;float:left;margin-top:15px;}
	.hengxian_you{float:right;}
	.hengxian_wenzi{padding:5px 10px;border:1px solid black;float:left;margin-left:65px;}
	
	/*商品*/
	.shangping{overflow:hidden;clear:both;}
	.one{clear:both;padding:20px 0;}
	.one_wenzi{clear:both;width:100%;margin-top:30px;}
	.one_wenzi  div:nth-child(1),.one_wenzi  div:nth-child(2),.one_wenzi  div:nth-child(3){margin-right:90px;float:left;}
	.xingbie{clear:left;margin-top:5px;}
	
	/*尺码*/
	.chima{overflow:hidden;clear:both;}
	.chima_wenzi{clear:both;margin-top:30px;background-color:#DCF8EA;border:1px solid black;overflow:hidden;padding:5px 10px;}
	.chima_wenzi_one
	 {float:left;width:calc((100%)/5);text-align:center;}
    
	
	 .chima_wenzitwo{clear:both;border:1px solid black;overflow:hidden;padding:5px 10px;}
	
/*	基本信息*/
	.jiben_wenzi{clear:both;}
	.jiben p{text-align:center;padding-top:30px;}
	.jiben .img1{width:810px;height:989px;overflow:hidden;margin-top:10px;}
	.jiben .img2{width:810px;height:1200px;overflow:hidden;margin-top:10px;}
	.jiben .img3{width:810px;height:490px;overflow:hidden;margin-top:10px;}
	.jiben .img4{width:810px;height:550px;overflow:hidden;margin-top:10px;}
	.jiben .img5{width:810px;height:1300px;overflow:hidden;margin-top:10px;}
	
/*商品评价*/
	
	.pingjia_wenzi{clear:both;}
	.pingjia .one{padding-bottom:50px}
	.quanbu{float:left;border:1px black solid;padding:5px 5px;border-bottom:none;}
	.youtu{float:left;padding:5px 5px;background-color:#DCF8EA;border-bottom:1px black solid;}
	 .line{width:654px;height:28px;float:left;border-bottom:1px black solid;}
	
	
	 
	.pingpai_content{border-bottom:1px grey solid;clear:both;overflow:hidden;padding-top:20px;padding-bottom:100px;}
	 .content_zuo,.content_you{width:300px;float:left;}
	 .content_you{float:right;}
	
	/*商品详情*/
	.xiangqing_wenzi{clear:both;margin-bottom:20px;}
	.xiangqing div:nth-child(1){font-weight:bold;margin-bottom:10px;}
	
	/*服务*/
	.buttom{width:1320px;margin:0 auto;margin-top:30px;}
	.fuwu{text-align:center;width:1320px;margin:0 auto;background-image:url(image2/fuwu.png);background-repeat:no-repeat;
	      background-position:600px center;background-color:#DCF8EA;
	      border:1px grey solid;
	      }	
	.fuwu_content{width:820px;
		  padding:100px 250px;
	      border:1px grey solid;
		  overflow:hidden;
	      }	
	.baozheng,.tuihuo,.kefu{float:left;background-image:url(image2/fuwu_baozheng.png);background-repeat:no-repeat;width:calc((100%)/3);text-align:center;background-position:40px center;padding:5px 0;}
	.tuihuo{background-image:url(image2/fuwu_tuihuo.png);}
	.kefu{background-image:url(image2/fuwu_kefu.png);}
	
/*	最近预览*/
	a{text-decoration:none;color:black;}
	.last{clear:both;margin-top:50px;font-weight:bold;}
	.yulan{float:left;margin-right:20px;text-decoration:underline;font-weight:bold;border-bottom: 1px solid black;}
	a:hover{color:crimson}
	.tuijian{float:left;}
	.hr{clear:left;hr:}
	
	/*商品列表*/
	h4,h5,h6{font-size:14px;margin:0;padding:0;font-weight:bold;}
	h5{color:grey;}
	h6{font-size:16px;}
	h4,h6{margin-top:20px;}
	
	/*页脚*/
		.heitiao{background-color: black;height: 10px;}
		.yejiao{height: 500px;background-color: black;margin-top: 10px;}
		.yejiao_text{width: 1320px;margin: 0 auto;}
		.baitiao{width: 1320px;height: 2px;background-color: white;}
		
		/*页脚模块1*/
		.yejiao1 {height: 100px;width: 1200px;margin: 0 auto;position:relative;}
		.yejiao1 a{text-decoration: none;color: red;}
		.yejiao1_text{color:white;float: left;width:400px;text-align: center;margin-top: 20px;}
		.tupian{width: 140px;float: left;}
		.tupian img{float: right;}
		.text{width:200px;float: left;line-height: 54px;}
		/*页脚模块2*/
		.yejiao2{width: 1320px;height: 220px;}
		.zhuti{font-weight: bold;}
		.yejiao2 p{color: white;margin-top: 10px;}
		.yejiao_zhengwen{float: left;margin-left: 100px;}
		.yejiao2_quyu{width: 1100px;margin: 50px auto;}
		.baitiao1{width: 1320px;height: 2px;background-color: white;}
		/*页脚模块3*/
		.yejiao3{margin-top: 30px;}
		.yejiao3 p{color: white;}
		.yejiao3_banquan1{margin: 0 auto;width: 500px;}
		.yejiao3_banquan1 p{margin-left: 10px;float: left;}
		.yejiao3_banquan2{clear: left;width: 750px;margin: 0 auto;}
		.yejiao3_banquan2 p{margin-left: 4px;float: left;margin-top: 10px;}
		.acolor a{color:black;}
		.xiugai button{ /* 按钮美化 */
	     width: 270px; /* 宽度 */
	     height: 40px; /* 高度 */
	     border-width: 0px; /* 边框宽度 */
	     border-radius: 3px; /* 边框半径 */
	     background: #1E90FF; /* 背景颜色 */
	     cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	     outline: none; /* 不显示轮廓线 */
	     font-family: Microsoft YaHei; /* 设置字体 */
	     color: white; /* 字体颜色 */
	     font-size: 17px; /* 字体大小 */
		 margin-left:45px;
		 margin-top:20px

}
        .xiugai button:hover { /* 鼠标移入按钮范围时改变颜色 */
	     background: #5599FF;}
	
</style>
<script type="text/javascript" src="../../staticfile/js/jquery-1.6.2.js"></script>
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
							//部门编号存在
							if (data.result == "true") {
								$("#msg_username").html("该用户名已被占用");
							}
							//部门编号不存在
							else {
								$("#msg_username").html("该用户名可以使用");
							}
							}
							});
					}
				});
				
				
			});
		</script>
			<link rel="stylesheet" href="../../staticfile/css/reset-register.css" />
		<link rel="stylesheet" href="../../staticfile/css/common-register.css" />
		<link rel="stylesheet" href="../../staticfile/css/font-awesome.min.css" />
</head>
<body>
<!--导航栏-->
<div class="daohang">
	<div class="daohangwenzi">
	<div class="daohang1">
		
		<div class="daohang1_you">
			<p><c:if test="${empty cookie.TS_TICKET}" var="flag" scope="session">
			   Hi，请<a href="http://www.ts.com/user/index">[登录]</a>
			   <a href="http://www.ts.com/user/register">[注册]</a>
			</c:if>
			<c:if test="${not flag }">
                                             欢迎，您回来
			   <a href="http://www.ts.com/user/logout">[注销]</a>
			</c:if>
            </p>
			
			<p>&#124;</p>
			<c:if test="${flag }" >
			  <a  href="http://www.ts.com/user/index"><p><img src="../../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p>
			  <p>用户中心</p></a>
			</c:if>
			<c:if test="${not flag }">
			  <a  href="http://www.ts.com/usercentre/index/${roleId }"><p><img src="../../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p>
			  <p>用户中心</p></a>
			</c:if>
		</div>
	</div>
	
	<div class="daohang2">
		<div class="daohang2_zuo">
		    <img src="../../staticfile/images/logo.png" height="100px">
		</div>
		
		<div  class="daohang2_logo">
			
		</div>
		
		<div  class="daohang2_you">
			
			<div class="daohang2_you_da">
				<div class="daohang2_you_sousuokuan">
					<div class="daohang2_you_kuan">
					<form action="http://www.ts.com/search/restaurant_item" method="get">
					<input type="text" name="info" value="${info}">
					</input>
					<button >
						<div class="tijiao">搜索</div>
					</button>
					</form>
					</div>
					
				</div>
			</div>
			
			
		</div>
	</div>
	</div>
	<div class="daohang3">
		<div class="daohang3_daohang">
			<a href="http://www.ts.com/index">&nbsp;&nbsp;首页<span></span></a>				
			<a href="http://www.ts.com/restaurant/list" >美食<span></span></a>					
			<a href="http://www.ts.com/menu/list">菜谱<span></span></a>				
			<a href="http://www.ts.com/article/list"  >食评<span></span></a>	
			<a href="http://www.ts.com/our">关于我们<span></span></a>
				
		</div>
		
	</div>
	
</div>

<!---->

<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							用户信息
						</div>
						<form action="http://www.ts.com/usercentre/toupdate" method="post" onSubmit="return formObj.checkForm()">
							<div class="form_text_ipt" hidden="hidden">
								<input name="userId" type="text" placeholder="用户id" hidden="hidden" value="${user.userId }">
							</div>
							
							用户名<div class="form_text_ipt">
								<input name="username" type="text" placeholder="用户名" value="${user.username }">
								<span id="msg_username"></span>
							</div>
					
							
							
							密码<div class="form_text_ipt">
								<input name="password" type="password" placeholder="密码" value="${user.password }">
								<span></span>
							</div>

							
							
							确认密码<div class="form_text_ipt">
								<input name="password2" type="password" placeholder="确认密码" value="${user.password }" >
								<span></span>
							</div>


							
							昵称<div class="form_text_ipt">
								<input name="nickname" type="text" placeholder="昵称" value="${user.nickname }">
								<span></span>
							</div>
							
							
							生日<div class="form_text_ipt">
								<input name="birthday" type="text" placeholder="生日" value="${user.birthday }">
								<span></span>
							</div>
							
							
							真实姓名<div class="form_text_ipt">
								<input name="name" type="text" placeholder="真实姓名" value="${user.name }">
								<span></span>
							</div>
							
							
							手机号<div class="form_text_ipt">
								<input name="phoneNumber" type="text" placeholder="手机号" value="${user.phoneNumber }">
								<span></span>
							</div>
							
							
							<div class="form_text_sex">
								<td>性别：</td>									
								<td>
									<c:if test="${user.gender==0 }" >
									<input type="radio" name="gender" value="0" checked="checked"/>男
									<input type="radio" name="gender" value="1"/>女
									<span></span>
									</c:if>
									<c:if test="${user.gender==1 }" >
									<input type="radio" name="gender" value="0" />男
									<input type="radio" name="gender" value="1" checked="checked"/>女
									<span></span>
								    </c:if>
								</td>
							</div>
							
							
							<div class="form_text_city">
								<td>居住地 :</td>
								<td>
									<select name="province">
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
							
					        <div class="xiugai button">
								<input  type="submit" value="修改"/>
							</div>
							
						</form>
						
						
				</div>
			</div>
<div class="two">
</div>

			

 	
<!--  盒子内容结束-->
<div class="yejiao3_banquan1">
			<a href="http://www.ts.com/index"><p>返回首页</p></a>
			<p>&#124;</p>
			<a href=""><p>TASTE&SHARE</p></a>
			<p>&#124;</p>
			<a href="http://www.ts.com/our"><p>联系我们</p></a>
			<p>&#124;</p>
			<a href=""><p>隐私条款</p></a>
		</div>

</body>
</html>
