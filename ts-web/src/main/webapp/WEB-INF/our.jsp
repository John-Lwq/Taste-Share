<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel="stylesheet" href="css/swiper.min.css">
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
		
		
	.women{position: relative;top:152px;}
.women_1{width:1200px;height:510px;margin:auto;overflow: hidden;background-image: url(images/aboutus/women.gif)}
.women_2{width: 460px;text-align:justify;height: 400px;}
.women_2 a{font-family: "微软雅黑";line-height: 30px;font-size: 14px;margin-left:90px;padding-top:10px;}
.women_2 a:hover{font-family: "微软雅黑";line-height: 30px;font-size: 14px;margin-left:90px;padding-top:10px;color:#c63812}
		
	
	/*banner*/
	.banner{height:520px;width:1646px;margin:20px auto;}
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
	/*专题*/
	.zhuanti{width: 1290px;height: 60px;margin: 40px auto;}
	.heitiao1{width: 440px;height: 60px;float: left}
	.heitiao1 div{width: 410px; height: 2px;background-color:black;margin: 29px 30px 29px 0px;}
	.biaoti{width: 410px;height: 56px;float: left;border: black 2px solid;text-align: center;line-height: 56px;color: black;}
	.heitiao2{width: 330px;height: 60px;float: left}
	.heitiao2 div{width: 300px; height: 2px;background-color:black;margin: 29px 0px 29px 30px;}
	.mose{width: 100px;height: 60px; float: left}
	.mose div{line-height: 60px;text-align: center;}
	
	/*商品*/
	.shangpingqu{width: 1320px;height: 640px;margin: 0 auto;}
	.shangpingtupian{width: 410px;height: 640px;float: left;margin:0px 15px 0px 15px;}
	.shangpin{width: 410px;height: 540px;background-color: aquamarine;overflow: hidden}
	.shangpin_text{width: 410px;height: 100px;}
	.shangpin_text p{padding-top: 20px;}
	.shangpin img{transition: 0.3s;}
	.shangpin:hover img{transform: scale(1.2);}
	
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
		.a3{position: relative;top:-200px;}
</style>

<meta charset="utf-8">
<title>关于我们</title>
</head>

<body>

<!--导航栏-->
<div class="daohang">
	<div class="daohangwenzi">
	<div class="daohang1">
		
		<div class="daohang1_you">
			<p>Hi<a href="">[登录]</a><a href="">[注册]</a></p>
			
			
			<p>&#124;</p>
			<a  href=""><p><img src="../staticfile/images/souye_lianxiwomen.png" style="margin-top: -4px;"></p></a>
			<a href=""><p>用户中心</p></a>
			
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
					<input type="text" value="韩宫宴炭火烤肉">
						
					<button>
						<div class="tijiao">搜索</div>
					</button>
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
			<a href="http://www.ts.com/our" style="color: red;">关于我们<span></span></a>
				
		</div>
		
	</div>
	
</div>
<!--元素日系-->
<div>
	<!--banner-->
	<div class="banner">
		<div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="../staticfile/images/datu1.png"></div>
      
    </div>
    
	</div>
	<!--专题-->
	<div class="zhuanti">
		<div class="heitiao1">
			<div></div>
		</div>
		<div class="biaoti">
			<p>关于公众号</p>
		</div>
		<div class="heitiao2">
			<div></div>
		</div>
		<div class="mose">
			<a href=""><div>More&gt;</div></a>
		</div>
	</div>
	<!--banner-->
	<div class="banner" style="margin-top: 80px;">
		<div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="../staticfile/images/erweima.png"></div>
      
    </div>
    
  </div>
	</div>
<script src="js/swiper.min.js"></script>

  
<!--时尚简约-->
<div>
	
	<!--专题-->
	<div class="zhuanti">
		<div class="heitiao1">
			<div></div>
		</div>
		<div class="biaoti">
			<p>我们那点事儿</p>
		</div>
		<div class="heitiao2">
			<div></div>
		</div>
		<div class="mose">
			<a href=""><div>More&gt;</div></a>
		</div>
	</div>
	<!--商品-->
	<div class="shangpingqu">
		<div class="shangpingtupian">
			<div class="shangpin">
				<a href=""><img src="../staticfile/images/xiaozhupeiqi.1.png"></a>
			</div>
			<div class="shangpin_text">
				<a href=""><p>带头大哥</p></a>
				<a href=""><p>骆文庆</p></a>
				
			</div>	
		</div>
		
		<div class="shangpingtupian">
			<div class="shangpin">
				<a href=""><img src="../staticfile/images/xiaozhupeiqi.2.png"></a>
			</div>
			<div class="shangpin_text">
				<a href=""><p>带头二姐</p></a>
				<a href=""><p>沈俞蕾</p></a>
			</div>	
		</div>
		
		<div class="shangpingtupian">
			<div class="shangpin">
				<a href=""><img src="../staticfile/images/xiaozhupeiqi.3.png"></a>
			</div>
			<div class="shangpin_text">
				<a href=""><p>带头三哥</p></a>
				<a href=""><p>鲁跃飞</p></a>
			</div>	
		</div>
		
	</div>	
</div>
<!--查看更多-->
<div class="chakanggenduo">
	<div class="ckgd">
		<p><a href="">查看更多&gt;&gt;</a></p>
	</div>
</div>
<!--页脚-->
<!--页脚
<div class="heitiao"></div>
<div class="yejiao">
	<div class="yejiao_text">
	<div class="yejiao1">
		<div class="yejiao1_text">
			<div class="tupian"><img src="../staticfile/images/zhengpin.png"></div>
			<a href=""><div class="text"><a>100%</a><a style="color: white">&nbsp;正品保证</a></div></a>
		</div>
		<div class="yejiao1_text">
			<div class="tupian"><img src="../staticfile/images/qitian.png"></div>
			<a href=""><div class="text"><a>100%</a><a style="color: white">&nbsp;无理由保证退货</a></div></a>
		</div>
		<div class="yejiao1_text">
			<div class="tupian"><img src="../staticfile/images/kuaijie.png"></div>
			<a href=""><div class="text"><a>100%</a><a style="color: white">&nbsp;在线客服</a></div></a>
		</div>
	</div>
	<div class="baitiao"></div>
	<div class="yejiao2">
		<div class="yejiao2_quyu">
		<div class="yejiao_zhengwen">
				<a href=""><p class="zhuti">新手专区</p></a>
				<a href=""><p>注册登录</p></a>
				<a href=""><p>购物结算</p></a>
				<a href=""><p>下单支付</p></a>
				<a href=""><p>收获评价</p></a>
		</div>
		<div class="yejiao_zhengwen">
			<a href=""><p class="zhuti">会员中心</p></a>
			<a href=""><p>会员制度</p></a>
			<a href=""><p>会员优惠</p></a>
			<a href=""><p>账户管理</p></a>
			<a href=""><p>密码管理</p></a>
		</div>
		<div class="yejiao_zhengwen">
				<a href=""><p class="zhuti">购物指南</p></a>
				<a href=""><p>发票</p></a>
				<a href=""><p>尺寸对照</p></a>
				<a href=""><p>尺码解读</p></a>
				<a href=""><p>商品咨询</p></a>
		</div>
		<div class="yejiao_zhengwen">
				<a href=""><p class="zhuti">支付方式</p></a>
				<a href=""><p>在线支付</p></a>
				<a href=""><p>货到付款</p></a>
				<a href=""><p>分期支付</p></a>
				<a href=""><p>优惠劵</p></a>
		</div>
		<div class="yejiao_zhengwen">
				<a href=""><p class="zhuti">配送方式</p></a>
				<a href=""><p>配送说明</p></a>
				<a href=""><p>运费说明</p></a>
				<a href=""><p>验货签收</p></a>
				<a href=""><p>收获样品</p></a>
		</div>
		<div class="yejiao_zhengwen">
				<a href=""><p class="zhuti">售后服务</p></a>
				<a href=""><p>退换货政策</p></a>
				<a href=""><p>退换货流程</p></a>
				<a href=""><p>投诉与建议</p></a>
				<a href=""><p>在线客服</p></a>
		</div>
		</div>
	</div>
	<div class="baitiao1"></div>
	<div class="yejiao3">
		<div class="yejiao3_banquan1">
			<a href="index.html"><p>返回首页</p></a>
			<p>&#124;</p>
			<a href=""><p>SETEMBER&nbsp;九月</p></a>
			<p>&#124;</p>
			<a href=""><p>联系我们</p></a>
			<p>&#124;</p>
			<a href=""><p>隐私条款</p></a>
		</div>
		<div class="yejiao3_banquan2">
			<p>CopyRight&nbsp;2010-2018&nbsp;深圳你与我文化传播有限公司</p>
			<p>&#124;</p>
			<a href=""><p>版权所有</p></a>
			<p>&#124;</p>
			<p>经验许可证编号；广B-31245487</p>
		</div>
	</div>
	</div>
</div>
-->
<!-- Initialize Swiper -->

<div class="yejiao3_banquan1">
			<a href="http://www.ts.com/index"><p>返回首页</p></a>
			<p>&#124;</p>
			<a href=""><p>TASTE&SHARE</p></a>
			<p>&#124;</p>
			<a href="http://www.ts.com/our"><p>联系我们</p></a>
			<p>&#124;</p>
			<a href=""><p>隐私条款</p></a>
		</div>

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
