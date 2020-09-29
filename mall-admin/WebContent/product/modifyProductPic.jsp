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
<title>modifyProductPic</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
	%>
<div class="container">
<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<div class="container p-3 my-3">
	<h1>상품 이미지 수정</h1>
	<form method="post" action="/mall-admin/product/modifyProductPicAction.jsp" enctype="multipart/form-data">
	<input type="hidden" name="productId" value="<%=productId%>">
	<table class="table table-border">
		<tr>
			<td>이미지 선택</td>
			<td><input type="file" name="productPic"></td>
		</tr>
	</table>
	<div>
		<button class="btn btn-info" type="submit">이미지 수정</button>
	</div>
	</form>
	</div>
</div>
</body>
</html>