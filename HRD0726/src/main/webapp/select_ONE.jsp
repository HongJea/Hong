<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보목록</title>

<style>
table{
margin-left: auto; margin-right: auto;
text-align: center;
}
section h2{
text-align: center;
}
.in3{
margin-left: auto;  margin-right: auto;
}
.in4{
text-align: center;align: center;
}
.in5{

text-align: center;
}
.in6{
height: 40px;
width: 100px;
background-color: #CC9999;
color: white;
}
.in7{
color: black;
}
</style>

</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>


<nav>
<%@ include file="nav.jsp" %>
</nav>
<section>
<h2>학사 정보 목록</h2>
<%@include file="dbconn.jsp" %>


<table width="80%" border=1 >



<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>


</tr>

<%
int no=0,cnt=0;
ResultSet rs=null;
PreparedStatement pstmt=null;
String sql="select count(*) from member0726";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
if(rs.next()){
	cnt=rs.getInt(1);
}
%>
총<%=cnt %>명의 회원정보가 있습니다.
<hr>

<%
try{
  sql="select * from member0726";
  pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	String custno=rs.getString(1);
	String custname=rs.getString(2);
	String phone=rs.getString(3);
	String address=rs.getString(4);
	String joindate=rs.getString(5);
	String grade=rs.getString(6);
	
	String city=rs.getString(7);
	
    no++;
%>

<tr>

<td><a href="Update_insert_ONE.jsp?custno=<%=custno %>" class="in7"><%=custno %></a></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade %></td>
<td><%=city %></td>





</tr>
<% 
}

}
catch(SQLException e){
	System.out.println("조회실패");
}
%>
</table>
<br>
<div class="in5">
<a href="insert_gamok.jsp"><input type="button" value="학사정보 추가" class="in6"></a>
</div>
</section>

<footer>
<%@ include file="footer.jsp" %>
</footer>
</body>
</html>