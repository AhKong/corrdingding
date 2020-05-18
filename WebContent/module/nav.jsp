<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">   
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩  프레임워크</title>
<!-- 부트스트랩 -->
<link href="<%= request.getContextPath() %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="<%= request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>  
<style>
 	img{
 		margin-top:-10px;
 	}
</style>
</head>
<% 
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_ID = (String)session.getAttribute("S_ID");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
%>
<body> 
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
		<a class="navbar-brand" href="<%= request.getContextPath()%>/index.jsp"><img src="<%= request.getContextPath()%>/resource/img/corrdingdinglogo.png" width="100"></a>
	      <%if(S_ID != null){ %>
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	    </div>
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown"> MENU <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="<%= request.getContextPath()%>/post/notice_content_list.jsp">공지사항</a></li>
	            <li><a href="<%= request.getContextPath()%>/post/java_content_list.jsp">Java</a></li>
	            <li><a href="<%= request.getContextPath()%>/post/js_jquery_content_list.jsp">JavaScript/JQUERY</a></li>
	            <li><a href="<%= request.getContextPath()%>/post/mysql_content_list.jsp">MySQL</a></li>
	            <li><a href="<%= request.getContextPath()%>/post/html_css_content_list.jsp">Html/CSS</a></li>
	            <li><a href="<%= request.getContextPath()%>/post/free_content_list.jsp">자유게시판</a></li>
	            <li><a href="<%= request.getContextPath()%>/insert/content_insert_form.jsp">게시글작성</a></li>
	            <li><a href="#">회원 검색</a></li>
	            <% if("1".equals(S_LEVEL)){ %>
	            <li><a href="#">관리자 페이지</a></li>
	            <%}%>
	          </ul>
	        </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <%= S_NAME %>님 <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="<%=request.getContextPath()%>/update/user_update_form.jsp?user_id=<%=S_ID%>">내 정보 수정</a></li>
	            <li><a href="<%= request.getContextPath()%>/login/user_logout_pro.jsp">로그아웃</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	    </div><!-- /.navbar-collapse -->
	    <%}else if(S_ID == null) {%>
	        <ul class="nav navbar-nav navbar-right">
	       	<li>
	       	<a href ="<%= request.getContextPath()%>/login/user_login_form.jsp"><button type="submit" class="btn btn-default loginBtn">LOGIN</button>
	  	     </a></li>
	      </ul>
	  	<%} %>
	  </div><!-- /.container-fluid -->
	</nav>
	

	
