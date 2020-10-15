<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#addBtn").click(function(){
			console.log("click");
			if($("#noticeTitle").val()==""){
				alert("공지 제목을 입력해주세요");
				$("#noticeTitle").focus();
				return;
			}else if($("#noticeContent").val() == ""){
				alert("공지 내용을 입력해주세요");
				$("#noticeContent").focus();
				return;
			}
			$("#addForm").submit();
		});
	});
</script>
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
	<form method="post" action="<%=request.getContextPath()%>/notice/insertNoticeAction.jsp" id="addForm">
		<table class="table table-bordered form-group">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="noticeTitle" id="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="5" name="noticeContent" id="noticeContent"></textarea></td>
			</tr>
		</table>
		<button class="btn btn-outline-info" type="button" id="addBtn">등록</button>
	</form>
	</div>
</div>	
</body>
</html>