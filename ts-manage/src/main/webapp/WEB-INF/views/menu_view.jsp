<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>菜谱查看</title>

</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="formSubmit('/menulist','_self')">返回</a></li>
	
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../skin/default/images/icon/currency_yen.png"/>
    菜谱查看
  </div> 
  
<div>


<div class="eXtremeTable" >

	<table id="ec_table" class="tableRegion" width="98%" >
		<tr class="odd" hidden="hidden">
			<td><input type="text" name="menuId" value="${menu.menuId}" /></td>
		</tr>
		<tr class="odd">
			<td>菜谱名:</td>
			<td><input type="text" name="name" value="${menu.name}"/></td>
		</tr>
		<tr class="odd">
			<td>原料:</td>
			<td colspan="3">
			<textarea name="ingredients" style="height:80px;width:80%">${menu.ingredients}</textarea>
			</td>
		</tr>
		<tr class="odd">
			<td>种类:</td>
			<td><input type="text" name="assort" value="${menu.assort}"/></td>
		</tr>
		<tr class="odd">
			<td>热度:</td>
			<td><input type="text" name="hot" value="${menu.hot}"/></td>
		</tr>
		<tr class="odd">
			<td>做法:</td>
			<td colspan="5">
			<textarea name="tips" style="height:160px;width:100%">${menu.tips}</textarea>
			</td>
		</tr>
		<tr class="odd">
			<td>菜谱图片:</td>
			<td><img alt="菜谱图片" src="${menu.imgUrl}"></td>
		</tr>
		<tr class="odd">
			<td>创建时间:</td>
			<td><input type="text" name="created" value="${menu.created}"/></td>
		</tr>
		<tr class="odd">
			<td>更新时间:</td>
			<td><input type="text" name="updated" value="${menu.updated}"/></td>
		</tr>





	</table>
	
</div>
 
</div>
</form>
</body>
</html>

