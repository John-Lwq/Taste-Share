<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>餐厅查看</title>

</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="formSubmit('/restaurantlist','_self')">返回</a></li>
	
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../skin/default/images/icon/currency_yen.png"/>
    餐厅查看
  </div> 
  
<div>


<div class="eXtremeTable" >

	<table id="ec_table" class="tableRegion" width="98%" >
		<tr class="odd" hidden="hidden">
			<td><input type="text" name="restaurantId" value="${restaurant.restaurantId}" /></td>
		</tr>
		<tr class="odd">
			<td>餐厅名:</td>
			<td><input type="text" name="shopName" value="${restaurant.shopName}"/></td>
		</tr>
		<tr class="odd">
			<td>餐厅地址:</td>
			<td><input type="text" name="shopAddress" value="${restaurant.shopAddress}"/></td>
		</tr>
		<tr class="odd">
			<td>人均:</td>
			<td><input type="text" name="averPrice" value="${restaurant.averPrice}"/></td>
		</tr>
		<tr class="odd">
			<td>味道评分:</td>
			<td><input type="text" name="tasteScore" value="${restaurant.tasteScore}"/></td>
		</tr>
		<tr class="odd">
			<td>服务评分:</td>
			<td><input type="text" name="serviceScore" value="${restaurant.serviceScore}"/></td>
		</tr>
		<tr class="odd">
			<td>餐厅图片:</td>
			<td><img alt="餐厅图片" src="${restaurant.defaultPic}"></td>
		</tr>
		<tr class="odd">
			<td>创建时间:</td>
			<td><input type="text" name="created" value="${restaurant.created}"/></td>
		</tr>
		<tr class="odd">
			<td>更新时间:</td>
			<td><input type="text" name="updated" value="${restaurant.updated}"/></td>
		</tr>






		
		
		
		



	</table>
	
</div>
 
</div>
</form>
</body>
</html>

