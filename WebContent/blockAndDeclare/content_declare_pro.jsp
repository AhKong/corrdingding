<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.corrdingding.DAO.DAOConDeclare" %>
<jsp:useBean id="declaration" class="com.corrdingding.DTO.ContentDeclare"/>  
<jsp:setProperty name="declaration" property="*"/>
<%
	request.setCharacterEncoding("UTF-8");
	DAOConDeclare declare = new DAOConDeclare();
	String alert = null;
	int result = declare.declareContent(declaration);
	if(result >0){
		alert ="정상적으로 신고가 접수 되었습니다.";
	} else {
		alert= "정상적인 신고 처리가 아닙니다. 다시 시도해주세요.";
	}
%>


<script type="text/javascript">
alert('<%= alert %>');
location.href='<%= request.getContextPath()%>/index.jsp';
</script>
