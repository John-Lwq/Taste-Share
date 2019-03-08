<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>文章查看</title>

</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="formSubmit('/articlelist','_self')">返回</a></li>
	
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../skin/default/images/icon/currency_yen.png"/>
    文章查看
  </div> 
  
<div>


<div class="eXtremeTable" >

	<table id="ec_table" class="tableRegion" width="98%" >
		<tr class="odd" hidden="hidden">
			<td><input type="text" name="id" value="${article.id}" /></td>
		</tr>
		<tr class="odd">
			<td>文章标题:</td>
			<td><input type="text" name="title" value="${article.title}"/></td>
		</tr>
		<tr class="odd">
			<td>文章图片:</td>
			<td><img alt="文章图片" src="${article.imgUrl}"></td>
		</tr>
		<tr class="odd">
			<td>文章热度:</td>
			<td><input type="text" name="hot" value="${article.hot}"/></td>
		</tr>
		<tr class="odd">
			<td>文章内容 :</td>
			<td colspan="8">
			<textarea name="content" style="height:240px;width:100%">${article.content}</textarea>
			</td>
		</tr>

		<tr class="odd">
			<td>创建时间:</td>
			<td><input type="text" name="created" value="${article.created}"/></td>
		</tr>
		<tr class="odd">
			<td>更新时间:</td>
			<td><input type="text" name="updated" value="${article.updated}"/></td>
		</tr>





	</table>
	
</div>
 
</div>
</form>
</body>
</html>

