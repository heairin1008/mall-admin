<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	System.out.println(ordersId+"<--ordersId");
	System.out.println(ordersState+"<--ordersState");
	
	Orders orders = new Orders();
	orders.setOrdersId(ordersId);
	orders.setOrdersState(ordersState);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersState(orders);
	
	response.sendRedirect(request.getContextPath()+"/orders/ordersList.jsp");
%>