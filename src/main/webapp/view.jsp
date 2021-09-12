<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
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
	int bbsID=0;
	if(request.getParameter("bbsID") !=null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지않는 글입니다. ')");
		script.println("location.href = 'bbs.jsp'");
		script.println("<script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
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
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="3" style="text-align:center; ">게시판 글 보기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width : 20%;">글제목</td>
				<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")  %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"><%= bbs.getUserID() %></td> 
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시 " + bbs.getBbsDate().substring(14,16) + "분 " %></td> 
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5" style="min-height :200px; text-align:left; "><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td> 
			</tr>
		</tbody>
	</table>
	<a href ="bbs.jsp" class="btn btn-primary">목록</a>
	<%
		if(userID != null && userID.equals(bbs.getUserID())){
	%>
			<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
	<%
		} 
	%>		
	
	
</div>

</body>
</html>