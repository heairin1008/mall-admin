<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
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
<title>modifyOrdersState</title>
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

	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	System.out.println(ordersId+"<--ordersId");
	System.out.println(ordersState+"<--ordersState");
%>
<div class="container p-3 my-3">
	<h1>orders_state 수정</h1>
	<form method="post" action="<%=request.getContextPath()%>/orders/modifyOrdersStateAction.jsp">
		<table class="table form-group">
			<tr>
				<td>orders_id</td>
				<td><input class="form-control" type="text" name="ordersId" value="<%=ordersId%>"></td>
			</tr>
			<tr>
				<td>주문 상태</td>
				<td>
					<select class="form-control" name="ordersState">
					<%
						if(ordersState.equals("결제완료")){
					%>
							<option value="결제완료" selected="selected">결제완료</option>
					<%
						}else {
					%>
							<option value="결제완료">결제완료</option>
					<%
						}
							
						if(ordersState.equals("배송준비중")){
					%>
							<option value="배송준비중" selected="selected">배송준비중</option>
					<%
						}else {
					%>
							<option value="배송준비중">배송준비중</option>
					<%
						}
							
						if(ordersState.equals("배송완료")){
					%>
							<option value="배송완료" selected="selected">배송완료</option>
					<%
						}else{
					%>
							<option value="배송완료">배송완료</option>
					<%
						}
						
						if(ordersState.equals("주문취소")){
					%>
							<option value="주문취소" selected="selected">주문취소</option>
					<%
						}else{
					%>
							<option value="주문취소">주문취소</option>
					<%
						}
					%>
					</select>
				</td>
			</tr>
	</table>
	<button class="btn btn-secondary" type="submit">수정</button>
	</form>
</div>
</div>
</body>
</html>