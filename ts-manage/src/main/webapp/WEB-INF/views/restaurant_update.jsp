<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>餐厅修改</title>
	<script type="text/javascript">
	$(function() {//页面加载时执行的函数
		//找到deptId的input框
		$("#restaurantId").blur(function() {
			//var deptId = $("#deptId").val();
			var restaurantId = $("input[name='restaurantId']").val();
			//ajax的异步请求
			$.ajax({
				url:"checkrestaurantId",
				data:{restaurantId:restaurantId},//data中存放的为deptId的key 和 value
				type:"post",//请求的发送方式
				dataType:"json",//结果的返回值类型
				success:function (data) {
					//部门编号存在
					if (data.result == "true") {
						$("#checkresult").html("该餐厅ID被占用");
					}
					//部门编号不存在
					else {
						$("#checkresult").html("该餐厅ID可以使用");
					}
				}
			})
			
		});//失去焦点的时间
	})
	</script>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="view"><a href="#" onclick="formSubmit('/restaurantlist','_self')">返回</a></li>
	<li id="new"><a href="#" onclick="formSubmit('/restauranttoupdate','_self');this.blur();">更新</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
    餐厅修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>餐厅ID：</td>
		<td><input type="text" id="restaurantId" name="restaurantId" value="${restaurant.restaurantId }" />
			<span id="checkresult"></span>
		</td>
	</tr>
	<tr class="odd">
		<td>餐厅名：</td>
		<td><input type="text" name="shopName" value="${restaurant.shopName }" /></td>
	</tr>
	<tr class="odd">
		<td>餐厅地址：</td>
		<td><input type="text" name="shopAddress" value="${restaurant.shopAddress }" /></td>
	</tr>
		<tr class="odd">
		<td>人均：</td>
		<td><input type="text" name="averPrice" value="${restaurant.averPrice }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>味道评分：</td>
		<td><input type="text" name="tasteScore" value="${restaurant.tasteScore }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>环境评分：</td>
		<td><input type="text" name="environmentScore" value="${restaurant.environmentScore }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>服务评分：</td>
		<td><input type="text" name="serviceScore" value="${restaurant.serviceScore }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>餐厅图片：</td>
		<td><img src="${restaurant.defaultPic}"  alt="餐厅图片" /></td>
	</tr>


</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

