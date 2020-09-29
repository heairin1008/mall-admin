<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
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
<title>productOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId + "<- productId");
	
	Product product = new ProductDao().selectProductOne(productId);
%>
	<div class="container p-3 my-3">
	<h1>상품 상세보기</h1>
	<table class="table table-bordered table-hover">
		<tr>
			<td>product_pic</td>
			<td><img src="<%=request.getContextPath()%>/image/<%=product.getProductPic()%>" width="300" height="300">
				<a class="btn-sm btn-secondary" href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>">이미지 수정</a>
			</td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId()%></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.getCategoryId()%></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName()%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice()%></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent()%></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<%
					if(product.getProductSoldout().equals("Y")){
				%>
						<a class="btn btn-danger" href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[품절]</a>
				<%
					}else{
				%>
						<a class="btn btn-secondary" href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[판매중]</a>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a class="btn btn-secondary" href="/mall-admin/product/updateProductOne.jsp?productId=<%=product.getProductId()%>">[수정]</a></td>
			<td><a class="btn btn-danger" href="/mall-admin/product/deleteProductOneAction.jsp?productId=<%=product.getProductId()%>">[삭제]</a></td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>