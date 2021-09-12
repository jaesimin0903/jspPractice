<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content ="width=device-width", initial-scale="1">

	<link rel ="stylesheet" href="css/bootstrap.css">
	<link rel ="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="js/bootstrap.bundle.min.js"></script>
<title>JSP 웹사이트</title>
</head>
<body>
<%
	String userID = null;
if(session.getAttribute( "userID") != null){
	userID = (String) session.getAttribute("userID");
}
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" "href="main.jsp">JSP 게시판 웹</a>
		<button  type="button" class="navbar-toggler"
		data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
		aria-expanded="false" aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item">
				<a class="nav-link" aria-current="page" href="main.jsp">메인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="bbs.jsp">게시판</a>
			</li>
			<%
				if(userID == null){
					
				
			%>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
				aria-expanded="false">접속하기</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
					<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
				</ul>
			</li>
			<%
				} else{
					
				
			%>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
				aria-expanded="false">회원관리</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
			<%
				}
			%>
		</ul>
	</div>
	</div>
	
</nav>

<div class="container">
	<form method="post" action="writeAction.jsp">
	<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="2" style="text-align:center; ">게시판 글쓰기 양식</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name ="bbsTitle" maxlength="50"></td>
			</tr>
			<tr>
				<td><textArea class="form-control" placeholder="글 내용" name ="bbsContent" maxlength="2048" rows="5"></textArea></td> 
			</tr>
		</tbody>
	</table>
	<input type="submit"  class="btn btn-primary float-end" value="글쓰기">
	</form>
</div>

</body>
</html>