<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
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

.thm-container {
    width: 100%;
    max-width: 1200px;
    padding-left: 15px;
    padding-right: 15px;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

.contact-form-content {
    background: #F5F6FA;
    padding: 80px 0;
    padding-left: 80px;
    padding-right: 80px;
}

.thm-container .title {
    margin-bottom: 50px;
}

.thm-container .title span {
    font-family: 'Rubik', sans-serif;
    font-size: 20px;
    color: #FF4328;
}

.thm-container .title h2 {
    color: #212121;
    font-size: 60px;
    line-height: 60px;
    font-weight: bold;
}

.contact-form input, 
.contact-form textarea {
    border: none;
    outline: none;
    width: 100%;
    height: 68px;
    border-radius: 35px;
    background: #fff;
    color: #757575;
    font-size: 16px;
    padding-left: 50px;
    margin-bottom: 20px;
    display: block;
}

.contact-form textarea {
    height: 182px;
    padding-top: 20px;
}

.thm-btn {
    border: none;
    outline: none;
    display: inline-block;
    vertical-align: middle;
    background: #FEC931;
    color: #212121;
    border-radius: 35px;
    font-family: 'Rubik';
    font-weight: 500;
    font-size: 16px;
    padding: 18px 69px;
    -webkit-transition: all .4s;
    transition: all .4s;
}

.contact-info {
    margin-left: -30px;
    border: 2px solid #EBEDF4;
    padding-top: 75px;
    padding-bottom: 80px;
}

.single-contact-info h4 {
    color: #212121;
    font-size: 18px;
    font-weight: 500;
    margin-bottom: 10px;
}

.contact-info .social a {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    color: #fff;
    font-size: 18px;
    line-height: 59px;
    text-align: center;
    line-height: 50px;
    margin-top: 10px;
    display:inline-block;
    font-family: FontAwesome;
    margin:5px;
}

.contact-info .social a.fa-twitter {
    background: #FEC931;
}

.contact-info .social a.fa-pinterest {
    background: #212121;
}

.contact-info .social a.fa-facebook-f {
    background: #2884C6;
}

.contact-info .social a.fa-youtube {
    background: #FF4328;
}



</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">

		<!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>센터 클래스 페이지</title>

        <!-- CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/media-queries.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/carousel.css">
        
<script type="text/javascript">


	var contentfill = false;
	
	function submitActive() {
	   if(contentfill == false) {
	   document.getElementById("able").setAttribute("disabled","true");
	   } else {
	   document.getElementById("able").removeAttribute("disabled");
	   }
	}
	
	function minlength2() {
	   var content = document.getElementById("reviewContent").value;
	   if(content.length >= 3 ){
	      contentfill = true;
	      submitActive();
	   }else{
	      contentfill = false;
	      submitActive();
	   }
	   
	}
	
	
	function submit_btn(){
	      
	      if(confirm("게시물을 등록하시겠습니까?")== true){
	         document.getElementById("submit").submit();
	         
	      }
	}

</script>        
        
</head>

    <body>
	<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div id="content">
        <!-- Top content -->
        <div class="top-content">
        	<div class="container-fluid">
        		<div id="carousel-example" class="carousel slide" data-ride="carousel">
        			<!--  여기 자리에 이미지 포이치 문 들어가면 됩니다. -->
        			<div class="carousel-inner row w-100 mx-auto" role="listbox">
            			<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 active">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/1.jpg" class="img-fluid mx-auto d-block" alt="img1">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/2.jpg" class="img-fluid mx-auto d-block" alt="img2">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/3.jpg" class="img-fluid mx-auto d-block" alt="img3">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/4.jpg" class="img-fluid mx-auto d-block" alt="img4">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/5.jpg" class="img-fluid mx-auto d-block" alt="img5">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/6.jpg" class="img-fluid mx-auto d-block" alt="img6">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/7.jpg" class="img-fluid mx-auto d-block" alt="img7">
						</div>
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/8.jpg" class="img-fluid mx-auto d-block" alt="img8">
						</div>
        			</div>
        			<a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
        		</div>
        	</div>
        </div>

        <!-- Section 1 -->
        <div class="section-1-container section-container">
	        <div class="container">
	            <div class="row">
	                <div class="col section-1 section-description wow fadeIn">
	                    <h1>리뷰작성 페이지</h1>
	                    <div class="divider-1 wow fadeInUp"><span></span></div>
	         <div class="thm-container">
         <div class="row">
             <div class="col">
                 <div class="contact-form-content">
                     <div class="title">
                     </div><!-- /.title -->
                     <form action="${pageContext.request.contextPath }/center/review_write_process.do" 
                     	class="contact-form" novalidate="novalidate" id="submit">
                         ${sessionUser.member_rname }
                         <textarea name="review_comment"  placeholder="리뷰를 정성껏 작성해주시면 감사합니다." 
                         	id="reviewContent" onkeyup="minlength2()"></textarea>
                         <input type="hidden" name="center_no" value=${center_no }>
                         <button type="button" class="thm-btn yellow-bg" id="able" onclick="submit_btn()" disabled="disabled">리뷰 작성하기 </button>
                         <div class="form-result"></div><!-- /.form-result -->
                      </form>
                    </div>
                 </div>
             </div>
             </div>
	                </div>
	            </div>
	        </div>
        </div>
        <!-- Footer -->
        <footer class="footer-container">
        
	        <div class="container">
	        	<div class="row">
	        		
                    <div class="col">
                    	&copy; Touch Nubes <a href="${pageContext.request.contextPath }/center/center.do">Touch Nubes</a>.
                    </div>
                    
                </div>
	        </div>
     </div>
	
</div>
<jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>

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


</html>
