<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript">
function ok(){
	if(document.form.userID.value==""){
		alert("ID를 입력해 주세요.");
		document.form.userID.focus();
	}

	else{
		document.form.submit();
	}
	}
</script>
<title>Main JSP Home page</title>
</head>
<body>
<%
String userID = null;
 if(session.getAttribute("userID") != null){
	 userID = (String) session.getAttribute("userID");
 }
%>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  aria-expanded="false">
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  </button>
  <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
  </div>
  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
  <li class="active"><a href="main.jsp">메인</a></li>
  <li><a href="gst.jsp">게시판</a></li>
  </ul>
  <%
  if(userID == null){
  %>
    <ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
  <a href="#" class="dropdown-toggle"
  data-toggle="dropdown" role="button" aria-haspopup="true"
  aria-expanded="false">접속하기<span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="login.jsp">로그인</a></li>
    <li ><a href="join.jsp">회원가입</a></li>
  </ul>
  </li>
  </ul>
  <%
  } else{
  %>
     <ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
  <a href="#" class="dropdown-toggle"
  data-toggle="dropdown" role="button" aria-haspopup="true"
  aria-expanded="false">회원관리<span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="logoutAction.jsp">로그아웃</a></li>
    
  </ul>
  </li>
  </ul>
  <%
  }
  %>
  </div>
 </nav>
 <section>
 <div class="cont">
   <div class="contBO">
   <img  src="img/hed.jpg" style="height: 200px; width: 400px;">
   </div>
   <br><br>
   <div class="contBO">
   <img  src="img/20170807_170719_6.jpg" style="height: 200px; width: 400px;">
   </div>
      <br><br>
   <div class="contBO">
   <img  src="img/havana.jpg" style="height: 200px; width: 400px;">
   </div>
 </div>
 </section>
 <footer>
 
 </footer>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script type="text/javascript" src="js/bootstrap.js">
</script>
</body>
</html>