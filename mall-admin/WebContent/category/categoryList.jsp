<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<div class="container p-3 my-3">
	<h1>카테고리 목록</h1>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>category_id</th>
				<th>category_name</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
					<tr>
						<td><%=c.getCategoryId()%></td>
						<td><%=c.getCategoryName()%></td>
						<td><a class="btn btn-secondary" href="/mall-admin/category/updateCategory.jsp?categoryId=<%=c.getCategoryId()%>&categoryName=<%=c.getCategoryName()%>">수정</a></td>
						<td><a class="btn btn-danger" href="/mall-admin/category/deleteCategoryAction.jsp?categoryId=<%=c.getCategoryId()%>">삭제</a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
		<div>
			<a class="btn btn-info" style="float:right;" href="/mall-admin/category/addCategory.jsp">상품 카테고리 추가</a>
		</div>
	</div>
</div>
</body>
</html>