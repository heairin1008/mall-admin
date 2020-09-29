<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%
	// 언어 설정
	request.setCharacterEncoding("utf-8");
	// 몇번의 글인지 번호 받아오기
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	// 내용 표시를 위해 selectNoticeOne 클래스 선언
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
%>
<body>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<div class="container p-3 my-3">
	<h1>공지사항 수정</h1>
	<form method="post" action="<%=request.getContextPath()%>/notice/updateNoticeAction.jsp">
		<table class="table table-bordered form-group">
			<tr>
				<td>번호</td>
				<td><input class="form-control" type="text" name="noticeId" value="<%=notice.getNoticeId()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="noticeTitle" value="<%=notice.getNoticeTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="5" name="noticeContent"><%=notice.getNoticeContent()%></textarea></td>
			</tr>
		</table>
		<button class="btn btn-outline-secondary" type="submit">수정</button>
	</form>
	</div>
</div>	
</body>
</html>