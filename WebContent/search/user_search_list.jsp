<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.corrdingding.DriverDB.ConnectionDB" %>    
<%@page import="java.sql.Connection" %>    
<%@page import="java.util.ArrayList" %>    
<%@page import="com.corrdingding.DAO.DAOContent" %>    
<%@page import="com.corrdingding.DTO.DTOContent" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");

String usersearchVal=request.getParameter("usersearch");

String searchword=request.getParameter("search_word");


System.out.println(usersearchVal+"usersearchVal");

DAOContent cdao=new DAOContent();
//DTOContent c=cdao.searchContent("user_id");
ArrayList<DTOContent> c=cdao.searchContent(usersearchVal,searchword);
System.out.println(c+"<< searchContent메서드 리턴값");



%>
<table>
	<tr>
		<th>게시글 코드</th>
		<th>작성자 아이디</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>조회수</th>
		<th>내용</th>
		<th>게시글 작성시간</th>

	</tr>
	<% 
	for(int i=0; i <c.size(); i++){ %>
	<tr>
		<td><%=c.get(i).getContent_code()%></td>
		<td><%=c.get(i).getUser_id()%></td>
		<td><%=c.get(i).getContent_title()%></td>
		<td><%=c.get(i).getContent_cate()%></td>
		<td><%=c.get(i).getView_count()%></td>
		<td><%=c.get(i).getContent_desc()%></td>
		<td><%=c.get(i).getContent_reg_time()%></td>
	</tr>
	<%} %>
</table>
</body>
</html>