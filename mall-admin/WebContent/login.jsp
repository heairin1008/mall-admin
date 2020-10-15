<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") != null){
		System.out.println("이미 로그인 되어 있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#loginBtn").click(function(){
			console.log("click");
			if($("#adminId").val() == ""){
				alert("아이디를 확인해주세요");
				$("#adminId").focus(); //상품 입력 창으로 커서를 이동
				return;
			}else if($("#adminPw").val() == ""){
				alert("비밀번호를 확인해주세요");
				$("#adminPw").focus();
				return;
			}
			$("#loginForm").submit();
		});
	});
</script>
<body>
<div class="container">
	<div class="jumbotron">
	<h1>관리자 로그인</h1>
	</div>
	<form method = "post" action="/mall-admin/loginAction.jsp" id="loginForm"> <!-- action -> 절대주소 -->
	<table class="table table-bordered form-group">
		<tr>
			<td>관리자 ID</td>
			<td><input type="text" class="form-control" name="adminId" id="adminId"></td> 
		</tr>
		<tr>
			<td>관리자 PW</td>
			<td><input type="password" class="form-control" name="adminPw" id="adminPw"></td>
		</tr>
	</table>
	<button class="btn btn-secondary" style="float:right;" type="button" id="loginBtn">로그인</button>
	</form>
</div>
</body>
</html>