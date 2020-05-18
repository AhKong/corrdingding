<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
	String tempCode = request.getParameter("sendContentCode");
	String S_ID = (String)session.getAttribute("S_ID");
	System.out.println(S_ID +"<--S_ID");
	 int contentCode = 0;
	if(tempCode!= null){
	  contentCode = Integer.parseInt(tempCode);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 신고</title>
</head>
<body>
<jsp:include page="/module/nav.jsp"/>
<div class="container-fluid">
	<div class="join-title">
		<h1> 게시물 신고 </h1>
	</div>
	<div class ="row">
		<div class="col-sm-6 col-sm-offset-3">
			<div class="panel panel-default">
				<div class="panel-body">
					<form id="declareForm" action="<%= request.getContextPath()%>/blockAndDeclare/content_declare_pro.jsp" method ="post">
						<input type="hidden" name="contentCode" value=<%= contentCode %>>
						<input type="hidden" name="userId" value=<%= S_ID %>>
						<label>
							<input type="radio"  name="declareCode" value="1"> 개인 정보 노출
						</label>
						<br>
						
						<label>
							<input type="radio" name="declareCode" value="2"> 내 창작물에 대한 저작권 침해
						</label>
						<br>
						<label>
							<input type="radio" name="declareCode" value="3"> 비방/비하, 명예훼손, 사생활침해	
						</label>
						<br>
						<label>
							<input type="radio" name="declareCode" value="4">음란/청소년에게 부적합한 내용, 악성코드
						</label>
						<br>
						<label>
							<input type="radio" name="declareCode" value="5">기타
						</label>
						<br>
						<label>
							<textarea name="declareDesc" style ="display:none"></textarea>
						</label>
						<br>
						<button type="button" id="declarBtn"> 신고하기 </button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/module/footer.jsp"/>

<script>
	$(function(){
		$('input[name=declareCode]').click(function(){
			var declareCode = $(this).val();
			var declareDesc =$('textarea[name=declareDesc]'); 
			if(declareCode == "5"){
				declareDesc.css('display','block');
			} else {
				declareDesc.css('display','none');
			}	
		})
		
		$('#declarBtn').click(function(){
			var selected = $('input[name=declareCode]:checked').val()
			console.log(selected);
			var declareDesc =$('textarea[name=declareDesc]'); 
			if(selected == "5" && declareDesc.val()==''){
				alert('신고 사유를 작성해주세요.');
				declareDesc.focus();
				return;
			} 	
			$('#declareForm').submit();
		})
	})

</script>
</body>