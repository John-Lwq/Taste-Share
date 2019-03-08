<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet" href="../../staticfile/css/swiper.min.css">
<meta charset="utf-8">
<title>美食</title>
<style>
	body{margin:0;}
	.all{width:1320px;margin:0 auto;overflow:hidden;}
	img{display:block;margin:0;padding:0;}
	<meta name="viewport">
	.all{width:1320px;margin:0 auto;border:1px blue solid;overflow:hidden;}
	.left{width:170px;height:900px;padding-left:100px;float:left;box-sizing:border-box；}
	dl,dd{margin: 0;padding :0;}
	
	body,h1,h2,h3,p{margin:0 auto;font-weight: normal;}
	a{text-decoration: none;}
	img{display:block;}
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
	
	/*a标签*/
		a:hover{color:crimson}
	    a{text-decoration:none;color:black;}
		.one_one img:hover,.one_last img:hover{transform:scale(1.1);}
	   .yeshu a:hover{background:black;color:white;padding:5px;}
	
	/*默认*/
	
	.right_middle{height:50px;background-color:antiquewhite;margin:0 auto;width:986px;}
	.right_middle dd{font-size:16px;font-weight:blod;float:left;margin-right:30px;line-height:50px;}
	.right_middle dl:nth-child(2){float:right;line-height:50px;}
	.right_middle dt{font-size:16px;font-weight:blod;float:left;margin-right:30px;line-height:50px;}
	.right_middle span{padding:5px 20px;border:1px black solid;background-color:white;}
	
	/*悬浮  */
	.suo{width:1320px;height:640px;margin:0 auto;margin-bottom:40px;}
.suo_box{width: 410px;height: 640px;float: left;margin:0px 15px 0px 15px;}
.suo_box:nth-child(5){margin:0;}
.suo_box img{background-color:white;opacity:0.7;transition:0.5s;}
.suo_box img:hover{opacity:1;transform:scale(1.1);}
	/*商品展示*/
	
	
	h4,h5,h6{font-size:14px;margin:0;padding:0;font-weight:bold;}
	h5{color:grey;}
	h6{font-size:16px;}
	h4,h6{margin-top:20px;}
	
	
	.one{margin-top:40px;clear:left;}
	.one_one{width:239px;height:400px;float:left;margin-right:10px;overflow:hidden;}
	.one_last{width:239px;height:400px;float:left;overflow:hidden;}
	
	/*.two_same{width:239px;height:400px;float:left;background-color:chocolate;margin-right:10px;margin-top:10px;}
	.two_last{width:239px;height:400px;float:left;background-color:chocolate;margin-top:10px;}*/
	
	
	/*底部*/
	.right_middle{margin-top:20px;}
	.yeshu{text-align:center;margin-top:100px;}
	 .hengxian{width:970px; height:50px;border-bottom:1px black solid;clear:left;}
	.yeshu a{margin:0 20px;}
	.yeshu a:nth-child(1){color:white;overflow:hidden;background-color:black;padding:5px;}
	
	
	
	/*页脚*/
		.heitiao{background-color: black;height: 10px;margin-top: 30px;}
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
		.yejiao3_banquan1{margin: 0 auto;width: 400px;}
		.yejiao3_banquan1 p{margin-left: 10px;float: left;}
		.yejiao3_banquan2{clear: left;width: 750px;margin: 0 auto;}
		.yejiao3_banquan2 p{margin-left: 4px;float: left;margin-top: 10px;}
	</style>
	<script  type="text/javascript" src="../../staticfile/js/jquery-1.6.2.js"></script>
		 <script> 
		  $(function () {
			 
			//最终目的是： list?currentPage=1&pageSize=动态的
			 $(".fenye").click(function() {
				//获取下拉框中的每一页的数据量
				var pagesize = $("#pageSize option:selected").val();
				//获取当前a标签的请求路径 
				var this_url = $(this).attr("href");
				//对url路径进行重新的赋值 list?currentPage=1&pageSize=10
				$(this).attr("href",this_url+"&pageSize="+pagesize);
			}) 
		})  
   </script>
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
			  <a  href="http://www.ts.com/user/index"><p><img src="../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p>
			  <p>用户中心</p></a>
			</c:if>
			<c:if test="${not flag }">
			  <a  href="http://www.ts.com/usercentre/index/${sessionScope.roleId}"><p><img src="../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p>
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
			<a href="http://www.ts.com/restaurant/list" style="color: red;">美食<span></span></a>					
			<a href="http://www.ts.com/menu/list">菜谱<span></span></a>				
			<a href="http://www.ts.com/article/list" >食评<span></span></a>	
			<a href="http://www.ts.com/our">关于我们<span></span></a>
				
		</div>
		
	</div>
	
</div>
<div class="suo">
	    <div class="suo_box">
			<a href="http://www.ts.com/restaurant/hot"><img src="../../staticfile/images/410x540.5(1).png"></a>
		</div>
	
		<div class="suo_box">
			<a href="http://www.ts.com/restaurant/type"><img src="../../staticfile/images/410x540.7 (2).png"></a>
	    </div>
	
			<div class="suo_box">
				<a href="http://www.ts.com/restaurant/time"><img src="../../staticfile/images/410x540.6(1).png"></a>
			</div>
					
	

   </div>


<div class="all">

	<table border="0"  cellpadding="0"  cellspacing="0"  width="100%" >
			<tr>
				<td ><h1>找到 ${pageBean.totalCount} 条记录, 第 ${pageBean.currPage} 页 </h1></td>
				<td align="right" >
				<table border="0"  cellpadding="1"  cellspacing="2" >
					<tr>
					<td>
						<a class="fenye"  href="http://www.ts.com/search/restaurant_item?info=${info}&currPage=1">
						<img src="../../staticfile/images/table/firstPageDisabled.gif" height="40" width="40" style="border:0"  alt="第一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="http://www.ts.com/search/restaurant_item?info=${info}&currPage=${pageBean.currPage-1<=0? 1 : pageBean.currPage-1 }">
						<img src="../../staticfile/images/table/prevPageDisabled.gif" height="40" width="40"  style="border:0"  alt="上一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="http://www.ts.com/search/restaurant_item?info=${info}&currPage=${pageBean.currPage+1>=pageBean.totalPage? pageBean.totalPage : pageBean.currPage+1 }">
						<img src="../../staticfile/images/table/nextPage.gif" height="40" width="40"  style="border:0"  title="下一页"  alt="下一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="http://www.ts.com/search/restaurant_item?info=${info}&currPage=${pageBean.totalPage }">
						<img src="../../staticfile/images/table/lastPage.gif" height="40" width="40" style="border:0"  title="最后页"  alt="最后页" />
						</a>
					</td>
					
					<td >
						<select name="pageSize" id="pageSize" style="width:60px;height:40px;text-align:center">
							<option value="10" <c:if test="${pageBean.pageSize==10 }">selected="selected"</c:if> >10</option>
							<option value="20" <c:if test="${pageBean.pageSize==20 }">selected="selected"</c:if> >20</option>
							<option value="30" <c:if test="${pageBean.pageSize==30 }">selected="selected"</c:if> >30</option>
						</select>
					</td>
					</tr>
				</table></td>
			</tr>
		</table>
		
		
 <%--    <c:forEach begin="1" end="6" step="1"> --%>
			<div class="one">
			
				<c:forEach  begin="0" end="30" step="1" items="${pageBean.pageList}" var="item">
						<a href="http://www.ts.com/restaurant/details?restaurantId=${item.restaurantId}">
						<div class="one_one">
							<img src="${item.defaultPic}" />
								<h4>${item.shopName}</h4>
								<%-- <h5>${item.type}</h5> --%>
								<h5>来自吃货的评分：${item.tasteScore}</h5>
								
						</div>
						</a>
				</c:forEach>
			</div>
	<%-- 	</c:forEach> --%>
		 
		 
	 </div>
		 
		  
	 
  ${msg}
	

		<div class="yejiao3_banquan1">
			<a href="http://www.ts.com/index"><p>返回首页</p></a>
			<p>&#124;</p>
			<a href=""><p>TASTE&SHARE</p></a>
			<p>&#124;</p>
			<a href="http://www.ts.com/our"><p>联系我们</p></a>
			<p>&#124;</p>
			<a href=""><p>隐私条款</p></a>
		</div>
		<!-- <div class="yejiao3_banquan2">
			<p>CopyRight&nbsp;2010-2018&nbsp;深圳你与我文化传播有限公司</p>
			<p>&#124;</p>
			<a href=""><p>版权所有</p></a>
			<p>&#124;</p>
			<p>经验许可证编号；广B-31245487</p>
		</div>
	 -->
	
	



</body>
</html>
