<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
margin: 0;
	padding: 0;
}
html,body{
height:100%;
}
#wrap{
min-height: 100%;
position: relative;
}
#content{
margin-bottom: 72px;
}
footer{
margin-top:-72px;
height : 72px;
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>

<body>
<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div id="content">
	<div class="container text-center">
		<div class="row">
			<div class="col" style="margin-top: 100px">
				<img
					src="${pageContext.request.contextPath }/resources/img/join-choice-page.png">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-2"></div>
			<div class="col text-center">
				<div class="row mt-4">
					<div class="col">
						<div class="row">
							<div class="col-md-12 text-center">
								<a
									href="${pageContext.request.contextPath }/member/join_member.do"><button
										class="btn btn btn-danger btn-round" style="width: 100%">입주민
										가입</button></a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col-md-12 text-center">
								<a
									href="${pageContext.request.contextPath }/member/join_center.do"><button
										class="btn btn btn-danger btn-round" style="width: 100%">센터
										가입</button></a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="col-2"></div>
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