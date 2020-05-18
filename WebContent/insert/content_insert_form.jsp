<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 글 작성 </title>
<style>
*{
	margin:0;
	padding:0;
}
#editor-container {
  height: 375px;
  width:1200px;
  margin-left:283px;
 float:clear; 
}
.ql-toolbar{
	width:1200px;
	margin-left:283px;
}

.writeBtn{
	margin-left:1395px;
	margin-top:30px;
}
#title {
	width:800px;
	height:40px;
	margin-left:283px;
	margin-bottom:10px;
}
ul{
	float :left;
	  list-style:none;
}
#contentWriteForm{
	margin-top:50px;
	margin-bottom:180px;
}
</style>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<% String send_cate  = request.getParameter("send_cate");%>
<script>
	$(function(){
		var sendCate = <%= send_cate%>;
		console.log(sendCate);
		if(sendCate =="1"){
			$("#selectCate").val("1").prop("selected", true);
		} else if(sendCate =="2"){
			$("#selectCate").val("2").prop("selected", true);
		} else if(sendCate =="3"){
			$("#selectCate").val("3").prop("selected", true);
		} else if(sendCate =="4"){
			$("#selectCate").val("4").prop("selected", true);
		} else if(sendCate =="5"){
			$("#selectCate").val("5").prop("selected", true);
		} else if(sendCate =="6"){
			$("#selectCate").val("6").prop("selected", true);
		}
		$('#writeBtn').click(function(){
			var contents = $('.ql-editor').html();
			$('input[name=content_desc]').val(contents);
			var title = $('input[name=content_title]');
			var cate = $('#selectCate');
			var contentWriteForm = $('#contentWriteForm');
			if(title.val() ==''){
				alert('제목을 입력하세요');
				title.focus();
				return;
			}
			
			if(contents =='<p><br></p>'){
				alert('내용을 입력하세요');
				return;
			}
			if(cate.val()=='none'){
				alert('카테고리를 선택해주세요.')
				cate.focus();
				return;
			}
			 $('#contentWriteForm').submit();
		})
	})
</script>
</head>
<body>
<div id="warp-WritePage">

<%@ include file="/module/nav.jsp" %>
<form id="contentWriteForm" action="<%= request.getContextPath()%>/insert/content_insert_pro.jsp" method ="post">
		<input type="hidden" name="user_id" value="<%=S_ID%>">
		<input type="hidden" name="content_desc" >
      		<input type="text" name="content_title" class="form-control" id="title" placeholder="제목을 입력하세요!">
  			<select id="selectCate"  class="form-control "name="content_cate" style ="width:300px; margin-left:283px; margin-bottom:15px;">
			<option  value ="none">카테고리를 선택해주세요</option>
			<option value ="1">JAVA</option>
			<option value ="2">JavaScript/JQuery</option>
			<option value ="3">MySQL</option>
			<option value ="4">Html/CSS</option>
			<option value ="5">자유게시판</option>
			<%if(S_LEVEL.equals("1")){%>
				<option value ="6">공지사항</option>
			<% }%>
		</select>


		<div id="editor-container" >	
		</div>
  		<button type="button"  class="writeBtn btn btn-primary " id="writeBtn">게시글 작성</button>
	</form>
	<jsp:include page="/module/footer.jsp"/>
</div>
	
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- Initialize Quill editor -->
<script>
  var quill = new Quill('#editor-container', {
	  modules: {
	    toolbar: [
	      [{ header: [1, 2, false] }],
	      ['bold', 'italic', 'underline'],
	      ['image', 'code-block']
	    ]
	  },
	  placeholder: '게시글을 작성해주세요!',
	  theme: 'snow'  // or 'bubble'
	});
</script>
</body>
</html>

