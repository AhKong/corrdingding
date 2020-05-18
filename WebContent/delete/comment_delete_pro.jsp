<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "com.corrdingding.DAO.DAOComment" %>
<%

	String commentCode =request.getParameter("commentCode");
	System.out.println(commentCode);
	DAOComment daoComment = new DAOComment();
	daoComment.deleteComment(commentCode);
	
	out.println("{ \"delete\":\"ok\"} ");
%>

