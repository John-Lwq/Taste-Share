<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>文章列表</title>
	<script type="text/javascript" src="../js/jquery-1.6.2.js"></script>
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
	<li id="view"><a href="#" onclick="formSubmit('/articleview','_self');this.blur();">查询</a></li>
	<li id="update"><a href="#" onclick="formSubmit('/articleupdate','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('/articledelete','_self');this.blur();">删除</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="skin/default/images/icon/currency_yen.png"/>
  文章列表
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
						<a href="articlelist?currentPage=1">
						<img src="images/table/firstPageDisabled.gif"  style="border:0"  alt="第一页" />
						</a>
					</td>
					<td>
						<a href="articlelist?currentPage=${pageBean.currPage-1<=0? 1 : pageBean.currPage-1 }">
						<img src="images/table/prevPageDisabled.gif"  style="border:0"  alt="上一页" />
						</a>
					</td>
					<td>
						<a href="articlelist?currentPage=${pageBean.currPage+1>=pageBean.totalPage? pageBean.totalPage : pageBean.currPage+1 }">
						<img src="images/table/nextPage.gif"  style="border:0"  title="下一页"  alt="下一页" />
						</a>
					</td>
					<td>
						<a href="articlelist?currentPage=${pageBean.totalPage }">
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
	
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('id',this)"></td>
		<td class="tableHeader">文章ID</td>
		<td class="tableHeader">文章名</td>
		
		<td class="tableHeader">文章热度</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${pageBean.pageList}" var="u" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="id" value="${u.id}"/></td>
		<td>${status.index+1+pageBean.pageSize*(pageBean.currPage-1)}</td>
		<td>${u.title}</td>
		<td>${u.hot}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

