<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet" href="../staticfile/css/swiper.min.css">
<style>
	body{margin: 0;}
	a{text-decoration: none;color: black;}
	button{border: none;cursor: pointer;outline: none;}
	h1,h2,h3,dd,dl,p{margin:0 auto;font-weight: normal;}
	img{display:block;}/*去掉无故空隙*/
	
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
	
	
	/*banner*/
	.banner{width: 1920px;height: 700px;margin: 20px auto;}
	.swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

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
	/*轮播*/
	.lunbo{width: 1320px;height: 100px;margin: 40px auto;}
	.zuo{width: 100px; height: 100px;float: left;margin: 0px 7.5px 0px 15px;background-image:url(images/zuojiantou.png)}
	.zuo:active{background-image:url(images/zuojiantou1.png)}
	.pingpai{width: 200px;height: 100px;margin: 0 7.5px;float: left;}
	.you{width: 100px; height: 100px;float: left;margin: 0px 15px 0px 7.5px;background-image:url(images/youjiantou.png)}
	.you:active{background-image:url(images/youjiantou1.png);}
	
	.pingpai{overflow: hidden;}
	.pingpai img{transition: 0.3s;}
	.pingpai:hover img{transform: scale(1.2);}
	/*专题*/
	.zhuanti{width: 1290px;height: 60px;margin: 40px auto;}
	.heitiao1{width: 440px;height: 60px;float: left}
	.heitiao1 div{width: 410px; height: 2px;background-color:black;margin: 29px 30px 29px 0px;}
	.biaoti{width: 410px;height: 56px;float: left;border: black 2px solid;text-align: center;line-height: 56px;color: black;}
	.heitiao2{width: 436px;height: 60px;float: left}
	.heitiao2 div{width: 410px; height: 2px;background-color:black;margin: 29px 0px 29px 30px;}
	/*商品*/
	.shangpinqu{width: 1290px;height: 600px;margin: 0 auto;}
	.da{width: 424px;height: 600px;margin-right: 16px; background-color: #f5f7f6;float: left;}
	.da_tupian{width:424px;height: 520px; }
	.da_text{width: 424px;height: 80px;}
	.da_text p{margin-top: 10px;font-size: 20px;text-align: center;}
	
	.da_tupian{overflow: hidden;}
	.da_tupian img{transition: 0.3s;}
	.da_tupian:hover img{transform: scale(1.2);}
	
	.xiao{width: 850px; height: 600px;float: left;}
	.xiao_zuo{width: 580px;height: 600px;float: left;}
	.zuo1{width: 270px;height: 290px;float: left;margin-right: 20px;}
	.zuo1:nth-child(3){width: 270px;height: 290px;float: left;margin-right: 20px;margin-top: 20px;}
	.zuo1:nth-child(4){width: 270px;height: 290px;float: left;margin-right: 20px;margin-top: 20px; }
	.zuo1_tupian{width: 270px;height: 250px;}
	.zuo1_text{width: 270px;height: 40px;}
	.zuo1_text p{text-align: center;}
	
	.zuo1_tupian{overflow: hidden;}
	.zuo1_tupian img{transition: 0.3s;}
	.zuo1_tupian:hover img{transform: scale(1.2);}
	
	.xiao_you{width: 270px;height: 600px;float: left;}
	.you1_tupian{width: 270px;height: 250px;}
	.you1_text{width: 270px;height: 40px;}
	.you2{width: 270px;height: 240px;margin-top: 10px; background-color:#f5f7f6;}
	.you2 p{text-align: center;line-height: 240px;font-size:30px;}
	.you1_text p{text-align: center;}
	
	.you1_tupian{overflow: hidden;}
	.you1_tupian img{transition: 0.3s;}
	.you1_tupian:hover img{transform: scale(1.2);}
	/*查看更多*/
   .chakanggenduo{width: 1320px;height: 100px;margin: 0 auto;}
   .ckgd{background-color: black;margin: 40px auto;width: 300px;}
   .ckgd p{color: white;text-align: center;line-height: 60px;}
   .ckgd a{color: white;text-decoration: none;}

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
		.yejiao3_banquan1{margin: 0 auto;width: 400px;}
		.yejiao3_banquan1 p{margin-left: 10px;float: left;}
		.yejiao3_banquan2{clear: left;width: 750px;margin: 0 auto;}
		.yejiao3_banquan2 p{margin-left: 4px;float: left;margin-top: 10px;}

</style>

<meta charset="utf-8">
<title>taste&share</title>
</head>

<body>

<div>

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
		    <img src="../staticfile/images/logo.png" height="100px">
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
			<a href="http://www.ts.com/index"style="color: red;">&nbsp;&nbsp;首页<span></span></a>				
			<a href="http://www.ts.com/restaurant/list" >美食<span></span></a>					
			<a href="http://www.ts.com/menu/list">菜谱<span></span></a>				
			<a href="http://www.ts.com/article/list" >食评<span></span></a>	
			<a href="http://www.ts.com/our">关于我们<span></span></a>
				
		</div>
		
	</div>
	
</div>
	<!--banner-->
	<div class="banner">
		<div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="../staticfile/images/1920x600.1.png"></div>
      <div class="swiper-slide"><img src="../staticfile/images/1920x600.2.png"></div>
      <div class="swiper-slide"><img src="../staticfile/images/1920x600.3.png"></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
	</div>
	
	<!--专题-->
	<div class="zhuanti">
		<div class="heitiao1">
			<div></div>
		</div>
		<div class="biaoti">
			<p>美食</p>
		</div>
		<div class="heitiao2">
			<div></div>
		</div>
	</div>
	
	<!--商品-->
	<div class="shangpinqu">
	    <a href="">
		<div class="da">
			<div class="da_tupian">
				<a href="http://www.ts.com/restaurant/list"><img src="../staticfile/images/424x520.1.png"><span></span></a>
			</div>
			<div class="da_text">
				<p>星空鸡尾酒</p>
				<p>¥88</p>
			</div>
		</div>
		</a>
		<div class="xiao">
			<div class="xiao_zuo">
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/restaurant/list"><img src="../staticfile/images/270x250.10 (1).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>掌上披萨</p>
						<p>¥88</p>
					</div>
				</div>
				</a>
			<a href="http://www.ts.com/restaurant/list">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<img src="../staticfile/images/270x250.10 (2).png">
					</div>
					<div class="zuo1_text">
						<p>台湾熊手包</p>
						<p>¥39</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/restaurant/list"><img src="../staticfile/images/270x250.10 (3).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>秘密鸡地套餐</p>
						<p>¥89</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/restaurant/list"><img src="../staticfile/images/270x250.10 (4).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>最高鸡密鸡翅</p>
						<p>¥69</p>
					</div>
				</div>
				</a>
			</div>
			<div class="xiao_you">
				<a href="">
				<div class="you1">
					<div class="you1_tupian">
						<a href="http://www.ts.com/restaurant/list"><img src="../staticfile/images/270x250.10 (5).png"><span></span></a>
					</div>
					<div class="you1_text">
						<p>洪吉煌一锅焖</p>
						<p>¥169</p>
					</div>
				</div>
				</a>
				<div class="you2">
						<a href="http://www.ts.com/restaurant/list"><p>查看更多&gt;&gt;</p></a>
				</div>
			</div>
		</div>
		
	</div>
	
		<!--FUN-->
	<div class="zhuanti">
		<div class="heitiao1">
			<div></div>
		</div>
		<div class="biaoti">
			<p>菜谱</p>
		</div>
		<div class="heitiao2">
			<div></div>
		</div>
	</div>
	<!--商品-->
	
	<div class="shangpinqu">
		<a href="">
		<div class="da">
			<div class="da_tupian">
				<a href="http://www.ts.com/menu/list"><img src="../staticfile/images/424x520.2.png"><span></span></a>
			</div>
			<div class="da_text">
				<p>创新宫荼奶茶</p>
				<p>¥46</p>
			</div>
		</div>
		</a>
		
		<div class="xiao">
			<div class="xiao_zuo">

				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href=http://www.ts.com/menu/list><img src="../staticfile/images/270x250.10 (6).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>嘿，爱你甜品</p>
						<p>¥29</p>
					</div>
				</div>
				</a>
				<a href=http://www.ts.com/menu/list>
				<div class="zuo1">
					<div class="zuo1_tupian">
					<img src="../staticfile/images/270x250.10 (7).png">
					</div>
					<div class="zuo1_text">
						<p>响熏欧巴年糕</p>
						<p>¥59</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href=http://www.ts.com/menu/list><img src="../staticfile/images/270x250.10 (8).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>星罗蕉叶沙拉</p>
						<p>¥49</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href=http://www.ts.com/menu/list><img src="../staticfile/images/270x250.10 (9).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>Mexico披萨</p>
						<p>¥79</p>
					</div>
				</div>
				</a>
				
			</div>
			<div class="xiao_you">

				<a href="">
				<div class="you1">
					<div class="you1_tupian">
						<a href=http://www.ts.com/menu/list><img src="../staticfile/images/270x250.10 (10).png"><span></span></a>
					</div>
					<div class="you1_text">
						<p>鳗诚屋套餐</p>
						<p>¥159</p>
					</div>
				</div>
				</a>
				
				<div class="you2">
					<a href=http://www.ts.com/menu/list><p>查看更多&gt;&gt;</p></a>
				</div>
			</div>
		</div>
		
	</div>
	
		<!--Adidas-->
	<div class="zhuanti">
		<div class="heitiao1">
			<div></div>
		</div>
		<div class="biaoti">
			<p>食评</p>
		</div>
		<div class="heitiao2">
			<div></div>
		</div>
	</div>
	<!--商品-->
	
	<div class="shangpinqu">
		<a href="">
		<div class="da">
			<div class="da_tupian">
				<a href="http://www.ts.com/article/list"><img src="../staticfile/images/424x520.3.png"><span></span></a>
			</div>
			<div class="da_text">
				<p>喜豚亚洲猪排</p>
				<p>¥79</p>
			</div>
		</div>
		</a>
		
		<div class="xiao">
			<div class="xiao_zuo">
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/article/list"><img src="../staticfile/images/270x250.10 (11).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>7017味道工厂炸鸡</p>
						<p>¥59</p>
					</div>
				</div>
				</a>
				<a href="http://www.ts.com/article/list">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<img src="../staticfile/images/270x250.10 (12).png">
					</div>
					<div class="zuo1_text">
						<p>辛香汇煎饺</p>
						<p>¥29</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/article/list"><img src="../staticfile/images/270x250.10 (13).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>朴墅简餐</p>
						<p>¥39</p>
					</div>
				</div>
				</a>
				<a href="">
				<div class="zuo1">
					<div class="zuo1_tupian">
						<a href="http://www.ts.com/article/list"><img src="../staticfile/images/270x250.10 (14).png"><span></span></a>
					</div>
					<div class="zuo1_text">
						<p>21号厨房沙拉</p>
						<p>¥48</p>
					</div>
				</div>
				</a>
				
			</div>
			<div class="xiao_you">
				<a href="">
				<div class="you1">
					<div class="you1_tupian">
						<a href="http://www.ts.com/article/list"><img src="../staticfile/images/270x250.10 (15).png"><span></span></a>
					</div>
					<div class="you1_text">
						<p>和府鸭血粉丝</p>
						<p>¥69</p>
					</div>
				</div>
				</a>
				<div class="you2">
					<a href="http://www.ts.com/article/list"><p>查看更多&gt;&gt;</p></a>
				</div>
			</div>
		</div>
		
	</div>
	
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



<script src="../staticfile/js/swiper.min.js"></script>
<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>

</body>
</html>
