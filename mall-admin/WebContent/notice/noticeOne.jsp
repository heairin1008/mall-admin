<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
%>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<div class="container p-3 my-3">
		<h1>공지사항 상세보기</h1>
	
	<table class="table table-bordered">
		<tr>
			<td>notice_id</td>
			<td><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>notice_title</td>
			<td><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>notice_content</td>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>notice_date</td>
			<td><%=notice.getNoticeDate()%></td>
		</tr>
	</table>
	<a class="btn btn-secondary" href="<%=request.getContextPath()%>/notice/updateNotice.jsp?noticeId=<%=notice.getNoticeId()%>">수정</a>
	<a class="btn btn-danger" href="<%=request.getContextPath()%>/notice/deleteNotice.jsp?noticeId=<%=notice.getNoticeId()%>">삭제</a>
</div>
</div>
</body>
</html>