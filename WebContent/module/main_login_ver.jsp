<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.corrdingding.DAO.*" %>
<%@ page import ="com.corrdingding.DTO.*" %>
<%@ page import ="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
DAOContent daoContent = new DAOContent();


ArrayList<DTOContent> contentList = daoContent.noticeContents();
%>

 
	<div class="row" style="margin-top:15px;">
			<div class="col-sm-6">
				<div class="panel panel-default"> 
					<div class="panel-heading">
						<span class="glyphicon glyphicon-star"></span>
						  공지사항 
						  <div class="pull-right">
						    <span class="glyphicon glyphicon-plus"></span>						 
						 </div>
					</div>
					<div class="panel-body">
						<table class="table">
							<tbody>
							<%for(int i = 0; i<contentList.size();i++){
									int contentCode = contentList.get(i).getContent_code(); 
									String title =  contentList.get(i).getContent_title(); 
									%>
								<tr><td> <a href="<%= request.getContextPath() %>/post/content_detail.jsp?sendContentCode=<%=contentCode%>"><%=title%></a></td></tr>
							<%}
							contentList = daoContent.popularContents();
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
			<div class="panel panel-danger"> 
					<div class="panel-heading">
						<span class="glyphicon glyphicon-fire"></span>
						  인기글
						  <div class="pull-right">
						    <span class="glyphicon glyphicon-plus"></span>						 
						 </div>
					</div>
					<div class="panel-body">
					<table class="table">
							<tbody>
								<%for(int i = 0; i<contentList.size();i++){
									int contentCode = contentList.get(i).getContent_code(); 
									String title =  contentList.get(i).getContent_title(); 
									%>
								<tr><td> <a href="<%= request.getContextPath() %>/post/content_detail.jsp?sendContentCode=<%=contentCode%>"><%=title%></a></td></tr>
							<%}	%>
							</tbody>
								
						</table>
					</div>
				</div>
			</div>
		
		</div>
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-striped">
					<tbody>
						<tr><th>내 친구 글 보기</th></tr>
					</tbody>
					<tbody>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
						<tr><td>컨텐츠1</td></tr>
					</tbody>			
				</table>
			 </div>
		</div>