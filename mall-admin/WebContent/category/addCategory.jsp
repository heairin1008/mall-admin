<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>addCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<div class="container p-3 my-3">
	<h1>카테고리 입력</h1>
	
	<form method="post" action="/mall-admin/category/addCategoryAction.jsp">
	<div class="form-group">
		<div>category_name</div>
		<div><input type="text" class="form-control" name="categoryName"></div>
	</div>
		<div><button class="btn btn-outline-info" style="float:right;" type="submit">카테고리 추가</button></div>
	</form>
</div>
</div>
</body>
</html>