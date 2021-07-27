<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정화면</title>
<script>


function ok(){
if(document.form.custno.value==""){
	alert("교과목 코드가 입력되지 않았습니다.");
	document.form.custno.focus;
}else if(document.form.custname.value==""){
	alert("교과목명이 입력되지 않았습니다.");
	document.form.custname.focus;
}

else{
	document.form.submit();
}
}
</script>
<style type="text/css">
table {
	margin: auto; padding: auto;
	height: 300px;
	width: 45%;
}
h1{
text-align: center;
}
.in1{
height: 20px;
width: 100px;
}
.in2{
height: 30px;
width: 100px;
text-align: center;
background-color: #CC9999;
color: white;
}
.i3{
height: 20px;
width: 200px;
}
.i4{
height: 20px;
width: 300px;
}
</style>
</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>
<nav>
<%@include file="nav.jsp" %>
</nav>
<section>
<%@include file="dbconn.jsp"%>
<%
String custno=request.getParameter("custno");
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select * from member0726 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String custname=rs.getString("custname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String joindate=rs.getString("joindate");
		String grade=rs.getString("grade");
		String city=rs.getString("city");

%>
<h1>교과목 등록 화면</h1><br>
<form name="form" method="post" action="Update_insertserver_ONE.jsp">
<table border="1">
<tr>
<th>회원번호</th>

<td><input type="text" name="custno" class="in1" value="<%= custno %>"></td>
</tr>
<tr>
<th>회원성명</th>
<td><input type="text" name="custname" class="in1" value="<%= custname %>"></td>
</tr>

<tr>
<th>회원전화</th>
<td><input type="text" name="phone" class="i3" value="<%= phone %>"></td>
</tr>

<tr>
<th>회원주소</th>
<td><input type="text" name="address" class="i4" value="<%= address %>"></td>
</tr>

<tr>
<th>가입일자</th>
<td>
<input type="date" name="joindate" class="in1" id="currnetMonth" value="<%= joindate %>">

</td>
</tr>

<tr>
<th>요일</th>
<td><input type="text" name="grade" class="in1" value="<%= grade %>">
</td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" name="city" class="in1" value="<%= city %>"></td>
</tr>

<tr>
<td colspan="2" width="" align="center">
<a href="select.jsp"><input  name="button" type="button" value="조회" 
 height="30px" class="in2"></a><input   type="button" value="등록" height=30px onclick="javascript:ok()" class="in2">
</td> 
</tr>
<%
	}
%>
</table>
</form>
</section>
<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
<footer>
<%@include file="footer.jsp" %>

</footer>

</body>
</html>