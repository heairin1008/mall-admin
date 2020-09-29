<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	Product product = new Product();
	product.setProductId(productId);
	
	ProductDao productDao = new ProductDao();
	productDao.deleteProductOne(product);
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp");
%>