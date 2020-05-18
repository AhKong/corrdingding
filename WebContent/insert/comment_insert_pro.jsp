<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.corrdingding.DAO.DAOComment" %>
<% request. setCharacterEncoding("UTF-8");%>
<jsp:useBean id="comment" class="com.corrdingding.DTO.Comment"/>  
<jsp:setProperty name="comment" property="*"/>


<%
	DAOComment daoComment = new DAOComment();
	daoComment.insertComment(comment);
	
	response.sendRedirect(request.getContextPath()+"/post/content_detail.jsp?sendContentCode="+comment.getContent_code());
%>