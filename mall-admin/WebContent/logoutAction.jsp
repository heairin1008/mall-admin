<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션 지우기
	response.sendRedirect("/mall-admin/login.jsp");
%>