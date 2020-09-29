<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	Admin paraAdmin = new Admin();
	paraAdmin.setAdminId(adminId);
	paraAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paraAdmin);
	
	if(loginAdmin == null){
		System.out.println("로그인 실패");
		response.sendRedirect("/mall-admin/login.jsp");
	}else{
		System.out.println("로그인 성공");
		session.setAttribute("loginAdminId", loginAdmin.getAdminId());// 세션에 변수 만드는 방법
		response.sendRedirect("/mall-admin/index.jsp");
	}// 로그인 정보를  session에 저장(page < request < session < application)

%>