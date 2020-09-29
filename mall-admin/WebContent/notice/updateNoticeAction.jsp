<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// 언어 설정
	request.setCharacterEncoding("utf-8");
	
	// 매개변수 값 받아오기
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	// Notice 클래스 선언
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	notice.setNoticeId(noticeId);
	
	// NoticeDao 클래스 선언
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(notice);
	
	// 수정 후 noticeOne.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeId="+noticeId);
%>