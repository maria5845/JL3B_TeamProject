<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">
<title>공지사항 글읽기</title>

 <!-- Custom fonts for this template-->
  <link href="${path }/resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">
<!-- Page Wrapper -->
  <div id="wrapper">
   
      <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/admin/main.do">
        
        <div class="sidebar-brand-text mx-3">TN Admin <sup>♥</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/main.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>HOME</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
           board
      </div>
    

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>게시판</span>
        </a>
        <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">게시판 관리:</h6>
         
            <a class="collapse-item active" href="${path }/admin/notice.do">공지사항</a>
            <a class="collapse-item " href="${path }/admin/board.do">자유게시판</a>
            <a class="collapse-item" href="${path }/admin/idea.do">주민청원</a>
           
          </div>
        </div>
      </li>

      <!-- 줄 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
            setting
      </div>

  

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/vote.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>선거</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/member_control.do">
          <i class="fas fa-fw fa-table"></i>
          <span>회원 관리</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

    <jsp:include page="../commons/admin_navi.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">main</h1>
           <div class="card border-0 shadow my-5">
              <div class="card-body p-5">
                 
            <h3 class="font-weight-light">${readNotice.noticeVo.notice_title }</h3>
                  <p class="lead"><br>
            
            <div class="row">
               <div class="col-1"><p class="font-weight-bolder">작성자:</p></div>
               <div class="col-1">${readNotice.adminVo.admin_name }${readNotice.memberVo.member_rname }</div>
               <div class="col"></div>            
            </div>
            
            <div class="row">
               <div class="col-1"><p class="font-weight-bolder">조회수:</p></div>
               <div class="col-1">${readNotice.noticeVo.notice_hits }</div>
               <div class="col"></div>            
            </div>
            
            
            <p class="font-weight-bolder">내용</p>
            <h4 class="font-weight-light">${readNotice.noticeVo.notice_content}</h4><br>      
            <br><br><br>
         
                     
                  <div class="row">
                     <div class="col"></div>
                     <div class="col"></div>
                     <div class="col">
                        <a href="${path}/admin/notice.do?currentPage=${currentPage}"><input type="submit" class="btn btn-secondary btn-xs" value="목록"></a>
                        <a href="${path}/admin/notice_change.do?notice_no=${readNotice.noticeVo.notice_no}&currentPage=${currentPage}"><input type="submit" class="btn btn-light btn-xs" value="수정"></a>
                        <a href="${path}/admin/notice_delete_process.do?notice_no=${readNotice.noticeVo.notice_no}"><input type="submit" class="btn btn-light btn-xs" value="삭제"
                        onclick="return confirm('삭제하시겠습니까?');"></a>
                        
                     </div>
                  </div>
                                
              </div>
 
           </div>                     
           
        </div>
            
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
     <jsp:include page="../commons/admin_footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="${path }/resources/js/jquery.min.js"></script>
  <script src="${path }/resources/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${path }/resources/js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${path }/resources/js/sb-admin-2.min.js"></script>




</body>
</html>