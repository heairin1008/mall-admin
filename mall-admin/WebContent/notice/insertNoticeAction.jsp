<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// 언어 설정
	request.setCharacterEncoding("utf-8");
	
	// 매개변수 값 저장
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	// Notice 클래스 선언
	Notice notice = new Notice();
	
	// 클래스 변수에 값 입력
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	// NoticeDao 클래스 선언
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	
	// 끝나면 noticeList.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>