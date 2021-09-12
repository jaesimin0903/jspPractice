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
	
	<script src="js/bootstrap.bundle.min.js"></script>
<title>JSP 웹사이트</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute( "userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다. ')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다. ')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
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
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
				aria-expanded="false">회원관리</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
			
		</ul>
	</div>
	</div>
	
</nav>

<div class="container">
	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
	<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="2" style="text-align:center; ">게시판 글쓰기 양식</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name ="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
			</tr>
			<tr>
				<td><textArea class="form-control" placeholder="글 내용" name ="bbsContent" maxlength="2048" rows="5"><%= bbs.getBbsContent() %></textArea></td> 
			</tr>
		</tbody>
	</table>
	<input type="submit"  class="btn btn-primary float-end" value="글수정">
	</form>
</div>

</body>
</html>