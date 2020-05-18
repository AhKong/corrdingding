<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.corrdingding.DAO.*" %>
<%@ page import ="com.corrdingding.DTO.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVA 게시판</title>
<style>
    #wrap-searchForm{
	    float: left;
	    padding-bottom:20px;
	    margin-left : 1300px;
    }
</style>
</head>
<body>
<div id="wrap-contentsList">
<%@ include file="/module/nav.jsp" %>
	<div style="text-align :center;">
		<h1> <%=name%>게시판 </h1>
	</div>
	<div id="wrap-searchForm">
		<%@ include file="/search/content_search_form.jsp" %>
	</div>
	<table class="table table-striped">
	
		<tr> 
			 <td>NO</td>
			 <td>작성자</td>
			 <td>제목</td>
			 <td>조회수</td>
			 <td>작성시간</td>
		 </tr>
	<%
		request.setCharacterEncoding("UTF-8");
		String contentSearch = request.getParameter("contentSearch");
		String searchWord = request.getParameter("searchWord");
		System.out.println(cate + contentSearch +searchWord);
		DAOContent daoContent = new DAOContent();
		ArrayList<DTOContent> contentList = daoContent.readContentList(contentSearch,searchWord,cate);
		for(int i = 0; i<contentList.size();i++){
			DTOContent content = contentList.get(i);
		%>
		<tr>
			<td><%= content.getContent_code()%></td>
			<td> <%= content.getUser_id()%></td>
			<td> <a href="<%= request.getContextPath() %>/post/content_detail.jsp?sendContentCode=<%=content.getContent_code()%>"><%= content.getContent_title()%></a></td>
			<td> <%=content.getView_count()%></td>
			<td> <%= content.getContent_reg_time()%></td>	
		</tr>	
	<% 
		}
	%>
	</table>
	<%if(!"6".equals(cate)||"1".equals(S_LEVEL)){ %>
	<div>
		<a href="<%= request.getContextPath()%>/insert/content_insert_form.jsp?send_cate=<%= cate%>"><button> 게시글 작성 </button>
	</a>
	</div>
	<%} %>
<%@ include file="/module/footer.jsp" %>
</div>
</body>
</html>