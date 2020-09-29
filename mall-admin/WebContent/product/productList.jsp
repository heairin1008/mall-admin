<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
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
<title>productionList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<%	
	request.setCharacterEncoding("utf-8");
	int categoryId = -1; // -1로 설정한 이유 : categoryId에 절대 들어올 수 없는 값이라고 생각해서
	if(request.getParameter("categoryId") != null) {
		categoryId = Integer.parseInt(request.getParameter("categoryId"));
	}
	
	ProductDao productDao = new ProductDao();
	ArrayList<Product> list = null;
	if(categoryId == -1){ // -1이면 product리스트 전체 출력
		list = productDao.selectProductList();
	}else{ // -1이 아니면 해당 categoryId의 리스트 출력
		list = productDao.selectProductListByCategoryId(categoryId);
	}
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	
%>
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<div class="container p-3 my-3">
	
	<h1>상품 목록</h1>
	
	<div class="btn-group ">
		<%
			for(Category c : categoryList){
		%>
				<a class="btn btn-secondary my-3" href="/mall-admin/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">[<%=c.getCategoryName()%>]</a>
		<%
			}
		%>
				<a class="btn btn-secondary my-3" href="/mall-admin/product/productList.jsp">[RESET]</a>
	</div>
	<table class="table table-hover table-borderd">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Product p : list){
				if(p.getProductSoldout().equals("Y")){
		%>
				<tr>
					<td>
						<del><a href = "/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></del>
					</td>
					<td><del><%=p.getCategoryId()%></del></td>
					<td><del><%=p.getProductName()%></del></td>
					<td><del><%=p.getProductPrice()%></del></td>
					<td>품절</td>
				</tr>
		<%
			
				}else{
		%>
				<tr>
					<td>
						<a href = "/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a>
					</td>
					<td><%=p.getCategoryId()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getProductPrice()%></td>
					<td><%=p.getProductSoldout()%></td>
				</tr>
		<%
				}
			}
		%>
		</tbody>
	</table>
		<div>
			<a class="btn btn-info" style="float:right;" href="/mall-admin/product/addProduct.jsp">상품 추가</a>
		</div>
	</div>
</div>
</body>
</html>