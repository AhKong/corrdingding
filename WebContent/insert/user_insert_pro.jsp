 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.Connection" %>
<%@ page import="com.corrdingding.DAO.DAOUser" %>
<jsp:useBean id="user" class="com.corrdingding.DTO.UserDto"/>
<jsp:setProperty name="user" property="*"/>

<%
	DAOUser udao = new DAOUser();
	int result = udao.insertUser(user);
	String alert = null;
	
	if(result >0){
		alert ="가입완료!";

	} else {
		alert ="가입 실패";
	}
%>
<script>
	alert('<%= alert%>');
	location.href ="<%= request.getContextPath()%>/login/user_login_form.jsp";
</script>