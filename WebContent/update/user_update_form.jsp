<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.corrdingding.DAO.DAOUser"%>
<%@ page import = "com.corrdingding.DTO.UserDto"%>
<%@ page import = "java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resource/css/userupdate.css" rel="stylesheet">


<script  src="<%=request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

<%
	request.setCharacterEncoding("EUC-KR");
	String sid=request.getParameter("user_id");
	//String sid=(String)session.getAttribute("S-ID");
	System.out.println(sid+"<sid");
	DAOUser userdao=new DAOUser();
	UserDto user=userdao.searchUser(sid);
	
	

%>
<div class="container-fluid">
	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-default">
					<div class="panel heading">
					<strong><p class="text-success text-center ">update your profile</p></strong>	
					</div>
					<div class="panel body">
<form class="form-horizontal" action="../update/user_update_pro.jsp" method="post">
 <div class="form-group">
    <label for="inputId" class="col-sm-2 control-label">your id</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="inputId" placeholder="Password" value="<%=sid %>" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="inputPassword" placeholder="Password" value="<%=user.getUserPw() %>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="inputName" placeholder="Name" value="<%=user.getUserName() %>">
    </div>
  </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="inputEmail" placeholder="Email" value="<%=user.getUserEmail() %>">
    </div>
  </div>
   <div class="form-group">
    <label for="userprofile" class="col-sm-2 control-label">Your Photo</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" name="userprofile" placeholder="profile" value="<%=user.getUserProfile() %>">
    </div>
  </div>
  <div class="form-group">
    <label for="userintro" class="col-sm-2 control-label">Introduce</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="userintro" placeholder="Introduce" maxlength="100" value="<%=user.getUserIntro() %>">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-5 col-sm-7">
      <button type="submit" class="btn btn-default">Update</button>
    </div>
  </div>
</form>
					</div>
				</div>
			</div>	
	</div>
</div>

</body>
</html>