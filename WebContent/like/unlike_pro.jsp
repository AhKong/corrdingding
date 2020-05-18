<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.corrdingding.DAO.DAOLike" %>
<%@ page import ="com.google.gson.Gson" %>
<%@ page import ="java.util.*"%>
<%


 String userId = request.getParameter("userId");
 int contentCode = Integer.parseInt(request.getParameter("contentCode"));
 System.out.println(userId+ contentCode);
 
 DAOLike like = new DAOLike();
 like.cancelLike(userId, contentCode);
 Map sendResult = new HashMap();
 
sendResult.put("result","unlike");
Gson gson = new Gson();
String json = gson.toJson(sendResult);
out.println(json);
 
%>