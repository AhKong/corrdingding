<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<jsp:include page="/module/nav.jsp"/>
<%
	String S_ID = (String)session.getAttribute("S_ID");
	if(S_ID == null){%>
	<jsp:include page="/module/main_none_login_ver.jsp"/>
<%} else if(S_ID !=null){%> 
	<jsp:include page="/module/main_login_ver.jsp"/>
<%}%>
<jsp:include page="/module/footer.jsp"/>
</div>