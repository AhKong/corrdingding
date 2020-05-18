<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.corrdingding.DriverDB.ConnectionDB" %>
<%@ page import = "com.corrdingding.DTO.*" %>

<html lang="ko">
<head>
<meta  charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댓글 입력창 </title>

<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/css/comment.css" rel="stylesheet">

<script  src="<%=request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@include file="/module/global_Val.jsp" %>
<% 
	

    
	Comment com = new Comment();
	
	String S_ID = (String)session.getAttribute("S_ID");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	String S_NAME = (String)session.getAttribute("S_NAME");
	
	System.out.println(S_ID +"S_ID");
	System.out.println(S_LEVEL +"S_LEVEL");
	System.out.println(S_NAME +"S_NAME");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try { 
		ConnectionDB db = new ConnectionDB();
		conn =db.DriverDB();
		System.out.println(conn +"<-----conn 임다");
		/* 게시글  코드 받아오기 힘들어 일단 게시글코드= 2로 받아오는 쿼리문 */
		pstmt = conn.prepareStatement("SELECT m.comment_code ,m.user_id ,m.content_code,m.comment_desc ,m.comment_reg_time FROM tb_content AS c JOIN tb_comment AS m ON c.content_code = m.content_code WHERE c.content_code =?; ");
		pstmt.setInt(1,contentCode);
		/* 게시글 코드 받아오는 쿼리문 */
		/* pstmt = conn.prepareStatement("SELECT m.comment_code ,m.user_id ,m.content_code,m.comment_desc ,m.comment_reg_time FROM tb_content AS c JOIN tb_comment AS m ON c.content_code = m.content_code WHERE c.content_code =  ?; ");
		pstmt.setString(1, Concate); */
		System.out.println(pstmt + "------>>> pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs m_list.jsp");

	
	while(rs.next()){


%>
	<%-- <form action="<%=request.getContextPath()%>/insert/comment_insert_pro.jsp" method="post"> --%>
	<!-- 댓글 목록 창  -->

	 <table  style="background-color: #fff;border-color: #fff; border"> 
	 
	<div id="commentList">
	 <tr>
	 <!-- 작성자아이디 -->
	 	<td width="100">
		 	<div style="margin-left: 20px">
		 	<h5><%= rs.getString("user_id") %></h5>
		 	</div>
	 	</td>
	 	<!-- 작성글 -->
	 	<td width="400">
	 		<div>
	 		<%= rs.getString("comment_desc") %>
	 		</div>
	 	</td>
	 	<!-- 작성시간 -->
	 	<td width="100">
	 		<div>
	 		<%= rs.getString("comment_reg_time") %>
	 		</div>
	 	</td>
	 	<!-- 신고,수정,삭제 로그인 유저만 가능하도록 설정 -->	
	 	<td width="40">
	 		<div>
	 		<!-- <%="${comment.user_id == S_ID }"%> --> 
	 		<a>[신고]</a>
	 		</div>
	 	</td>
	 	<td width="40">
	 	<%-- <div>
	 	<a href="<%= request.getContextPath() %>/update/comment_update_form.jsp?send_write=<%=rs.getString("comment_desc")%>">[수정]</a>
	 	</div> --%>
	 	<div>
	 	<a class="btn btn-none btn-xs" data-toggle="modal" data-target="#myModal">[수정]</a>
	 	</div>
	 	<!-- Modal -->
		<div class="modal fade" id="myModal" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">댓글 수정하기 </h4>
		      </div>
		      <div class="modal-body">
		        	<input type="text" style="border-style: none; width :500px; padding: 50px;" value=<%=rs.getString("comment_desc")%>>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-warning" ><a href="<%= request.getContextPath() %>/update/comment_update_pro.jsp?send_write=<%=rs.getString("comment_desc")%>">Save changes</a></button>
		      </div>
		    </div>
		  </div>
		</div>
	 	
	 	
	 	
	 	</td>
	 		<td width="40">
	 	<div>
	 	<a href="<%= request.getContextPath() %>/delete/comment_delete_pro.jsp?send_write=<%=rs.getString("comment_desc")%>">[삭제]</a>
	 	</div>
	 	</td>
	 
	 
	 
	 </tr>
	 
	 </table>
<%

	}

	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}


%>	
	<form action="<%=request.getContextPath()%>/insert/comment_insert_pro.jsp" method="post">
	
	<table  style="background-color: #fff;border-color: #fff; border">
	
	<!-- 댓글 입력 창  -->
	
<%--<% if(sessionScope.sessionID !=null){ 	%> --%> <!-- 로그인상태에서만 댓글 입력 가능 -->
			<tr>
			<td>
			
			<input type="hidden" name="comment_code" value="<%= com.getComment_code()%>">
			<input type="hidden" name="content_code" value="2">   <!-- 일단 임의로 게시글코드 2로  작성해놈 --> <!-- <%= com.getContent_code() %> -->
			<input type="hidden" name="comment_id" value= "<%= S_ID  %>"> <!-- 세션아이디 받아오기  -->
			</td>
			
			<!-- 본인 아이디 -->
					<td width="20"></td>
					<td width="80">
					<div>
					<%= S_ID %> <!-- sessionScope.sessionID  -->
					</div>
					</td>
			<!-- 댓글 입력창  -->
					<td width="300">
					<div>
					<!--  <input type="text" name="write_comm" size="100"> -->
					<textarea name="write_com" rows="3" cols="70" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					</td>
			<!-- 입력 버튼 -->
					<td width="100">
					<div id="btn" style="text-align: center; margin-left:20px;">
					<button type="submit" class="btn btn-default btn-sm" >입력</button>
					</div>
					</td>
					<td>
					</td>
			</tr>
		
		</div>
		</table>
<%--  <% } %> --%>
	</form>
<script  src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script>	
</body>

</html>