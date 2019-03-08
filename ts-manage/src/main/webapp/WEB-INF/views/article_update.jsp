<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>文章修改</title>
	<script type="text/javascript">
	$(function() {//页面加载时执行的函数
		//找到deptId的input框
		$("#id").blur(function() {
			//var deptId = $("#deptId").val();
			var id = $("input[name='id']").val();
			//ajax的异步请求
			$.ajax({
				url:"checkid",
				data:{id:id},//data中存放的为deptId的key 和 value
				type:"post",//请求的发送方式
				dataType:"json",//结果的返回值类型
				success:function (data) {
					//部门编号存在
					if (data.result == "true") {
						$("#checkresult").html("该文章ID被占用");
					}
					//部门编号不存在
					else {
						$("#checkresult").html("该文章ID可以使用");
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
	<li id="view"><a href="#" onclick="formSubmit('/articlelist','_self')">返回</a></li>
	<li id="new"><a href="#" onclick="formSubmit('/articletoupdate','_self');this.blur();">更新</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
    文章修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>文章ID：</td>
		<td><input type="text" id="id" name="id" value="${article.id }" />
			<span id="checkresult"></span>
		</td>
	</tr>
	<tr class="odd">
		<td>标题：</td>
		<td><input type="text" name="title" value="${article.title }" /></td>
	</tr>
	<tr class="odd">
		<td>热度：</td>
		<td><input type="text" name="hot" value="${article.hot }" /></td>
	</tr>
		<tr class="odd">
		<td>文章内容 :</td>
			<td colspan="8">
			<textarea name="content" style="height:240px;width:100%">${article.content}</textarea>
		</td>
	</tr>

</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

