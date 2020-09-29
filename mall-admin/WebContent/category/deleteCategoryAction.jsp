<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	//카테고리 id 값 받아오기
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	//카테고리 클래스 선언
	Category category = new Category();
	//카테고리 id 값 대입
	category.setCategoryId(categoryId);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.DeleteCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>