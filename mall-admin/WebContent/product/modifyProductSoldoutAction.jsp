<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductSoldout(productId, productSoldout);
	
	// 해당 제품 번호의 상세페이지로 돌아가기
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
%>