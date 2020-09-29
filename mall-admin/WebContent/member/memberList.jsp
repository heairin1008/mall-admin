<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	MemberDao memberDao = new MemberDao();
	ArrayList<Member> list = memberDao.selectMemberList();
%>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<div class="container p-3 my-3">
	<h1>회원 관리</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>member_email</th>
				<th>member_name</th>
				<th>member_date</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : list){
			%>
					<tr>
						<td><%=m.getMemberEmail()%></td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getMemberDate()%></td>
						<td><a class="btn btn-danger" href="<%=request.getContextPath()%>/member/deleteMember.jsp?memberEmail=<%=m.getMemberEmail()%>">탈퇴</a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>