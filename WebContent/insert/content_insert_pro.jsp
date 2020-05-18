<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.corrdingding.DAO.DAOContent" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="content" class="com.corrdingding.DTO.DTOContent"/>  
<jsp:setProperty name="content" property="*"/>
<%

	System.out.println(content);
	DAOContent daoContent = new DAOContent();
	daoContent.writeContent(content);
	
	String path = null;
	if("1".equals(content.getContent_cate())){
		path = "java_content_list.jsp";
	} else if ("2".equals(content.getContent_cate())){
		path = "js_jquery_content_list.jsp";
	} else if("3".equals(content.getContent_cate())){
		path ="mysql_content_list.jsp";
	} else if("4".equals(content.getContent_cate())){
		path ="html_css_content_list.jsp";
	} else if("5".equals(content.getContent_cate())){
		path ="free_content_list.jsp";
	} else {
		path ="notice_content_list.jsp";
	}   
	
	response.sendRedirect(request.getContextPath()+"/post/"+path);
	System.out.println(request.getContextPath()+"/post/"+path);
%>

