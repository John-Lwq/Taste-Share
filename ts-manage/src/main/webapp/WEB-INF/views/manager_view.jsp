<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>管理员查看</title>

</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="formSubmit('/managerlist','_self')">返回</a></li>
	
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../skin/default/images/icon/currency_yen.png"/>
    管理员查看
  </div> 
  
<div>


<div class="eXtremeTable" >

	<table id="ec_table" class="tableRegion" width="98%" >
		<tr class="odd" hidden="hidden">
			<td><input type="text" name="userId" value="${user.userId}" /></td>
		</tr>
		<tr class="odd">
			<td>管理员名称:</td>
			<td><input type="text" name="userName" value="${user.username}"/></td>
		</tr>
		<tr class="odd">
			<td>昵称:</td>
			<td><input type="text" name="nickName" value="${user.nickname}"/></td>
		</tr>
		<tr class="odd">
			<td>生日:</td>
			<td><input type="text" name="birthday" value="${user.birthday}"/></td>
		</tr>
		<tr class="odd">
			<td>真实姓名:</td>
			<td><input type="text" name="name" value="${user.name}"/></td>
		</tr>
		<tr class="odd">
			<td>性别:</td>
			<td>
				<input type="radio" name="user.gender" value="男" <c:if test="${user.gender=='1'}">checked="checked"</c:if>/>男
				<input type="radio" name="user.gender" value="女" <c:if test="${user.gender=='0'}">checked="checked"</c:if>/>女
			</td>
		</tr>
		<tr class="odd">
			<td>电话号码:</td>
			<td><input type="text" name="phoneNumber" value="${user.phoneNumber}"/></td>
		</tr>
		<tr class="odd">
			<td>居住地:</td>
			<td><input type="text" name="location" value="${user.location}"/></td>
		</tr>
		<tr class="odd">
			<td>权限:</td>
			<td><input type="text" name="roleId" value="${user.roleId}"/></td>
		</tr>
		<tr class="odd">
			<td>创建时间:</td>
			<td><input type="text" name="created" value="${user.created}"/></td>
		</tr>
		<tr class="odd">
			<td>更新时间:</td>
			<td><input type="text" name="updated" value="${user.updated}"/></td>
		</tr>





	</table>
	
</div>
 
</div>
</form>
</body>
</html>

