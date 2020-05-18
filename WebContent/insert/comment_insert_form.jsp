<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta  charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댓글 입력창 </title>
</head>
<% String S_ID = (String)session.getAttribute("S_ID"); %>
<body>
	<form action="<%=request.getContextPath()%>/insert/comment_insert_pro.jsp" method="post">
		<input type="hidden" name ="content_code" value="">
		<textarea name="comment_desc" rows="3" cols="70" placeholder="댓글을 입력해주세요"></textarea>
		<button type="submit" class="btn btn-default btn-sm" >입력</button>
	</form>
</body>
</html>