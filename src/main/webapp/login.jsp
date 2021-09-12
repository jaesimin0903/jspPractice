<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<a class="nav-link" aria-current="page" href="bbs.jsp">게시판</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
				aria-expanded="false">접속하기</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item active" href="login.jsp">로그인</a></li>
					<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
	
</nav>
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron pt-5">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center;">로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div> 
	</div>
</div>
</body>
</html>