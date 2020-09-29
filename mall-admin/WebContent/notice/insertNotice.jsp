<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	%>
	<div class="container p-3 my-3">
	<h1>공지사항 추가</h1>
	<form method="post" action="<%=request.getContextPath()%>/notice/insertNoticeAction.jsp">
		<table class="table table-bordered form-group">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="5" name="noticeContent"></textarea></td>
			</tr>
		</table>
		<button class="btn btn-outline-info" type="submit">등록</button>
	</form>
	</div>
</div>	
</body>
</html>