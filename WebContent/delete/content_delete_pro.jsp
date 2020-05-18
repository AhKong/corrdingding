<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.corrdingding.DAO.DAOContent" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String tempCode = request.getParameter("sendContentCode");
	String cate = request.getParameter("sendCate");
	String S_ID = (String)session.getAttribute("S_ID");
	
	System.out.println(S_ID +"<--S_ID");
	int contentCode = 0;
	if(tempCode!= null){
	  contentCode = Integer.parseInt(tempCode);
	}
	DAOContent daoContent = new DAOContent();
	daoContent.deleteContent(contentCode);

	String path = null;
	if("1".equals(cate)){
		path = "java_content_list.jsp";
	} else if ("2".equals(cate)){
		path = "js_jquery_content_list.jsp";
	} else if("3".equals(cate)){
		path ="mysql_content_list.jsp";
	} else if("4".equals(cate)){
		path ="html_css_content_list.jsp";
	} else if("5".equals(cate)){
		path ="free_content_list.jsp";
	} else {
		path ="notice_content_list.jsp";
	}   
	
	response.sendRedirect(request.getContextPath()+"/post/"+path);
	System.out.println(request.getContextPath()+"/post/"+path);
%>