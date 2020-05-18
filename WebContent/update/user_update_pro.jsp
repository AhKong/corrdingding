<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%request.setCharacterEncoding("UTF-8"); %>
 <%@ page import = "com.corrdingding.DriverDB.ConnectionDB" %>
 <%@ page import = "java.sql.Connection" %>
 <%@ page import = "java.sql.PreparedStatement" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String inputId=request.getParameter("inputId");
	String inputPassword=request.getParameter("inputPassword");
	String inputName=request.getParameter("inputName");
	String inputEmail=request.getParameter("inputEmail");
	String userprofile=request.getParameter("userprofile");
	String userintro=request.getParameter("userintro");
	
	ConnectionDB db=new ConnectionDB();
	Connection conn=db.DriverDB();
	
	PreparedStatement pstmt=conn.prepareStatement("UPDATE tb_user SET user_pw=?,user_name=?,user_email=?,user_profile=? WHERE user_id=?; ");
	pstmt.setString(1, inputPassword);
	pstmt.setString(2, inputName);
	pstmt.setString(3, inputEmail);
	pstmt.setString(4, userprofile);
	pstmt.setString(5, inputId);
	
	
	int result=pstmt.executeUpdate();
	System.out.println(result+"update완료");
	pstmt.close();
	conn.close();
%>
</body>
</html>