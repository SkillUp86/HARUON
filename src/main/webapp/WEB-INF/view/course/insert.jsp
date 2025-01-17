<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>교육 등록</title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body class="layout-boxed">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> 
	    <div class="loader"> 
		    <div class="loader-content">
		        <div class="spinner-grow align-self-center">
		        </div>
		    </div>
	    </div>
    </div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <div class="header-container container-xxl">
	        <jsp:include page="/WEB-INF/view/inc/header.jsp" />
    </div>
    <!--  END NAVBAR  -->
      
    <!--  BEGIN MAIN CONTAINER 템플릿 직접 끌어와서 사용  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="cs-overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <div class="sidebar-wrapper sidebar-theme">
            <jsp:include page="/WEB-INF/view/inc/sidebar.jsp" />
        </div>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="middle-content container-xxl p-0">
                    <!--  BEGIN BREADCRUMBS  -->
                    <div class="secondary-nav">
                        <div class="breadcrumbs-container" data-page-heading="Analytics">
                            <header class="header navbar navbar-expand-sm">
                                <a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                                        <line x1="3" y1="12" x2="21" y2="12"></line>
                                        <line x1="3" y1="6" x2="21" y2="6"></line>
                                        <line x1="3" y1="18" x2="21" y2="18"></line>
                                    </svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">
                                        <div class="page-title">
                                        </div>
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                            	<!-- 여기도 페이지 마다 이름 바꿔줘야 합니다 -->
                                                <li class="breadcrumb-item"><a href="#">Franchises</a></li>
                                                <!-- 여기도 페이지 마다 이름 바꿔줘야 합니다!!!!!!!!!!!!!!!!! -->
                                                <li class="breadcrumb-item active" aria-current="page">Insert Course</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                </div>
                
                <!-- 메인컨텐츠 입력칸 -->
                <div class="row layout-spacing layout-top-spacing" id="cancel-row">
                    <div class="col-lg-12">
                        <div class="widget-content searchable-container list">

                            <div class="row">

		                        <div id="flLoginForm" class="col-lg-12 layout-spacing">
		                            <div class="statbox widget box box-shadow">
		                                <div class="widget-header">
		                                    <div class="row">
		                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
		                                            <h2 class="mt-3 mb-3">&nbsp; 교육 등록</h2>
		                                        </div>                                                                        
		                                    </div>
		                                </div>
		                                <div class="widget-content widget-content-area">
		                                    <form id="addForm" method="post" action="${pageContext.request.contextPath}/franchises/courses/insert" class="row g-3" enctype="multipart/form-data">
		                                        <div class="col-12">
		                                            <label for="empNo" class="form-label">EMP</label>
		                                            <select id="empNo" name="empNo" class="form-control">
		                                            	<option value="">::: 담당자 :::</option>
		                                            	<c:forEach items="${empList}" var="el">
			                                            	<option value="${el.empNo}">${el.ename}</option>
		                                            	</c:forEach>
		                                            </select>
		                                        </div>
		                                        <div class="col-12">
		                                            <label for="place" class="form-label">PLACE</label>
		                                            <input type="text" class="form-control" id="place" name="place" placeholder="장소">
		                                        </div>
		                                        <div class="col-12">
		                                            <label for="eduDate" class="form-label">EDU DATE</label>
		                                            <input type="datetime-local" class="form-control" id="eduDate" name="eduDate" placeholder="교육 일정">
		                                        </div>
		                                        <div class="col-12">
		                                            <label for="title" class="form-label">TITLE</label>
		                                            <input type="text" class="form-control" id="title" name="title" placeholder="제목">
		                                        </div>
												<div class="col-12">
												    <label for="contents" class="form-label">CONTENT</label>
												    <textarea class="form-control" id="contents" name="content" placeholder="내용" rows="5" cols="40"></textarea>
												</div>
		                                        <div class="col-12">
		                                            <label for="capacity" class="form-label">CAPACITY</label>
		                                            <input type="number" class="form-control" id="capacity" name="capacity" placeholder="정원">
		                                        </div>
												<div class="form-group mb-4">
													<input class="form-control file-upload-input" type="file" id="educationFile" name="educationFile" multiple="multiple">
												</div>		                                        
		                                        <div class="col-12 ">
		                                            <button type="button" id="addBtn" class="btn btn-gray _effect--ripple waves-effect waves-light">등록</button>
		                                        </div>
		                                    </form>
		                                </div>
		                            </div>
		                        </div>
                   			</div>
                        </div>
                  	</div>
               	</div>
                <!-- 메인컨텐츠 END -->
			</div>
		</div>
            
        <!--  BEGIN FOOTER  -->
        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
        <!--  END FOOTER  -->
        
  		<!--  END CONTENT AREA  -->
	
	</div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/contact.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	
	<script>
		$('#addBtn').click(function() {
			if($('#empNo').val() == '') {
				alert('담당자를 선택하세요');
			} else if($('#title').val() == '') {
				alert('제목을 입력하세요');
			} else if($('#contents').val() == '') {
				alert('내용을 입력하세요');
			} else if($('#place').val() == '') {
				alert('장소를 입력하세요');
			} else if($('#eduDate').val() == '') {
				alert('일정을 입력하세요');
			} else if($('#capacity').val() == '') {
				alert('정원을 입력하세요');
			} else {
				$('#addForm').submit();
			}
		});
	</script>

</body>

</html>