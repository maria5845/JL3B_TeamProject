<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 센터 회원가입</title>
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
</style>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
   crossorigin="anonymous"></script>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript"> //ajax 및 예외처리 js 코드

	//비밀번호 정규식 / 8자리 이상, 숫자, 특수문자 1회이상, 영문 2개 이상
	var regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,20}$/;
	
	//이메일 정규식
	var regMail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	//아이디 정규식 / 영문, 숫자 4~20자리
	var regId = /^[0-9a-z]{4,20}$/;

    var isConfirmed1 =false;
   var isConfirmed2 =false;
   var isConfirmed3 =false;
   var isConfirmed4 =false;
   
   function toggleSubmitButton(){
      if(         document.getElementById("center_id").value == "" ||
            (document.getElementById("center_pw").value != document.getElementById("check_pw").value) ||
            document.getElementById("npki_key").value == ""||
            document.getElementById("center_mail").value == "" || 
            document.getElementById("center_pr").value == "" || 
            document.getElementById("center_about").value == "" || 
            isConfirmed1 == false || isConfirmed2 == false ||isConfirmed3 == false ||isConfirmed4 == false
            ) 
            {
         document.getElementById("join_submit").setAttribute("disabled","true");   
      } else {
         document.getElementById("join_submit").removeAttribute("disabled");
      }
            
      
   }  
   function confirmId() {
      var center_id = document.getElementById("center_id").value;
      var xmlhttp = new XMLHttpRequest;

      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText == 'true') {
               document.getElementById("id_check").innerText = "사용 할 수 있는 아이디 입니다."
               document.getElementById("id_check").style.color = "#11609c";
               document.getElementById("id_check").style.fontWeight = "bold";
               document.getElementById("id_check").style.fontSize = "large";
               isConfirmed1 =true;
              
               toggleSubmitButton();
         
            } else {
               document.getElementById("id_check").innerHTML = "사용 할 수 없는 아이디 입니다."
               document.getElementById("id_check").style.color = "#ae0e36";
               document.getElementById("id_check").style.fontWeight = "bold";
               document.getElementById("id_check").style.fontSize = "large";
               isConfirmed1 = false;
              
               toggleSubmitButton();
 
            }
           
         }

           
      };
      xmlhttp.open("post","${pageContext.request.contextPath}/member/confirmCenterId.do",true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      
      if(!regId.test(center_id)){
			document.getElementById("id_check").innerHTML = "아이디는 영문 + 숫자 조합으로 4~20자까지"
			document.getElementById("id_check").style.color = "#ae0e36";
			document.getElementById("id_check").style.fontWeight = "bold";
			document.getElementById("id_check").style.fontSize = "large";
		}else{
			xmlhttp.send("center_id=" + center_id);
		}
      
      
   }

   //비밀번호 일치 확인 ajax

function confirmPw(){
      var center_pw = document.getElementById("center_pw").value;
      var check_pw = document.getElementById("check_pw").value
  
      if(regPw.test(center_pw)){
    	  
    	  if (center_pw==check_pw) {    
    	      document.getElementById("checked_pw").innerText = "비밀번호가 일치합니다"
    	      document.getElementById("checked_pw").style.color = "#11609c";
    	      document.getElementById("checked_pw").style.fontWeight = "bold";
    	      document.getElementById("checked_pw").style.fontSize = "large";
    	      isConfirmed2 =true;
    	      toggleSubmitButton();

    	} else {      
    	      document.getElementById("checked_pw").innerText = "비밀번호가 일치하지 않습니다"
    	      document.getElementById("checked_pw").style.color = "#ae0e36";
    	      document.getElementById("checked_pw").style.fontWeight = "bold";
    	      document.getElementById("checked_pw").style.fontSize = "large"
    	      isConfirmed2 = false
    	      toggleSubmitButton();
    	   }
    	  document.getElementById("pw_check").innerText = ""
      }else{
			document.getElementById("pw_check").innerText = "비밀번호는 숫자, 영문, 특수문자 포함 8~20자까지"
			document.getElementById("pw_check").style.color = "#ae0e36";
			document.getElementById("pw_check").style.fontWeight = "bold";
			document.getElementById("pw_check").style.fontSize = "large"
			isConfirmed2 = false
	  }
      
      
}
   //인증번호

function check_npki() {
   var npki_key = document.getElementById("npki_key").value;
   var xmlhttp = new XMLHttpRequest;
   
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText == 'true') {             
               document.getElementById("checked_npki").innerText = "유효한 인증번호 입니다.";
               document.getElementById("checked_npki").style.color = "#11609c";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large";
               isConfirmed3 =true;
              
               toggleSubmitButton();
                  
            } else 
               if(xmlhttp.responseText == 'used') {
                 document.getElementById("checked_npki").innerText = "이미 등록된 인증번호 입니다. 인증번호를 다시 확인해주세요";
               document.getElementById("checked_npki").style.color = "#20604f";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large";
               isConfirmed3 = false;
              
               toggleSubmitButton();
                  
               }
               else {
               document.getElementById("checked_npki").innerText = "유효하지 않은 인증번호 입니다.";
               document.getElementById("checked_npki").style.color = "#ae0e36";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large";
               isConfirmed3 = false;
               
               toggleSubmitButton();
         };
      };       
   };
     
      xmlhttp.open("post", "${pageContext.request.contextPath}/member/checkCenterNpkiKey.do",true);
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("npki_key="+ npki_key);
};
   
   
   //////////////////////////이메일 중복 체크
   function checkEmail() {
    
      var center_mail = document.getElementById("center_mail").value;
      var xmlhttp = new XMLHttpRequest;

      xmlhttp.onreadystatechange = function() {

   if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      
         if (xmlhttp.responseText == 'true' && center_mail !="") {
              document.getElementById("emailchecked").innerText = "등록 할 수 있는 E-mail 입니다."
              document.getElementById("emailchecked").style.color = "#11609c";
              document.getElementById("emailchecked").style.fontWeight = "bold";
              document.getElementById("emailchecked").style.fontSize = "large";
              isConfirmed4 =true;
             
              toggleSubmitButton();
                 
           } else if(xmlhttp.responseText == 'true' && center_mail =="") {
               document.getElementById("emailchecked").innerText = "공백으로 둘 수 없습니다. 이메일을 작성해주세요"
              document.getElementById("emailchecked").style.color = "#20604f";
               document.getElementById("emailchecked").style.fontWeight = "bold";
               document.getElementById("emailchecked").style.fontSize = "large";
               isConfirmed4 = false;
           } else {
              document.getElementById("emailchecked").innerHTML = "이미 등록 된 E-mail 입니다."
              document.getElementById("emailchecked").style.color = "#ae0e36";
              document.getElementById("emailchecked").style.fontWeight = "bold";
              document.getElementById("emailchecked").style.fontSize = "large";
              isConfirmed4 = false;
             
              toggleSubmitButton();

           }
         }
   };
      
      xmlhttp.open("post","${pageContext.request.contextPath}/member/checkCenterEmail.do",true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
      if(!regMail.test(center_mail)){
			document.getElementById("emailchecked").innerText = "이메일 형식에 맞지 않습니다."
			document.getElementById("emailchecked").style.color = "#20604f";
			document.getElementById("emailchecked").style.fontWeight = "bold";
			document.getElementById("emailchecked").style.fontSize = "large";
	  }else{
		xmlhttp.send("center_mail=" + center_mail);
	  }
      

   }
  
   
   function pageMove(){
         setTimeout(test , 600*1000);
      }

      
   function test(){
         alert("회원가입시간이 종료되었습니다. 다시 시도해주시기 바랍니다.");
         location.href="/JL3B/";
      }
      
   function timer() {
       setInterval(timeAttack,1000);
   }
         
   var setTime = 559;      // 최초 설정 시간(기본 : 초)

 function timeAttack() {   // 1초씩 카운트
            
   var m = Math.floor(setTime/60) + "분 ";
       var s = (setTime % 60)+ "초";   // 남은 시간 계산
       var o = "60초";
      
            
      if (setTime < 0) {         // 시간이 종료 되었으면..
                
         clearInterval(timeAttack);      // 타이머 해제
             
      } else if( setTime>60 ){
               document.getElementById("ViewTimer").innerText = m+s;      // div 영역에 보여줌
               document.getElementById("ViewTimer").style.color = "#11609c";
               document.getElementById("ViewTimer").style.fontWeight = "bold";
               document.getElementById("ViewTimer").style.fontSize = "large"
      } else if( setTime<61 && setTime>10 ){
              
            if((setTime%60)==0 ){
              document.getElementById("ViewTimer").innerText = o;      // div 영역에 보여줌      
              document.getElementById("ViewTimer").style.color = "#ae0e36";
              document.getElementById("ViewTimer").style.fontWeight = "bold";
              document.getElementById("ViewTimer").style.fontSize = "large"
               
            }else{
              document.getElementById("ViewTimer").innerText = s;      // div 영역에 보여줌
              document.getElementById("ViewTimer").style.color = "#ae0e36";
              document.getElementById("ViewTimer").style.fontWeight = "bold";
              document.getElementById("ViewTimer").style.fontSize = "large"
           }
           }else if(setTime<=10){
              document.getElementById("ViewTimer").innerText = s;      // div 영역에 보여줌
              document.getElementById("ViewTimer").style.color = "#ae0e36";
              document.getElementById("ViewTimer").style.fontWeight = "bold";
              document.getElementById("ViewTimer").style.fontSize = "x-large"
           }
                  
           setTime--;               // 1초씩 감소
}
	
   
   ///////////////
   function check(){
   
	   var fileCheck = document.getElementById("file").value;
	   
	   if(!fileCheck){
		   alert("이미지는 반드시 첨부하셔야 합니다.");
		   return false;
	   }else{
		   document.getElementById("submit").submit();
	   }
   }  
   
   
    </script>
</head>
<body onload="timer(); pageMove();">

<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div id="content">

   <div class="container text-center" style="margin-top: 6%">
      <div class="row">
         <div class="col-2"></div>
         <div class="col">
            <img style="max-width: 700px"
               src="${pageContext.request.contextPath }/resources/img/join-page.png">
         </div>
         <div class="col-2"></div>
      </div>
      <div class="row">
         <div class="col-5"></div>
         <div class="col" id="ViewTimer"></div>
         <div class="col-5"></div>
      </div>

      <div class="row">
         <div class="col-2"></div>
         <div class="col">
            <form method="post" class="text-left" id="submit"
               action="${pageContext.request.contextPath }/member/join_center_process.do"
               enctype="multipart/form-data">
               <!-- 아이디 -->
               <div class="form-group">
                  <label for="center_id">ID</label> <input
                     onblur="toggleSubmitButton()" type="text" class="form-control"
                     id="center_id" name="center_id" placeholder="사용할 ID 입력" required
                     onkeyup="confirmId()" maxlength="20">
                  <!-- ajax 처리되서 중복확인 바로 되는 부분 -->
                  <div class="check_font" id="id_check"></div>
               </div>

               <div class="form-group">
                  <label for="center_name">이름</label> <input
                     onblur="toggleSubmitButton()" type="text" class="form-control"
                     id="center_name" name="center_name" placeholder="이름" required
                     maxlength="20">
               </div>

               <!-- 비밀번호 -->
               <div class="form-group">
                  <label for="center_pw">비밀번호</label> <input
                     onblur="toggleSubmitButton()" type="password"
                     class="form-control" id="center_pw" name="center_pw"
                     placeholder="사용할 비밀번호" required maxlength="20">
                  <div class="check_font" id="pw_check"></div>

               </div>

               <!-- 비밀번호 재확인 -->
               <div class="form-group">
                  <label for="center_pw2">비밀번호 확인</label> <input type="password"
                     class="form-control" id="check_pw" name="check_pw"
                     onblur="toggleSubmitButton()" placeholder="비밀번호를 한 번 더 입력해주세요"
                     required onkeyup="confirmPw()" maxlength="20">
                  <div class="check_font" id="checked_pw"></div>
               </div>

               <!-- 인증번호 -->
               <div class="form-group">

                  <label for="npki_key">인증번호</label> <input type="text"
                     placeholder="부여받은 인증번호 입력 center-xxx-xxxx" id="npki_key"
                     name="npki_key" class="form-control"
                     onblur="check_npki(); toggleSubmitButton()" required
                     maxlength="20">
                  <div class="check_font" id="checked_npki"></div>
               </div>

               <!-- 이메일 -->
               <div class="form-group">
                  <label for="center_mail">이메일</label> <input
                     placeholder="메일 수신할 이메일 등록, ID 와 동일해도 됨" type="text"
                     name="center_mail" onblur="checkEmail(); toggleSubmitButton()"
                     id="center_mail" class="form-control" required maxlength="50">
                  <div class="check_font" id="emailchecked"></div>
               </div>

               <!--센터 소개란 -->

               <div class="form-group">
                  <label for="center_pr">센터 간략정보</label>
                  <textarea class="form-control" type="text" rows="3"
                     name="center_pr" id="center_pr" onblur="toggleSubmitButton()"
                     placeholder="센터 PR을 작성해주세요" required maxlength="200"></textarea>
                  <div class="check_font" id="prCheck()"></div>
               </div>

               <!-- 센터 정보-->
               <div class="form-group">
                  <label for="center_about">센터 간략정보</label>
                  <textarea class="form-control" type="text" rows="10"
                     name="center_about" onblur="toggleSubmitButton()"
                     name="center_about" id="center_about"
                     placeholder="센터소개 글을 입력해 주세요" required maxlength="4000"></textarea>
               </div>

               <!-- 센터이미지 첨부-->
               <div class="form-group">
                  <label for="tag">파일첨부</label> <input type="file" name="centerFile"
                     accept="image/*" id="file"><br>
               </div>

               <!-- 회원가입 버튼 -->
               <div class="row mb-5">
               <div class="col-10"></div>
               <div class="col-2">
                  <input id="join_submit" type="button" value="회원가입" disabled="disabled"
                     class="btn btn-primary btn-block btn-sm" onclick="check()">
               </div>
               </div> 
               
            </form>
         </div>
         <div class="col-2"></div>
      </div>

   </div>
      </div>

   </div>
	<jsp:include page="../commons/include_footer.jsp"></jsp:include>

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