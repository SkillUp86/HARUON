<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>교육 상세</title>
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
                                                <li class="breadcrumb-item active" aria-current="page">Course</li>
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
	                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
	                                            <h2 class="mt-3 mb-3">&nbsp; 교육 상세</h2>
	                                        </div>                                                                        
		                                </div>
		                                <div class="widget-content widget-content-area">
			                                <div class="row">
				                                <div class="col-md-6">
				                                    <label class="form-label"> 교육 번호 </label>
				                                    <label class="form-control">${c.eduNo}</label>
				                                </div>
				                                <div class="col-md-6">
					                                <input type="hidden" name="empNo" value="${c.empNo}">
				                                    <label class="form-label"> 담당자 </label>
				                                    <label class="form-control">${c.ename}</label>
				                                </div>
			                                </div>
			                                
			                                <div class="row">
				                                <div class="col-md-6">
				                                    <label class="form-label"> 장소 </label>
				                                    <label class="form-control">${c.place}</label>
				                                </div>
				                                <div class="col-md-6">
				                                    <label class="form-label"> 일정 </label>
				                                    <label class="form-control">${c.eduDate}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 제목 </label>
				                                    <label class="form-control">${c.title}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 내용 </label>
				                                    <label class="form-control">${c.content}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 정원 </label>
				                                    <label class="form-control">${c.capacity}</label>
				                                </div>
			                                </div>
			                                <div class="row mb-3">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 첨부파일 </label>
				                                    <c:if test="${empty cfl}">
				                                    	<label class="form-control">첨부된 파일이 없습니다</label>
				                                    </c:if>
				                                    <c:forEach items="${cfl}" var="cfl">
					                                    <a href="${pageContext.request.contextPath}/uploadCourse/${cfl.fileName}.${cfl.ext}" download="${cfl.originName}.${cfl.ext}"> 
					                                    	<label class="form-control">${cfl.originName}.${cfl.ext}</label>
					                                    </a>
				                                    </c:forEach>
				                                </div>
			                                </div>
			                                <a href="${pageContext.request.contextPath}/franchises/courses/modify?eduNo=${c.eduNo}" class="btn btn-gray"> 수정 </a>
			                                <a href="${pageContext.request.contextPath}/franchises/courses/delete?eduNo=${c.eduNo}" class="btn btn-gray" id="btnDelete"> 삭제 </a>
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
	
	<script>
		$('#addBtn').click(function() {
			if($('#fname').val() == '') {
				alert('FNAME을 입력하세요');
			} else if($('#address').val() == '') {
				alert('ADDRESS를 입력하세요');
			} else if(!/^\d{10}$/.test($('#id').val())) {
				alert('ID : 10자리 숫자를 입력하세요');
			} else if($('#leader').val() == '') {
				alert('가맹점주 이름을 입력하세요');
			} else if(!/^\d{11}$/.test($('#phone').val())) {
				alert('휴대폰번호 11자리를 입력하세요');
			} else if($('#email').val() == '') {
				alert('이메일을 입력하세요');
			} else {
				$('#addForm').submit();
			}
		});
		
	    $('#btnDelete').click(function(event) {
	        // 삭제 확인 메시지
	        var isConfirmed = confirm('해당 교육을 삭제하시겠습니까?');
	        
	        // 사용자가 '확인'을 클릭했을 경우
	        if (isConfirmed) {
	            // 기본 동작(페이지 이동)을 취소
	            // 'href' 속성을 가져와서 실제 삭제 요청을 처리
	            window.location.href = $(this).attr('href');
	        } else {
	            // 취소 시 아무 일도 하지 않음
	            event.preventDefault();
	        }
	    });
	</script>
	
	<!-- 주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 참고 항목 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraRoadAddr !== ''){
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  let resultAddress = '';
                  /*
                  document.getElementById('sample4_postcode').value = data.zonecode;
                  document.getElementById("sample4_roadAddress").value = roadAddr;
                  document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                  */
                  resultAddress = ' '+ roadAddr + ' ' + data.jibunAddress
                  // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                  if(roadAddr !== ''){
                      //document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                     resultAddress += ' ' + extraRoadAddr;
                  } else {
                      //document.getElementById("sample4_extraAddress").value = '';
                  }
                  document.getElementById('postCode').value = data.zonecode;
                  document.getElementById('address').value = resultAddress;
                  var guideTextBox = document.getElementById("guide");
                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  if(data.autoRoadAddress) {
                      var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                      guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                      guideTextBox.style.display = 'block';

                  } else if(data.autoJibunAddress) {
                      var expJibunAddr = data.autoJibunAddress;
                      guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                      guideTextBox.style.display = 'block';
                  } else {
                      guideTextBox.innerHTML = '';
                      guideTextBox.style.display = 'none';
                  }
                  
                  // 주소 선택 후, Daum Postcode API의 기본 팝업 모달을 닫는 방법
                  var postcodeModal = document.querySelector('.daumPostcodeModal');
                  if (postcodeModal) {
                      postcodeModal.style.display = 'none'; // 모달을 숨김
                  }

                  // 또는 daum.Postcode 객체의 close() 메서드를 사용
                  if (typeof daum.Postcode().close === 'function') {
                      daum.Postcode().close(); // 모달을 닫는 메서드 호출
                  }
              }
          }).open();
      }
   </script>
	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>