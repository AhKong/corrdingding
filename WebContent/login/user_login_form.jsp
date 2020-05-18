<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta  charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>코르딩딩 로그인페이지 </title>

<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/css/login.css" rel="stylesheet">




<script  src="<%=request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#loginBtn').click(function(){
			var userId =$('#userId');
			var userPw =$('#userPw');
			if(userId.val()==''){
				alert('아이디를 입력해주세요');
				userId.focus();
				return false;
			}
			if(userPw.val()==''){
				alert('비밀번호를 입력해주세요');
				userPw.focus();
				return false;
			}
			$('#loginForm').submit();

		});
	});


</script>
</head>
<body>

<div class=".container-fluid">
<ol class="breadcrumb">
			  <li><a href="#">Home</a></li>
			  <li><a href="#">Join</a></li>
			</ol>
<div class="login-title">
<h1>LOGIN</h1>
</div>
	<div class="row">  
	 <div class="col-sm-6 col-sm-offset-3">
	 		
	 		<div class="panel panel-default">
	 		<div class="panel-body">
		 		<form id="loginForm" action="<%=request.getContextPath() %>/login/user_login_pro.jsp" method="post">
		 		
		  			<div class="form-group">
		  				<label for="userId">아이디</label> 
		  				<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디 입력">
		  			</div>
		  			<div class="form-group">
		  				<label for="userPw">패스워드</label> 
		  				<input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호 입력">
		  			</div>
		  			
		  			<div style="margin-bottom: 10px;">
		  			<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block">LOGIN</button>
		  			</div>
		  			<div class="form-group col-md-6">
		  			<a href="<%= request.getContextPath()%>/insert/user_insert_form.jsp"> 
		  				<button type="button" class="btn btn-default btn-lg btn-block"> JOIN</button>
		  			</a>
		  			</div>
		  			<div class="form-group col-md-6">
		  			<button type="button" class="btn btn-default btn-lg btn-block"><a href="#">pw찾기</a></button>
		  			</div>
	  			</form>
	 		
	 		</div>
	 		</div>
	 
	 </div>
	</div>
	<div class="row">
	 <div class="col-sm-6 col-sm-offset-3 footer-text">
	 코르딩딩 관리자 7조 
	 </div>
	</div>
</div>

<script  src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>