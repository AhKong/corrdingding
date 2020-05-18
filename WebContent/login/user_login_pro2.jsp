<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	System.out.println(id + "<- id");
	System.out.println(pw + "<- pw");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String dbid = null;
	String dbpw = null;
	String dblevel = null;	
	String dbname = null;
	String alert = null;


	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("01 드라이브연결 driverDbcon DriverDB.java");
	String jdbcDriver = "jdbc:mysql://192.168.123.68:3306/corrdingding?" +
			"useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	String dbUser = "corrdingding";
	String dbPass = "corrdingding";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- reconn driverDbcon DriverDB.java");
	System.out.println(conn + "<-- conn");
	pstmt = conn.prepareStatement("SELECT user_id,user_pw,user_name,user_level FROM tb_user WHERE user_id =  ?");
	pstmt.setString(1, id);
	System.out.println(pstmt + "<-- pstmt");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
	//System.out.println(rs.next() + "<-- rs.next()");
	if(rs.next()){
		System.out.println("01 아이디 일치 조건");
		dbid = rs.getString("user_id");
		dbpw = rs.getString("user_pw");
		dblevel =  rs.getString("user_name");	
		dbname =  rs.getString("user_level");
		System.out.println(dbpw + "<- dbpw ");
		System.out.println(dblevel + "<- dblevel ");
		System.out.println(dbname + "<- dbname ");
		if(pw.equals(dbpw)){
			System.out.println("03 로그인성공 조건");
			
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_LEVEL", dblevel);
			session.setAttribute("S_NAME", dbname);
			
			alert = "로그인성공";
		}else{
			System.out.println("04 비번 불일치 조건");	
			alert = "비번 불일치";
		}
	}else{
		System.out.println("02 아이디 불일치 조건");
		alert = "아이디 불일치";
	}
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
<%	

	
 
	rs.close();
	 pstmt.close(); 
	conn.close();


%>
