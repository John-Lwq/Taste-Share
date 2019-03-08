<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet" href="css/swiper.min.css">
<meta charset="utf-8">
<meta name="referrer" content="never">
<title>食评</title>
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
		
		/*商品*/
	.shangpingqu{width: 1320px;height: 640px;margin: 0 auto;margin-bottom:40px;}
	.shangpingtupian{width: 410px;height: 640px;float: left;margin:0px 15px 0px 15px;}
	.shangpin{width: 410px;height: 540px;background-color: aquamarine;overflow: hidden}
	.shangpin_text{width: 410px;height: 100px;}
	.shangpin_text p{padding-top: 20px;}
	.shangpin img{background-color:black;opacity:0.4;transition:0.5s;}
	.shangpin:hover img{opacity:1;transform: scale(1.1);}
	
	/*所有部分*/
.suo{width:1320px;height:640px;margin:0 auto;margin-bottom:40px;}
.suo_box{width: 410px;height: 640px;float: left;margin:0px 15px 0px 15px;}
.suo_box:nth-child(5){margin:0;}
.suo_box img{background-color:white;opacity:0.7;transition:0.5s;}
.suo_box img:hover{opacity:1;transform:scale(1.1);}

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
	
	/*a标签*/
		a:hover{color:crimson}
	    a{text-decoration:none;color:black;}
		.one_one img:hover,.one_last img:hover{transform:scale(1.1);}
	   .yeshu a:hover{background:black;color:white;padding:5px;}
	.
	
	
	/*左边*/
	.left{width:170px;background-color:red;overflow:hidden;height:800px;}
	.left_top{font-size:16px;font-weight:bold;font-family:思源黑体}
	.left_top span{color:grey;}
     dl,dt,dd{margin:0;}
	.left_middle{margin-top:50px;}
	.left_middle dd{font-weight:bold;font-size:16px;margin-bottom:5px;}
	.left_middle dt{color:grey;font-size:12px;margin-left:10px;}
	.left_bottom{margin-top:50px;}
	.left_bottom dd{font-weight:bold;font-size:16px;margin-bottom:5px;}
	.left_bottom dt{font-size:14px;margin-left:30px;}
	
	/*右边*/
	.right_right dd:hover{text-decoration: underline;}
	 dl,dt,dd{margin:0;}
	.right{width:986px;float:left;}
	.right_top{width:986px;height:440px;border:1px #C1BCBC solid;margin-bottom:20px;}
	.right_left{padding-left:16px;padding-right:50px;width:80px;line-height:50px;font-weight:bold;float:left;}
	.yanse .right_left,.pingpai .right_left,.chicun .right_left{padding-left:16px;padding-right:50px;width:80px;line-height:40px;font-weight:bold;float:left;}
	
	.right_right{color:grey;margin-right:50px;float:left;line-height:50px;}
	 .yanse .right_right,.chicun .right_right,.pingpai .right_right{color:grey;margin-right:50px;float:left;box-sizing:border-box;line-height:40px;}
	
	
	.tiaojian,.xingbie,.renqun,.jiage,.pingpai,.yanse,.chicun{width:986px;height:50px;border-bottom:1px solid  #C1BCBC;box-sizing:border-box;}
	.pingpai,.yanse,.chicun{height:80px;}
	.tiaojian{background-color:antiquewhite;}
	
	.tiaojian span:nth-child(1){background-color:black;padding:10px;}
	.tiaojian span:nth-child(2){border:1px grey solid;padding:10px;margin:0 0 auto 500px;}
	
	
	.xingbie dd,.renqun dd,.jiage dd{float:left;margin-right:50px;}
	.yanse dd,.chicun dd{float:left;margin-right:80px;}
    .pingpai dd{float:left;width:100px;}
	.pingpai .gengduo{margin-top:16px;}
	.pingpai .gengduo .gengduo_wenzi{float:left;}
	.pingpai .gengduo .gengduo_wenzi{float:left;}
	.jiage span{padding:5px 30px;border:1px black solid;margin:0 10px;}
	.jiage dd:nth-child(5){margin-left:30px;}
	.pingpai dd:nth-child(7){margin-left:50px;margin-right:0px;}
	.pingpai span:nth-of-type(2){border:1px black solid;padding:5px  5px;}
	
	.chicun span{padding:5px 30px;border:1px black solid;margin:0 10px;}
	.chicun dd:nth-child(5){margin-left:20px;}
	 
	/*颜色*/
	.yanse dd{margin-right:40px;}
	.yanse dl:nth-child(1) dd:nth-child(1){background-image:url(image2/red.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	.yanse dl:nth-child(1) dd:nth-child(2){background-image:url(image2/yellow.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	.yanse dl:nth-child(1) dd:nth-child(3){background-image:url(image2/glod.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	.yanse dl:nth-child(1) dd:nth-child(4){background-image:url(image2/grey.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	.yanse dl:nth-child(1) dd:nth-child(5){background-image:url(image2/kaqi.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	.yanse dl:nth-child(1) dd:nth-child(6){background-image:url(image2/black.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
    .yanse dl:nth-child(2) dd:nth-child(1){background-image:url(image2/blue.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	 .yanse dl:nth-child(2) dd:nth-child(2){background-image:url(image2/ying.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	 .yanse dl:nth-child(2) dd:nth-child(3){background-image:url(image2/white.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	 .yanse dl:nth-child(2) dd:nth-child(4){background-image:url(image2/orange.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	 .yanse dl:nth-child(2) dd:nth-child(5){background-image:url(image2/red.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;}
	 .yanse dl:nth-child(2) dd:nth-child(6){background-image:url(image2/kaqise.png);background-repeat:no-repeat;background-position:0 center;padding-left:30px;} 
	
	
	
	
	
	
	

 
	
	/*默认*/
	
	.right_middle{height:50px;background-color:antiquewhite;margin:0 auto;width:986px;}
	.right_middle dd{font-size:16px;font-weight:blod;float:left;margin-right:30px;line-height:50px;}
	.right_middle dl:nth-child(2){float:right;line-height:50px;}
	.right_middle dt{font-size:16px;font-weight:blod;float:left;margin-right:30px;line-height:50px;}
	.right_middle span{padding:5px 20px;border:1px black solid;background-color:white;}
	
	
	
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
		.yejiao3_banquan1{margin: 0 auto;width: 600px;}
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

<div>

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
			  <a  href="http://www.ts.com/usercentre/index/${sessionScope.roleId}"><p><img src="../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p>
			  <p>用户中心</p></a>
			</c:if>

			
		</div>
	</div>
	
	<div class="daohang2">
		<div class="daohang2_zuo">
		    <img src="../staticfile/images/logo.png" height="100px">
		</div>
		
		<div  class="daohang2_logo">
			
		</div>
		
		<div  class="daohang2_you">
			
			<div class="daohang2_you_da">
				<div class="daohang2_you_sousuokuan">
					<div class="daohang2_you_kuan">
						<form action="http://www.ts.com/search/article_item" method="get">
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
			<a href="http://www.ts.com/article/list" style="color: red;">食评<span></span></a>	
			<a href="http://www.ts.com/our">关于我们<span></span></a>
				
		</div>
		
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
						<a class="fenye"  href="list?currPage=1">
						<img src="../../staticfile/images/table/firstPageDisabled.gif" height="40" width="40" style="border:0"  alt="第一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="list?currPage=${pageBean.currPage-1<=0? 1 : pageBean.currPage-1 }">
						<img src="../../staticfile/images/table/prevPageDisabled.gif" height="40" width="40"  style="border:0"  alt="上一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="list?currPage=${pageBean.currPage+1>=pageBean.totalPage? pageBean.totalPage : pageBean.currPage+1 }">
						<img src="../../staticfile/images/table/nextPage.gif" height="40" width="40"  style="border:0"  title="下一页"  alt="下一页" />
						</a>
					</td>
					<td>
						<a class="fenye"  href="list?currPage=${pageBean.totalPage }">
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
<div class="one">
<c:forEach  begin="0" end="30" step="1" items="${pageBean.pageList}" var="item">
						<a href="http://www.ts.com/article/details?articleId=${item.id}" >
						<div class="one_one">
							<img src="${item.imgUrl}" width="300px" height="300px"/>
								<h4>${item.title}</h4>
						</div>
						</a>
				</c:forEach>
				
    
</div>
</div>

<div class="two">
</div>
</div>
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
