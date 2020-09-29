<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
<title>updateCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		// a태그로 보낸 값 변수에 받기
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = new Category();
	
	%>
	<div class="container p-3 my-3">
	<h1>카테고리 수정</h1>
	</div>
	<form method="post" action="/mall-admin/category/updateCategoryAction.jsp">
		<table class="table table-bordered form-group">
			<tr>
				<td>카테고리 번호 : </td>
				<td><input type="text" name="categoryId" class="form-control" value=<%=categoryId%> readonly="readonly"></td>
			</tr>
			<tr>
				<td>카테고리 이름 : </td>
				<td><input type="text" name="categoryName" class="form-control" value=<%=categoryName%>></td>
			</tr>
		</table>
		<button class="btn btn-outline-secondary" style="float:right;" type="submit">수정</button>
	</form>
</div>
</body>
</html>