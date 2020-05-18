<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#btn{width:100px; height:50px;}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
  
</script>
</head>
<body>
<form id="Usearchform" action="<%=request.getContextPath() %>/search/user_search_list.jsp" method="post">
   <select name="usersearch">
      <option value="content_title">search_title</option>
      <option value="user_id">user_id</option>
      <option value="content_desc">search_word</option>
   </select>

<input type="text" name="search_word" placeholder="검색">

<input id="btn"type="submit" value="검색">
</form>
</body>
</html>