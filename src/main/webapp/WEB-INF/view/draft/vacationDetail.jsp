<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/approval/draft.css">

            <!-- BEGIN GLOBAL MANDATORY STYLES -->
            <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
            <!-- END GLOBAL MANDATORY STYLES -->

            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link href="${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->


            <!-- 페이지 제목 입력칸 -->
            <title>Haruon | 내 문서</title>
            <!-- 페이지 제목 입력칸 -->
        </head>

        <body class="layout-boxed">
            <!-- BEGIN LOADER -->
            <div id="load_screen">
                <div class="loader">
                    <div class="loader-content">
                        <div class="spinner-grow align-self-center"></div>
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
                                        <a href="javascript:void(0);" class="btn-toggle sidebarCollapse"
                                            data-placement="bottom">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-menu">
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
                                                        <li class="breadcrumb-item"><a href="#">내문서함</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">${d.draftType} 결재</li>
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
                        <div class="row mb-4 layout-spacing layout-top-spacing">
                            <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="widget-content widget-content-area">
                                    <div class="row mb-4">
                                        <div class="col-sm-12">
                                            <div class="container">
                                                <div class="bold-box">
                                                    <h1>
                                                        <div class="mt-4 mb-4">
                                                            ${d.draftType} 결재
                                                        </div>
                                                    </h1>
                                                    <div class="approval-section">
                                                    	<c:if test="${d.midApp != null}">
	                                                        <div class="approver mt-4">
	                                                            <p>중간결재자</p>
	                                                            <div class="signature-box"></div>
	                                                            <p>${d.midAppName}</p>
	                                                        </div>
                                                    	</c:if>
                                                        <div class="approver mt-4">
                                                            <p>최종결재자</p>
                                                            <div class="signature-box"></div>
                                                            <p>${d.finalAppName}</p>
                                                        </div>
                                                    </div><br><br><br><br><br><br><br><br><br>
                                                    <div class="input-group mb-2 mt-4">
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">문서번호</span>
                                                            <input class="form-control" value="${d.draNo}" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">기안부서</span>
                                                            <input class="form-control" value="${d.deptName}" readonly>
                                                            <span class="input-group-text label-text">직위</span>
                                                            <input class="form-control" value="${d.location}" readonly>
                                                        </div>
                                                        <div class="input-group mb-1">
                                                            <span class="input-group-text label-text">기안자</span>
                                                            <input class="form-control" value="${d.drafterName}" readonly>
                                                            <span class="input-group-text label-text">기안일자</span>
                                                            <input class="form-control" value="${d.createDate}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="input-group mb-2">
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">제목</span>
                                                            <input class="form-control" value="${d.title}" readonly>
                                                        </div>
                                                        <div class="input-group mb-3">
														    <span class="input-group-text label-text">첨부파일</span>
														        <c:if test="${draftFiles.isEmpty()}">
														            <input class="form-control" value="첨부파일 없음" readonly>
														        </c:if>
															    <c:if test="${!draftFiles.isEmpty()}">
														            <div class="d-flex flex-wrap">
														                <c:forEach var="f" items="${draftFiles}">
														                &nbsp;
														                    <a href="${pageContext.request.contextPath}/uploadDraft/${f.fileName}.${f.ext}" 
														                       download="${f.originName}.${f.ext}" class="btn btn-dark mt-1 file">
														                       ${f.originName}.${f.ext}
														                    </a>
														                </c:forEach>
														            </div>
														        </c:if>
														</div>
                                                        <div class="input-group">
                                                            <textarea class="form-control" rows="10" id="textContent" name="textContent" readonly>${d.content}</textarea>
                                                        </div>
                                                    </div>
                                                    <c:if test="${d.referEmpNo != null}">
	                                                    <div class="input-group mb-2">
	                                                        <div class="input-group">
	                                                            <p class="black-text"><strong>참조자:${d.referName}</strong></p>
	                                                        </div>
	                                                    </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
                                <div class="widget-content widget-content-area">
                                    <div class="row">
                                        <div class="col-xxl-12 mb-4">
                                            <div class="form-bootstrap-basic">
                                                <label class="switch-label">결재 상태</label>
                                            </div>
                                        </div>
                                        <div class="col-xxl-12 mb-4">
                                                <label class="form-control text-center">${d.approvalState}</label>
                                        </div>
                                       	<c:if test="${d.approvalState == '결재대기'}">
	                                        <div class="col-xxl-12 col-md-12 mb-4">
													<a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/draft/vacUpdate?draNo=${d.draNo}">수정</a>
	                                        </div>
	                                        <div class="col-xxl-12 col-md-12 mb-4">
													<a class="btn btn-danger w-100" href="${pageContext.request.contextPath}/draft/delete?docType=${d.draftType}&appNo=${d.appNo}&draNo=${d.draNo}">삭제</a>
	                                        </div>
                                       	</c:if>
                                        <div class="col-xxl-12 col-md-12 mb-4">
                                        </div>

                                        <div class="col-xxl-12 col-md-12 mb-4">
                                        </div>


                                        <div class="col-xxl-12 col-sm-4 col-12 mx-auto">
                                            <a class="btn btn-gray w-100" href="${pageContext.request.contextPath}/draft/list">돌아가기</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
                    </div>
                </div>

            </div>
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
            <script src="${pageContext.request.contextPath}/src/assets/js/template.js""></script>
    		<script src=" ${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>

        </body>
        </html>