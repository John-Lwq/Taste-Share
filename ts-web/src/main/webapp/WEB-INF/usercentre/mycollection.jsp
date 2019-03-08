<!--<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我的收藏</title>
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
		.daohang2_you_kuan{position: relative;float:right}
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
	
</style>
</head>
<body>
<!--导航栏-->

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
			<a  href=""><p><img src="../../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p></a>
			<a href=""><p  style="color: red;">用户中心</p></a>
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
					<input type="text" name="info" value="${info} }">
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
			<a href="http://www.ts.com/article/list" >食评<span></span></a>	
			<a href="http://www.ts.com/our">关于我们<span></span></a>
				
		</div>
		
	</div>
	
</div>




			
<!--主题部分-->
<div class="middle">
      <div class="middle_content">
      <!--开始盒子内容-->
      <!--商品详情-->
      <div class="shangping">
      <div class="one">
		  <div class="hengxian_zuo"></div>
		  <div class="hengxian_wenzi">收藏</div>
          <div class="hengxian_you"></div>
	  </div> 
	   	   
 	   </div>
 
	   
 	<!-- 评论 -->   
<span data-hook="review-body" class="a-size-base review-text">
<font size="3"  face="微软雅黑"></font>
</span><hr style="width:820px;height:1px;border:none;border-top:1px dashed #0066CC;" /><br/>
<c:forEach  begin="1" end="5" step="1" items="${pageBean.pageList}" var="item">
    <span data-hook="review-body" class="a-size-base review-text">
    <font size="3"  face="宋体">商店名:${item.shopName}
	</font>
	</br>
	<font size="3"  face="宋体">商家地址：${item.shopAddress}  
	</font>
	</br>
    <font size="3"  face="宋体">环境评分：${item.environmentScore}
	</font>
	</br>
    </span><hr style="width:820px;height:1px;border:none;border-top:1px dashed #0066CC;" /><br/>
	   
	</c:forEach>   
 
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
