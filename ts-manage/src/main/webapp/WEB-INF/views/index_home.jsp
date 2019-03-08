<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no, email=no, date=no, address=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style">
		<link href="css/bksystem.css" rel="stylesheet" type="text/css" />
		<link href="font/iconfont.css" rel="stylesheet" type="text/css" />
		<link href="css/module.css" rel="stylesheet" type="text/css" />
		<link href="css/pages.css" rel="stylesheet" type="text/css" />
		<title>管理系统首页</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/HUpages.js" type="text/javascript"></script>
		<script src="js/echarts.js"></script>
			<!--[if lt IE 9]>
          <script src="js/html5shiv.js" type="text/javascript"></script>
          <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
        <![endif]-->
	</head>
		<body id="situation" class="backgrounddd">
			<div class="spacing_style"></div>
			<div class="pages-style">
				<div class="clearfix">
					<div class="col-md-6">
						<div class="box-module">
							<div class="box-title">状态栏</div>
							<div class="box-content">
								<div class="Shops_info clearfix">
									<div class="left_shop">
										<div class="left_shop_logo">
											<div class="shop_logo"><img src="images/touxiang.jpg" onerror="this.src='images/noimage.gif',this.onerror=null"></div>
											
										</div>
										<div class="Shops_content">
											<p><label class="name">网站名称：</label>Taste&Share</p>
											<ul class="clearfix">
												<li><label class="name">餐厅数量：</label>${restaurantNum}</li>
												<li><label class="name">用户数量：</label>${userNum}</li>
												<li><label class="name">菜谱数量：</label>${menuNum}</li>
												<li><label class="name">管理员数量</label>${managerNum}</li>
												<li><label class="name">文章数量：</label>${articleNum }</li>
												<li><label class="name">创立时间：</label>2018-11-01</li>
											</ul>
										</div>
										
										<!--原本放网站评分，已删-->
										<div class="right_shop">
										</div>
										
										
									</div>
									<div class="operating_style Quick_operation menuUl">
										<ul class="menulist">
											<li class="column-name">
												<a href="javascript:void(0)" data-id="1" name="/restaurantlist" class="btn menuUl_title" title="餐厅管理">餐厅管理</a>
											</li>
											<li class="column-name">
												<a href="javascript:void(0)" data-id="3"  name="/userlist" class="btn menuUl_title" title="user_manage">用户管理</a>
											</li>
											<li class="column-name">
												<a href="javascript:void(0)" data-id="4" name="/menulist" class="btn menuUl_title" title="menu_manage">菜谱管理</a>
											</li>
											<li class="column-name">
												<a href="javascript:void(0)" data-id="5" name="/managerlist" class="btn menuUl_title" title="manager_manage">管理员管理</a>
											</li>
											<li class="column-name">
										       <a href="javascript:void(0)" data-id="6" name="/articlelist" class="btn menuUl_title" title="article_manage">文章管理</a>
									       </li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				<!-- 柱状数据图 -->
				<div class="col-md-3">
					<div class="box-module">
							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							<div id="echarts_num" style="width: 300px;height:330px;"></div>
								<script type="text/javascript">
								
								var restaurant = ${restaurantNum};
								var user = ${userNum};
								var menu = ${menuNum};
								var article = ${articleNum};
								
								
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document.getElementById('echarts_num'));
	
								// 指定图表的配置项和数据
								var option = {
									title: {
										text: '柱状数据图'
									},
									tooltip: {},
									xAxis: {
										data: ["餐厅","用户","菜谱","文章"]
									},
									yAxis: {},
									series: [{
										name: '数量',
										type: 'bar',
										data: [restaurant, user, menu, article]
									}]
								};

								// 使用刚指定的配置项和数据显示图表。
								myChart.setOption(option);
								</script>
						
					</div>
				</div>
				
				
					<!-- 用户性别比例图-->
					<div class="col-md-3">
						<div class="box-module">
							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="echarts_sex" style="width: 270px;height:270px;"></div> 
					     <script type="text/javascript">
							var man = 31;
							var women = 54;
							// 基于准备好的dom，初始化echarts实例
							var myChart = echarts.init(document.getElementById('echarts_sex'));

							// 指定图表的配置项和数据
							option = {
								title: {
									text: '用户性别比例'
								},
								series:[
									{
									name: '用户性别比例',
									type: 'pie',
									radius: '60%',
									data:[
										{value:man, name:'禽兽'},
										{value:women, name:'妹子'}
									],
									roseType: 'angle',
									itemStyle: {
										normal: {
											shadowBlur: 200,
											shadowColor: 'rgba(0, 0, 0, 0.5)'
										}
									}	
									}
								]
							};
							// 使用刚指定的配置项和数据显示图表。
							myChart.setOption(option);
						</script>  
						</div>
					</div>
					
				</div>
				
				
				
				<div class="clearfix">
				
				
					<!--用户/餐厅/文章/菜谱统计折线图-->
					<div class="col-md-8">
						<div class="box-module">
							<div class="box-title">用户/餐厅/文章/菜谱统计</div>
							<div class="box-content">
						        <div class="dd_echarts">
                                <div id="main" class="mainwidth" style=" height:305px"></div>
                                </div>
                            </div>
                        </div>
					</div>
					
					
					<div class="col-md-4">
						<div class="box-module">
							<div class="box-title">系统信息</div>
							<div class="box-content">
								<table class="table table-striped table-hover">
									<tbody>
										<tr>
											<td class="width30b">操作系统:</td>
											<td>PC</td>
										</tr>
										<tr>
											<td>浏览器:</td>
											<td>Chorme（不支持E9以下）</td>
										</tr>
										<tr>
											<td>程序编码:</td>
											<td>UTF-8</td>
										</tr>
										<tr>
											<td>MySQL版本</td>
											<td>5.5.40</td>
										</tr>
										<tr>
											<td>当前版本:</td>
											<td>Taste&Share 1.0版</td>
										</tr>
										<tr>
											<td>创立时间:</td>
											<td>2018年11月01日 12:00:00</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
</html>
<script src="js/dist/echarts.js" type="text/javascript"></script>
<script>
	//内页框架
	$(function() {
		$("#situation").Hupage({
			scrollbar:function(e){
				e.niceScroll({
					      cursorcolor: "#dddddd",
					      cursoropacitymax: 1,
					      touchbehavior: false,
					      cursorwidth: "3px",
					      cursorborder: "0",
					      cursorborderradius: "3px",
				 });						
			},
			expand: function(thisBox, settings) {
				settings.scrollbar(thisBox);//设置当前页滚动样式
			}
		})
	})
</script>
<script>
	/*********************/
   require.config({
            paths: {
                echarts: './js/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '每月统计量',
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['餐厅','用户','文章','菜谱']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel : {
                formatter: '{value}'
            }
        }
    ],
    series : [
        {
            name:'餐厅',
            type:'line',
            data:[110, 129, 150, 172, 192, 211, 234, 276, 301, 309, 330, 376],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        },
        {
            name:'用户',
            type:'line',
            data:[8, 15, 40, 54, 77, 81, 101, 120, 136, 150, 199, 208],
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        },
		{
            name:'文章',
            type:'line',
            data:[87, 125, 130, 142, 158, 169, 206, 210, 242, 256, 258, 296],
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        },
		{
            name:'菜谱',
            type:'line',
            data:[320, 350, 352, 370, 384, 402, 460, 471, 485, 512, 520, 572],
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        }
    ]
};
                  
			myChart.setOption(option);
			}
			);
</script>