<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>餐厅推荐菜</title>
	<script type="text/javascript" src="../js/jquery-1.6.2.js"></script>
	<meta name="referrer" content="never">
	<script type="text/javascript">
		$(function () {
			//最终目的是： list?currentPage=1&pageSize=动态的
			$("a").click(function() {
				//获取下拉框中的每一页的数据量
				var pagesize = $("#pageSize option:selected").val();
				//获取当前a标签的请求路径 
				var this_url = $(this).attr("href");
				//对url路径进行重新的赋值 list?currentPage=1&pageSize=10
				$(this).attr("href",this_url+"&pageSize="+pagesize);

			})
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
		<li id="back"><a href="#" onclick="formSubmit('/restaurantlist','_self')">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
    餐厅推荐菜
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr style="padding: 0px;" >
		<td colspan="10" >

		<table border="0"  cellpadding="0"  cellspacing="0"  width="100%" >
			<tr>
				<td class="statusBar" >找到 ${pageBean.totalCount} 条记录, 第 ${pageBean.currPage} 页 </td>
				<td class="compactToolbar"  align="right" >
				<table border="0"  cellpadding="1"  cellspacing="2" >
					<tr>
					<td>
						<a href="restaurantrecommendview?restaurantId=${restaurantId}&currentPage=1">
						<img src="images/table/firstPageDisabled.gif"  style="border:0"  alt="第一页" />
						</a>
					</td>
					<td>
						<a href="restaurantrecommendview?restaurantId=${restaurantId}&currentPage=${pageBean.currPage-1<=0? 1 : pageBean.currPage-1 }">
						<img src="images/table/prevPageDisabled.gif"  style="border:0"  alt="上一页" />
						</a>
					</td>
					<td>
						<a href="restaurantrecommendview?restaurantId=${restaurantId}&currentPage=${pageBean.currPage+1>=pageBean.totalPage? pageBean.totalPage : pageBean.currPage+1 }">
						<img src="images/table/nextPage.gif"  style="border:0"  title="下一页"  alt="下一页" />
						</a>
					</td>
					<td>
						<a href="restaurantrecommendview?restaurantId=${restaurantId}&currentPage=${pageBean.totalPage }">
						<img src="images/table/lastPage.gif"  style="border:0"  title="最后页"  alt="最后页" />
						</a>
					</td>
					<td>
						<img src="images/table/separator.gif"  style="border:0"  alt="Separator" />
					</td>
					<td>
						<select name="pageSize" id="pageSize">
							<option value="10" <c:if test="${pageBean.pageSize==10 }">selected="selected"</c:if> >10</option>
							<option value="20" <c:if test="${pageBean.pageSize==20 }">selected="selected"</c:if> >20</option>
							<option value="30" <c:if test="${pageBean.pageSize==30 }">selected="selected"</c:if> >30</option>
						</select>
					</td>
					</tr>
				</table></td>
			</tr>
		</table>
		</td>
	</tr>
	

	</thead>
	
	<tbody class="tableBody" >
		
		<c:forEach begin="0" end="10" step="1" items="${pageBean.pageList}" var="recom">
			
			<tr class="odd">
				<td>推荐ID:</td>
				<td><input type="text" name="reId" value="${recom.reId}"/></td>
			</tr>
			<tr class="odd">
				<td>推荐菜名:</td>
				<td><input type="text" name="name" value="${recom.name}"/></td>
			</tr>
			<tr class="odd">
				<td>推荐菜价格:</td>
				<td><input type="text" name="price" value="${recom.price}"/></td>
			</tr>
			<tr class="odd">
				<td>推荐菜图片:</td>
				<td><img  src="${recom.recommendImg} "  height="100px"  width="100px"></td>
			</tr>
			<tr class="odd">
				<td>点赞数量:</td>
				<td><img alt="点赞数量" src="${recom.praiseNum}"></td>
			</tr>
			<tr class="odd">
				<td>创建时间:</td>
				<td><input type="text" name="created" value="${recom.created}"/></td>
			</tr>
			<tr class="odd">
				<td>更新时间:</td>
				<td><input type="text" name="updated" value="${recom.updated}"/></td>
			</tr>
		</c:forEach>

	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

