<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
<title>Insert title here</title>
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
		String ordersState = "";
		if(request.getParameter("ordersState") != null){
			ordersState = request.getParameter("ordersState");
		}
		
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		if(ordersState.equals("")){
			list = ordersDao.selectOrdersList();
		}else{
			list = ordersDao.selectOrdersListByState(ordersState);
		}
		
		ArrayList<String> stateList = ordersDao.selectOrdersStateList();
		
		
	%>
	<div class="container p-3 my-3">
	<h1>주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option>선택</option>
			<option value="">전체</option>
			<%
				for(String s : stateList){
					if(s.equals(ordersState)){
			%>		
						<option value=<%=s%> selected="selected"><%=s%></option>
			<%		
					}else{
			%>
						<option value=<%=s%>><%=s%></option>
			<%
					}

				}
			%>
		</select>
		<button class="btn btn-secondary"type="submit">주문상태별로 보기</button>
	</form>
	<table class="table">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>orders_state</th>
				<th>orders_date</th>
				<th>orders_state 수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list){
			%>
					<tr>
						<td><%=oap.getOrders().getOrdersId()%></td>
						<td><%=oap.getOrders().getProductId()%></td>
						<td><%=oap.getProduct().getProductName()%></td>
						<td><%=oap.getOrders().getOrdersAmount()%></td>
						<td><%=oap.getOrders().getOrdersPrice()%></td>
						<td><%=oap.getOrders().getMemberEmail()%></td>
						<td><%=oap.getOrders().getOrdersAddr()%></td>
						<td><%=oap.getOrders().getOrdersState()%></td>
						<td><%=oap.getOrders().getOrdersDate()%></td>
						<td><a class="btn btn-secondary" href="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=oap.getOrders().getOrdersId()%>&ordersState=<%=oap.getOrders().getOrdersState()%>">수정</a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</div>
</body>
</html>