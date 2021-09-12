<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
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
<style>
	a, a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
</head>

<body>
<%
	String userID = null;
if(session.getAttribute( "userID") != null){
	userID = (String) session.getAttribute("userID");
}
int pageNumber =1 ;
if(request.getParameter("pageNumber")!=null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="text-align:center; ">번호</th>
				<th style="text-align:center; ">제목</th>
				<th style="text-align:center; ">작성자</th>
				<th style="text-align:center;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<%
			BbsDAO bbsDAO = new BbsDAO();
			ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
			for(int i = 0; i< list.size(); i++){
		%>
			<tr>
				<td style="text-align:center;"><%= list.get(i).getBbsID() %></td>
				<td style="text-align:center;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
				<td style="text-align:center;"><%= list.get(i).getUserID() %></td>
				<td style="text-align:center;"><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16) + "분 " %></td>
				
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
		if(pageNumber != 1){
			
		
	%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class ="btn btn-success btn-arrow-left">이전</a>
		<%
		}if(bbsDAO.nextPage(pageNumber + 1)){
		%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class ="btn btn-success btn-arrow-right">다음</a>
		<%
		}
		%>
		
	<a  class="btn btn-primary float-end" href="write.jsp">작성하기</a>
</div>

</body>
</html>