<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>菜单修改</title>
	<script type="text/javascript">
	$(function() {//页面加载时执行的函数
		//找到deptId的input框
		$("#menuId").blur(function() {
			//var deptId = $("#deptId").val();
			var menuId = $("input[name='menuId']").val();
			//ajax的异步请求
			$.ajax({
				url:"checkmenuId",
				data:{menuId:menuId},//data中存放的为deptId的key 和 value
				type:"post",//请求的发送方式
				dataType:"json",//结果的返回值类型
				success:function (data) {
					//部门编号存在
					if (data.result == "true") {
						$("#checkresult").html("该菜谱ID被占用");
					}
					//部门编号不存在
					else {
						$("#checkresult").html("该菜谱ID可以使用");
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
	<li id="view"><a href="#" onclick="formSubmit('/menulist','_self')">返回</a></li>
	<li id="new"><a href="#" onclick="formSubmit('/menutoupdate','_self');this.blur();">更新</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
    菜谱修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>菜谱ID：</td>
		<td><input type="text" id="menuId" name="menuId" value="${menu.menuId }" />
			<span id="checkresult"></span>
		</td>
	</tr>
	<tr class="odd">
		<td>菜谱名：</td>
		<td><input type="text" name="name" value="${menu.name }" /></td>
	</tr>
	<tr class="odd">
		<td>原料：</td>
		<td><input type="text" name="ingredients" value="${menu.ingredients }" /></td>
	</tr>
		<tr class="odd">
		<td>分类：</td>
		<td><input type="text" name="assort" value="${menu.assort }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>做法：</td>
		<td><input type="text" name="tips" value="${menu.tips }" /></td>
	</tr>
		</tr>
		<tr class="odd">
		<td>热度：</td>
		<td><input type="text" name="hot" value="${menu.hot }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>菜谱图片：</td>
		<td><img src="${menu.imgUrl}"  alt="菜谱图片" /></td>
	</tr>


</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

