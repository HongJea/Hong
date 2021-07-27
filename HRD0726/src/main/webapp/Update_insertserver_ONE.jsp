<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>

<%PreparedStatement pstmt=null;
request.setCharacterEncoding("UTF-8");
String custno=request.getParameter("custno");
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");



try{
	String sql=
			 "update member0726 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(7, custno);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			
			
			pstmt.executeUpdate();
			System.out.println("회원번호 : "+custno);
			System.out.println("성명 : "+custname);
			System.out.println("전화 : "+phone);
			System.out.println("주소 : "+address);
			System.out.println("가입일자 : "+joindate);
			System.out.println("고객등급 : "+grade);
			System.out.println("거주도시 : "+city);
			
			
			System.out.println("수정성공");
			}
			catch(SQLException e){
				System.out.print("수정실패");
				e.printStackTrace();
				
			}finally{
				if (pstmt !=null)
					pstmt.close();
				if (conn !=null)
					conn.close();
			}
			%><script>

			alert("수정이 완료되었습니다.");
			history.back();

			</script>
}


</body>
</html>