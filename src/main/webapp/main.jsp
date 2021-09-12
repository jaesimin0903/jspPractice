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
<style type="text/css">
	.jumbotron {
            background-image: url('images/example1.png');
            background-size: 100%;
            text-shadow: black 0.2em 0.2em 0.2em;
            color : white;
            border-radius: 0.5em;
            height: 50vh;
            
            
        }
        .vertical-center {
  min-height: 50%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 30vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}
</style>
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
				<a class="nav-link active" aria-current="page" href="main.jsp">메인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" aria-current="page" href="bbs.jsp">게시판</a>
			</li>
			<%
				if(userID == null){
					
				
			%>
			<li class="nav-item dropdown float-end">
				<a class="nav-link dropdown-toggle float-end" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
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
<div class="container" style="padding : 50px;">
        <div class="jumbotron vertical-center">
            <div class="col"style="text-align: center; ">
          
            <h1 class="display-4" >안녕하세요 재승하숙입니다.</h1>
            <p class="row-4">숙명여대에 위치한 하숙집입니다.</p>
            <div class="dropdown">
              <button class="btn btn-primary dropdown-toggle" type ="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                방 보러 가기
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="room1.html">1층</a></li>
                <li><a class="dropdown-item" href="room3.html">3층</a></li>
              </ul>
            </div>
            
            </div>
        </div>
       
        <hr>
       
    </div>
</body>
</html>