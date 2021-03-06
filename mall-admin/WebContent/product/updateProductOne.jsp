<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>updateProductOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#updateBtn").click(function(){
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
			$("#updateForm").submit();
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
		// 언어 설정
		request.setCharacterEncoding("utf-8");
		// 내용 표시를 위해 변수값 받아오기
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
	%>
<div class="container p-3 my-3 form-group">
	<h1>상품정보 수정</h1>
	<form method="post" action="/mall-admin/product/updateProductOneAction.jsp" id="updateForm">
	<table class="table table-bordered table-hover">
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/image/<%=product.getProductPic()%>" width="300" height="300"></td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><input class="form-control" type="text" name="productId" value="<%=product.getProductId()%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><input class="form-control" type="text" name="categoryId" value="<%=product.getCategoryId()%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><input class="form-control" type="text" name="productName" value="<%=product.getProductName()%>" id="productName"></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><input class="form-control" type="text" name="productPrice" value="<%=product.getProductPrice()%>" id="productPrice"></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><textarea class="form-control" rows="5" name="productContent" id="productContent"><%=product.getProductContent()%></textarea></td>
		</tr>
	</table>
	<button class="btn btn-outline-secondary" type="button" id="updateBtn">수정</button>
	</form>
	</div>
</div>
</body>
</html>