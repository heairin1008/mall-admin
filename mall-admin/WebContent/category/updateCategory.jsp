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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#updateBtn").click(function(){
			console.log("click");
			if($("#categoryName").val()==""){
				alert("카테고리 이름을 입력해주세요");
				return;
			}
			$("#updateForm").submit();
		});
	});
</script>
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
	<form method="post" action="/mall-admin/category/updateCategoryAction.jsp" id="updateForm">
		<table class="table table-bordered form-group">
			<tr>
				<td>카테고리 번호 : </td>
				<td><input type="text" name="categoryId" class="form-control" value=<%=categoryId%> readonly="readonly"></td>
			</tr>
			<tr>
				<td>카테고리 이름 : </td>
				<td><input type="text" name="categoryName" class="form-control" value=<%=categoryName%> id="categoryName"></td>
			</tr>
		</table>
		<button class="btn btn-outline-secondary" style="float:right;" type="button" id="updateBtn">수정</button>
	</form>
</div>
</body>
</html>