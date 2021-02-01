<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		if(session.getAttribute("loginAdminId") == null){
			response.sendRedirect("/mall-admin/login.jsp");
			return;
		}
	
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> list = noticeDao.selectNoticeList();
	%>
	<div class="container p-3 my-3">
	<h1>공지사항 목록</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>공지번호</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Notice notice : list){
			%>
					<tr>
						<td><%=notice.getNoticeId()%></td>
						<td>
							<a class="text-dark" href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=notice.getNoticeId()%>"><%=notice.getNoticeTitle()%></a>
						</td>
						<td><%=notice.getNoticeDate()%></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a class="btn btn-info" style="float:right;" href="<%=request.getContextPath()%>/notice/insertNotice.jsp">추가</a>
</div>
</div>
</body>
</html>