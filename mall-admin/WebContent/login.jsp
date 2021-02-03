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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
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
<style>
	#font{
		font-family: 'Montserrat', sans-serif;
		margin-left:45%;
	}
</style>
<body>
<div class="container">
	<div class="jumbotron" style="background-color:#A5BAFA;">
	<h1>쇼핑몰 관리자용</h1>
	</div>
	<form method = "post" action="/mall-admin/loginAction.jsp" id="loginForm" class="table-bordered"> <!-- action -> 절대주소 -->
	<h1 id="font">Login</h1>
	<table class="table table-borderless form-group" style="width:50%; margin:auto;">
		<tr>
			<td class="font-weight-bold">관리자 ID</td>
			<td><input type="text" class="form-control" name="adminId" id="adminId" value="admin@gmail.com"></td> 
			<td rowspan="2"><button class="btn btn-success" style="margin-top:30%; margin-left:20%;" type="button" id="loginBtn">로그인</button></td>
		</tr>
		<tr>
			<td class="font-weight-bold">관리자 PW</td>
			<td><input type="password" class="form-control" name="adminPw" id="adminPw" value="1234"></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>