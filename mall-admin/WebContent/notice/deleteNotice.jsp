<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	// 변수값 받아오기
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	
	// Notice 클래스 선언
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);
	
	// NoticeDao 클래스 선언
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(notice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>