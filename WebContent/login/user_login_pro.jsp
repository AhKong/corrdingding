<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "com.corrdingding.DAO.DAOUser" %>
<%@ page import = "com.corrdingding.DTO.UserDto" %>


<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	System.out.println(id + "<- id");
	System.out.println(pw + "<- pw");
	String alert = null;

	DAOUser login = new DAOUser();
	String result = login.UserLogin(id, pw);
	System.out.println(result + "<-- result");
	if(result.equals("로그인성공")){
		System.out.println("01 로그인 성공이면?");
		UserDto user = login.UgetSession(id);
		session.setAttribute("S_ID", user.getUserId());
		session.setAttribute("S_LEVEL",user.getUserLevel());
		session.setAttribute("S_NAME",user.getUserName());
		alert = "로그인성공";
		}else if (result.equals("비번불일치")){
			System.out.println("02 비번 불일치 조건");	
			alert = "비번 불일치";
		}else{
		System.out.println("03 아이디 불일치 조건");
		alert = "아이디 불일치";
		}
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

