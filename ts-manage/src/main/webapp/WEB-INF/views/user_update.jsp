<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>部门修改</title>
	<script type="text/javascript">
	$(function() {//页面加载时执行的函数
		//找到deptId的input框
		$("#userId").blur(function() {
			//var deptId = $("#deptId").val();
			var userId = $("input[name='userId']").val();
			//ajax的异步请求
			$.ajax({
				url:"checkuserId",
				data:{userId:userId},//data中存放的为deptId的key 和 value
				type:"post",//请求的发送方式
				dataType:"json",//结果的返回值类型
				success:function (data) {
					//部门编号存在
					if (data.result == "true") {
						$("#checkresult").html("该用户ID被占用");
					}
					//部门编号不存在
					else {
						$("#checkresult").html("该用户ID可以使用");
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
	<li id="view"><a href="#" onclick="formSubmit('/userlist','_self')">返回</a></li>
	<li id="new"><a href="#" onclick="formSubmit('/usertoupdate','_self');this.blur();">更新</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
    用户修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>用户ID：</td>
		<td><input type="text" id="userId" name="userId" value="${user.userId }" />
			<span id="checkresult"></span>
		</td>
	</tr>
	<tr class="odd">
		<td>用户名：</td>
		<td><input type="text" name="username" value="${user.username }" /></td>
	</tr>
	<tr class="odd">
		<td>昵称：</td>
		<td><input type="text" name="nickname" value="${user.nickname }" /></td>
	</tr>
		<tr class="odd">
		<td>生日：</td>
		<td><input type="text" name="birthday" value="${user.birthday }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>真实姓名：</td>
		<td><input type="text" name="name" value="${user.name }" /></td>
	</tr>
	<tr class="odd">
		<td>性别：</td>
		<td>
			<input type="radio" name="gender" value="1" />女
			<input type="radio" name="gender" value="0" />男
		</td>
	</tr>
	</tr>
		<tr class="odd">
		<td>电话号码：</td>
		<td><input type="text" name="phoneNumber" value="${user.phoneNumber }" /></td>
	</tr>
	</tr>
		<tr class="odd">
		<td>居住地：</td>
		<td><input type="text" name="location" value="${user.location }" /></td>
	</tr>

</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

