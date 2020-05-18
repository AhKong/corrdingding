<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/resource/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){ 
		var path = $(location).attr('pathname');
		console.log(path);
		var index = path.lastIndexOf('/');
		var cate = $('input[name=cate]');
	
		path = path.substr(23);
		var actionPath;
		console.log(path)
		if(path =="java_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("1");		
		} else if(path == "js_jquery_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("2");
		} else if(path =="mysql_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("3");
		} else if(path="html_css_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("4");
		} else if(path =="free_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("5");
		} else if(path ="notice_content_list.jsp"){
			actionPath = $(location).attr('pathname');
			cate.val("6");
		}
		console.log(cate.val());
		
		$('#searchForm').attr('action',actionPath);
		
		console.log($('#searchForm').attr('action'));
	})
</script>
		<form  id="searchForm" method="post">
			<input type="hidden" name="cate" >
			<select id ="selectCate" name="contentSearch">
			<option value="user_id">작성자 아이디</option>
			<option value="content_title">제목</option>
			<option value="content_desc">내용</option>
		</select>
	      <input class="search_word" type="text" name="searchWord"  placeholder="검색어를 입력하세요.">
	      <button  type="submit" class="search"  >  검색하기
	      </button>
	    </form>

