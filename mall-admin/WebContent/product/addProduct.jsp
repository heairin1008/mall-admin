<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
<title>addProduct</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#addBtn").click(function(){
			console.log("click");
			if($("#productName").val()==""){
				alert("상품 이름을 입력해주세요");
				$("#productName").focus();
				return;
			}else if($("#productPrice").val() == ""){
				alert("상품 가격을 입력해주세요");
				$("#productPrice").focus();
				return;
			}else if($("#productContent").val() == ""){
				alert("상품 설명을 입력해주세요");
				$("#productContent").focus();
				return;
			}
			$("#addForm").submit();
		});
	});
</script>
</head>
<body>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<div class="container p-3 my-3">
	<h1>상품 추가</h1>

	<form method="post" action="/mall-admin/product/addProductAction.jsp" id="addForm">
		<table class="table table-bordered">
			<tr>
				<td>category_id</td>
				<td>
					<select class="form-control" name="categoryId">
					<%
						for(Category c : categoryList){
					%>
							<option value=<%=c.getCategoryId()%>><%=c.getCategoryName()%></option>
					<%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input type="text" class="form-control"  name="productName" id="productName"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input type="text" class="form-control" name="productPrice" id="productPrice"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="50" name="productContent" id="productContent"></textarea></td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<input type="radio" name="productSoldout" value="N" checked = "checked">품절아님
					<input type="radio" name="productSoldout" value="Y">품절
				</td>
			</tr>
		</table>		
		<button class="btn btn-outline-info" style="float:right;" type="button" id="addBtn">추가</button>
	</form>
</div>
</div>
</body>
</html>