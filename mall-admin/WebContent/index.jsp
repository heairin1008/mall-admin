<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<!-- jsp파일 포함시키기 (include태그는 톰캣에서 실행하기 때문에 /mall-admin은 필요없음 -->
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron" style="background-color:#A5BAFA;">
	<h3><%=session.getAttribute("loginAdminId")%>님 반갑습니다</h3>
	</div>
	<div>
		<table class="table table-bordered">
			<tr>
				<td>
					<h4>쇼핑몰 프로젝트 - 관리자 페이지</h4>
					제작기간 : 2020/09/16 ~ 2020/09/30<br/><br>
					Java SE 8 버전  / tomcat 8.5 버전 사용<br/>
					Java 클래스 / 메서드 활용해서 sql 코드 겹치는 것을 줄이는 것을 연습하면서 게시글 제작에 필요한 것들을 복습하는 의미로
					쇼핑몰 페이지를 제작하였다.
				</td>
			</tr>
		
		</table>
	</div>
</div>
</body>
</html>