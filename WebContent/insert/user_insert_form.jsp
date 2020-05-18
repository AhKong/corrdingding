<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%= request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" >


 $(function(){
	 var checkID = 0;
	 $('input[name=userId]').keyup(function(){
		 console.log($(this).val());
		 var userId = $(this).val();
		  // 아이디 중복 검사 확인 여부 
		 var request = $.ajax({
			url: "<%= request.getContextPath()%>/insert/idCheck.jsp", //통신할 url
			method: "POST", //통신할 메서드 타입
			data: { userId : userId }, //전송할 데이타
			dataType: "json" 
		 });	 
		 request.done(function( data ) {
			console.log(data.result);
			var warnIdCheck = $('#warn-idCheck');
			if(data.result =='Y'){
				//아이디 중ㄱ복인 경우
				warnIdCheck.css('display','block');
				checkID = 0;
			}else if(data.result =='N'){
				//아이디 중복 아닌경우
				warnIdCheck.css('display','none');
				checkID =1; // 
			}
		 });	 
		 request.fail(function( jqXHR, textStatus ) {
		   alert( "Request failed: " + textStatus );
	    	});	
	 })
	 
	 $('#joinBtn').click(function(){
		 var userId = $('input[name=userId]');
		 var userPw = $('input[name=userPw]');
		 var userPwCheck = $('input[name=userPwCheck]');
		 var userName = $('input[name=userName]');
		 var userEmail = $('input[name=userEmail]');
		
		
		 if(userId.val() == ''){
			 alert('아이디를 입력하세요');
			 userId.focus();
			 return;
		 }
		 if(checkID != 1){
			 alert('아이디 중복검사 하셈');
			 userId.focus();
			return;
		 } 
		 if(userPw.val() ==''){
			 alert('비밀번호를 입력하세요.');
			 userPw.focus();
			 return;
		 }
		 
		 if(userPw.val() != userPwCheck.val()){
			 alert('비밀번호가 일치하지 않습니다. ');
			 userPwCheck.focus();
			 return;
		 }
		 if(userName.val() ==''){
			 alert('이름을 입력하세요.');
			 userName.focus();
			 return;
		 }
		 if(userEmail.val()==''){
			 alert('이메일을 입력하세요.');
			 userEmail.focus();
			 return;
		 }
		 
		 $('#userForm').submit();
	 })
 })

</script>


<style>
span{border-width: 1px ;}
#btn{width:300px; height:50px;}
</style>
</head>
<body>
<div id="formwapper">
	<form id="userForm"action="<%= request.getContextPath() %>/insert/user_insert_pro.jsp" method="post">
		<label>
		<span>아이디</span>
			<input type="text" name="userId" placeholder="아이디를 입력해주세요"><br>
		</label>
		<div id="warn-idCheck" style="display:none;color:#ff0000">
			<p> 중복된 아이디 입니다</p>
		</div>
		<label>
		<span >패스워드</span>
			<input  type="password" name="userPw" placeholder="비밀번호를 입력해주세요"><br>
		</label>
		<label>
		<span >패스워드 확인</span>
			<input type="password" name="userPwCheck" placeholder="비밀번호를 다시 입력해주세요."><br>
		</label>
		<label>
		<span>이름</span>
			<input type="text" name="userName" placeholder="이름을 입력해주세요"><br>
		</label>
		
		<label>
		<span >이메일</span>
			<input type="text" name="userEmail" placeholder="이메일을 입력해주세요"><br>
		</label>
		
		<label>
		<span>프로필 사진</span>
			<input type="file" name="userProfile"><br>
		</label>
		
		<label>
		<span >한줄 소개</span>
			<input type="text" name="userDesc" placeholder="한줄소개를 입력해주세요"><br>
		</label>
		<button type="button" id="joinBtn"> 회원가입하기 </button>

	</form>
</div>
	
</body>
</html>