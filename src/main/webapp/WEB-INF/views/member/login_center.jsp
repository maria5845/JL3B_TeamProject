<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>센터 로그인</title>
<style>
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

#wrap {
	min-height: 100%;
	position: relative;
}

#content {
	padding-bottom: 72px;
}

footer {
	margin-top: -72px;
	height: 72px;
	bottom: 0;
	left: 0;
	right: 0;
}

#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
	padding: 10px;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login2.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
		<div id="content">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Icon -->
    <div class="fadeIn first mt-3">
      <img src="${pageContext.request.contextPath }/resources/img/navi-logo.png" id="icon" alt="User Icon" />
    </div>
    <!-- Login Form -->
   <form action="./login_center_process.do" method="post" >
      <input type="text" id="login" class="fadeIn second" name="center_id" placeholder="아이디 ">
      <input type="password" id="password" class="fadeIn third" name="center_pw" placeholder="비밀번호">
      <input type="submit" class="fadeIn fourth" value="Log In" style="margin: 24px 20px 24px 20px">
    </form>
     <div id="formFooter">
      <a class="underlineHover" href="./join_member_choice.do" style="text-decoration: none; color: #56baed" >회원 가입</a>
    </div>
  </div>
</div>
  </div>
		
	</div>
   <jsp:include page="../commons/include_footer.jsp"></jsp:include>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"></script>
</body>
</html>
