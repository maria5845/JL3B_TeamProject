
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Touche 주민청원</title>
<style type="text/css">
#nav {
	position: 0px auto;
	margin: 0;
	padding: 0;
	text-align: center;
	margin: 0;
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

	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<div class="col text-center mt-3">
		<div class="row">
			<div class="col">
				<h1>공지사항 대표이미지 출력</h1>
			</div>
		</div>
	</div>
	<div style="border-bottom: 1em, #6ac9ca;"></div>
	<!--게시판 출력-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col">
						<table class="table table-hover text-center">
							<thead style="font-size: small">
								<tr>
									<td>말머리</td>
									<td class="text-left pl-1">제 목</td>
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
								</tr>
							</thead>
							<!-- 공지리스트 출력 -->
							<tbody>
								<c:forEach items="${noticeList }" var="noticeList">
									<tr class="text-center">
										<td style="font-weight: bold">${noticeList.horseheadVo.horsehead_title }</td>
										<td class="text-left pl-1"><a
											href="${pageContext.request.contextPath }/board/notice_read.jan?notice_no=${noticeList.noticeVo.notice_no}&horsehead_sort=${noticeList.horseheadVo.horsehead_sort }">${noticeList.noticeVo.notice_title }</a></td>
										<td>${noticeList.resiVo.resi_rname }</td>
										<td><fmt:formatDate
												value="${noticeList.noticeVo.notice_wdate }"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${noticeList.noticeVo.notice_hits }</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-1"></div>
			</div>
			<div class="col-1"></div>
		</div>

	</div>
	<!-- 게시판 아래 메뉴들  -->
	<div class="container mt-3">
		<div class="row">
			<div class="col-1"></div>
			<!--검색-->
			<div class="col">
				<form action="./board.jan" method="get">
					<div class="row">
						<div class="col-3" style="padding-right: 0px">
							<input placeholder="검색어를 입력하세요" name="searchWord" type="text"
								class="form-control">
						</div>
						<!-- 게시글 검색어 입력-->
						<div class="col-2">
							<input type="submit" class="btn btn-primary btn-block" value="검색">
						</div>
					</div>
				</form>
			</div>
			<div></div>
			<!-- 글쓰기 버튼 -->
			<div class="col-2">
				<c:set var="admin" value="${sessionUser.npki_key}"></c:set>
				<!-- 로그인회원이 admin일 때 글쓰기 가능 -->
				<c:if test="${fn:contains(admin,'admin')}">
					<a
						href="${pageContext.request.contextPath }/board/notice_write.jan"
						class="btn btn-primary btn-block">글쓰기</a>
				</c:if>
			</div>
			<div class="col-1"></div>

		</div>

	<div class="row mt-3">
		<div class="col-2"></div>
		<!-- 페이지 이동 -->
		<div class="col">
			<div class="row">
				<div class="col-4"></div>
				<div class="col">
					<nav id="nav" aria-label="Page navigation example"
						style="text-align: center">
						<ul class="pagination">
							<li
								class="page-item<c:if test="${beginPage-1 <= 0 }"> disabled</c:if>"><a
								class="page-link"
								href="./notice.jan?currPage=${beginPage-1}&searchWord=${param.searchWord}">이전</a></li>
							<c:forEach begin="${beginPage}" end="${endPage}" var="i">
								<li
									class="page-item<c:if test="${currPage == i}"> active</c:if>"><a
									class="page-link"
									href="./notice.jan?currPage=${i}&searchWord=${param.searchWord}">${i}</a></li>
							</c:forEach>
							<li
								class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
								class="page-link"
								href="./notice.jan?currPage=${endPage+1}&searchWord=${param.search_word}">다음</a></li>
						</ul>
					</nav>

				</div>
				<div class="col-2"></div>

			</div>
		</div>
		<div class="col-2"></div>
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