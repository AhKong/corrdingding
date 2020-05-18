<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.corrdingding.DAO.DAOUser"%>
<%@ page import ="com.google.gson.Gson" %>
<%@ page import ="java.util.*"%>
<%

	String userId = request.getParameter("userId");
	System.out.println(userId);
	DAOUser daou = new DAOUser();
	Map sendResult = new HashMap();
	int result = daou.checkId(userId);
	
	if(result == 1){ // 아이디가 중복 될 경우
		sendResult.put("result","Y");
	}else if(result ==0){ // 아이디 중복 아닌 경우
		sendResult.put("result","N");
	}
	Gson gson = new Gson();
	String json = gson.toJson(sendResult);
	System.out.println(json);
	out.println(json);
%>