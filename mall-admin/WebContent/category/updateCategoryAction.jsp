<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//값 받아오기
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String categoryName = request.getParameter("categoryName");
	
	//category 메서드에 값 대입
	Category category = new Category();
	category.setCategoryId(categoryId);
	category.setCategoryName(categoryName);
	
	//메서드 호출
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>