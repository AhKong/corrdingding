<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.corrdingding.DTO.*" %>
<%@ page import ="com.corrdingding.DAO.*" %>
<%@ page import ="java.util.*" %>
<style>
	#content_detail_header{
		width:1000px;
		height:100px;
		text-align:center;
		margin-left:300px;
		padding-top:10px;
		font-size:20px;
		border: solid  1px #000;
	}
	span{
		font-size:30px;
	}
	#content_detail_body {
		width:1000px;
		min-height :500px;
		margin-top:0px;
		border: solid  1px #000;
		margin-left:300px;
		padding: 10 10;
		margin-bottom:30px;	
	}
	strong {
		padding-right:300px;
	}
	h4 {
	margin-top:30px;
		
		margin-left:300px;
	}
	.btn {
		margin-left :700px;
	}
	.another {
	margin-left :700px;
	}
	.another p {
		color :#ff0000;
		font-size:15px;
	}
	#comment-warp,#warp-commentForm{
		margin-left:300px;
		padding-bottom :10px;
	}
	.comment{
		  border-bottom: 1px solid black;
		  margin-bottom:10px;
		  font-size:15px;
		  width:1000px;
		  margin-left:300px;
		  padding-bottom:10px;
		  padding-left:10px;	  	
	}
	.regTime{
		margin-left:893px;
		font-size:10px;
	}
	.userID{
		margin-bottom:10px;
	}
	.userID li{
		list-style:none;
		float :right;
		padding-left :5px;
		font-size:12px;
		margin-bottom:10px;
	}
</style>
<%
	request.setCharacterEncoding("UTF-8");
    String tempCode = request.getParameter("sendContentCode");
    String S_ID = (String)session.getAttribute("S_ID");

    System.out.println(S_ID +"<--S_ID");
    int contentCode = 0;
    if(tempCode!= null){
      contentCode = Integer.parseInt(tempCode);
    }
	DAOContent daoContent = new DAOContent();
	DTOContent content = daoContent.readContent(contentCode);
    boolean isMyContent =daoContent.isMyContent(S_ID,contentCode);
    int mycontentCode = content.getContent_code();
	DAOView view = new DAOView();
    view.insertView(S_ID, contentCode);
    int viewCtn = view.viewCount(contentCode);
	daoContent.increasedView(viewCtn, contentCode);
	DAOConDeclare declare = new DAOConDeclare();
	boolean isDeclared = declare.isDeclared(S_ID, contentCode);
	DAOLike like = new DAOLike();
	boolean isLiked = like.isLiked(S_ID, contentCode);
	DAOComment daoComment = new DAOComment();
	ArrayList<Comment> commentList = daoComment.readComments(contentCode);
	boolean isMyComment; 
%>

<body>
<jsp:include page="/module/nav.jsp"/>
	<div id="content_detail_header">
		<strong><span><%= content.getContent_title()%></span></strong><br>
		작성자: <strong><%= content.getUser_id() %></strong>
	 	작성시간: <strong><%= content.getContent_reg_time()%></strong>
	</div>
	<div id="content_detail_body">
	<%= content.getContent_desc()%>
	</div>
	<%if(isMyContent){ %>
   
   <div class = "btn"> 
	 <a href ="<%= request.getContextPath()%>/update/content_update_form.jsp?sendContentCode=<%=mycontentCode%>">
	 	<button>게시글 수정</button>
	 </a>
	 <a id="deleteLink" href="#">
	 	<button id ="deleteBtn">게시글 삭제</button>
	 </a>
	</div>
  
	<% } else {%>
	 <div class="another">
	 		<% if(isDeclared){ %>
	 			<p>신고한 게시글 입니다</p>
	 		<% }else {%>
				  <a href="<%= request.getContextPath()%>/blockAndDeclare/content_declare_form.jsp?sendContentCode=<%=mycontentCode%>">
				 	<button class="btn-danger">신고</button>
				 	
				   </a>
				 
			 	  <a href="#">
			 	  	<img id="likeToggle" width="40" style="padding-top:10px"> 
			 	  </a>
			 	    <% }%>
			  	</div>
		<%} %>
		<!--여기ㅣ서 부터 댓글 -->
		<h4 style="margin-left:300px;"> 댓글..</h4>
		  <div id="warp-commentList">
	  <%
	  	String commentCode =null;
	  	for(int i =0; i<commentList.size();i++){ 
	  	
	    commentCode =commentList.get(i).getComment_code();
	  	System.out.println(commentCode);
	  	isMyComment = daoComment.isMyComment(S_ID, commentCode);
	  %>
	  		<div class="comment">
		  		<div class="userID">
		  			<%= commentList.get(i).getUser_id()%>
		  			<ul>
		  			<% if(isMyComment){ %> <!-- 내 댓글 -->
		  				<li>수정</li>
		  				<li>
		  					<a class="deleteLink" href="#" commentCode ="<%=commentCode%>" >삭제</a>
		  				</li>
		  			<%} else {%> <!-- 남의 댓글 -->
		  				<li>신고</li>
		  			<%} %>
		  			</ul>
		  		</div>
		  		
		  		<div class="desc">
		  			<%= commentList.get(i).getComment_desc()%> <br>
		  			<span class="regTime"> <%= commentList.get(i).getComment_reg_time()%> </span>
		  		</div>
		  	</div>	
	  <%} %>
	 
	  </div>
	
	  <div id="warp-commentForm">
	 	<%=S_ID %>님
	  	<form action="<%=request.getContextPath()%>/insert/comment_insert_pro.jsp" method="post">
			<input type="hidden" name ="content_code" value="<%= contentCode %>">
			<input type="hidden" name ="user_id" value="<%= S_ID%>">
			<textarea name="comment_desc" rows="3" cols="70" placeholder="댓글을 입력해주세요"></textarea>
			<button type="submit" id="commentBtn" >입력</button>
		</form>
	  </div>
		

<jsp:include page="/module/footer.jsp"/>
<script> 
	$(function(){
		var isLiked = <%= isLiked%>;
		var imgPath = '<%= request.getContextPath()%>/resource/img/';

 		var url ='<%= request.getContextPath()%>/like/' ; 
		if(isLiked){ // 좋아요를 누른 상태라면 ?
			imgPath += 'like.png';
			url += 'unlike_pro.jsp';
		} else {
			imgPath += 'unlike.png';
			url += 'like_pro.jsp';
		}
		$('#likeToggle').attr('src',imgPath);
		// 삭제 버튼 
	 	$('#deleteBtn').click(function(){
	 		var link = '<%= request.getContextPath()%>/delete/content_delete_pro.jsp?sendContentCode=<%=mycontentCode%>&sendCate=<%=content.getContent_cate()%>';
	 		var result = confirm('정말 삭제하시겠습니까?');
	 		if(result){
	 		    $('#deleteLink').attr('href',link);
	 		}else{
	 			 $('#deleteLink').attr('href','#');
	 		}
	 	})
	 	// 좋아요 토글 기능
	 	$('#likeToggle').click(function(){
	 		console.log(url);
	 		var userId ='<%=S_ID%>';
	 		var contentCode ='<%= contentCode%>';
	 		var request = $.ajax({
				  url: url,  
				  method: "POST",
				  data: { userId :userId ,contentCode:contentCode}, 
				  dataType: "json" 
			});
    
			request.done(function( data ) {		
				var toggle ;
				console.log(data);
				if(data.result =='like'){ // 좋아요 처리 완료
					// 하트가 빨간하트 
					$('#likeToggle').attr('src','<%= request.getContextPath()%>/resource/img/like.png');
					url ='<%= request.getContextPath()%>/like/unlike_pro.jsp'
				}else { //좋아요 취소 처리 완료
					$('#likeToggle').attr('src','<%= request.getContextPath()%>/resource/img/unlike.png');
					url ='<%= request.getContextPath()%>/like/like_pro.jsp'
				}
			});	
   
			request.fail(function( jqXHR, textStatus ) {
				  alert( "Request failed: " + textStatus );
			});
	
	 	})
	 	// 댓글 비동기 삭제
	 	$('.deleteLink').click(function(){
	 		var commentCode = $(this).attr('commentCode');
	 		var myComment = $(this);
	 		console.log($(this));	 		
	 		var request = $.ajax({
			  url: '<%= request.getContextPath()%>/delete/comment_delete_pro.jsp',  
				  method: "POST",
				  data: {commentCode:commentCode}, 
				  dataType: "json" 
			});
			request.done(function( data ) {	
				myComment.parents('.comment').remove();
				
			});	
			request.fail(function( jqXHR, textStatus ) {
				  alert( "Request failed: " + textStatus );
			});
	 	})
	})
</script>
</body>
