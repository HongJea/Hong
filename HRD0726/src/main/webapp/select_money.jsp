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
<th>고객등급</th>
<th>매출</th>



</tr>

<%
int no=0,cnt=0;
ResultSet rs=null;
PreparedStatement pstmt=null;
String sql="select count(*) from money0726";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
if(rs.next()){
	cnt=rs.getInt(1);
}
%>

<hr>

<%
try{
  sql="select a.custno,a.custname,a.grade,sum(price) from member0726 a, money0726 b where a.custno=b.custno group by a.custno,a.custname,a.grade order by a.custno";
  pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	String custno=rs.getString(1);
	String custname=rs.getString(2);
	String grade=rs.getString(3);
	String price=rs.getString(4);
	
	
    no++;
%>

<tr>


<td><%=custno %></td>
<td><%=custname %></td>
<td><%=grade %></td>
<td><%=price %></td>




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