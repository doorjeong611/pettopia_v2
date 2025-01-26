<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>PetTopia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    <style>
    .attendance-table {
	    table-layout: fixed;
	    width: 100%;
        white-space: nowrap;
        border-collapse: collapse; /* 테두리 겹침 방지 */
        margin: 20px auto; /*가운데 정렬 */
        
    }

    .attendance-table th, .attendance-table td {
        padding: 12px; /* 패딩을 약간 늘림 */
        border: 1px solid #e0e0e0; /* 테두리 색상을 조금 더 부드럽게 변경 */
        text-align: center;
    }

    .attendance-table th {
        background-color: #f0f4ff; /* 헤더 배경색을 팀 색상에 맞게 수정 */
        color: #003366; /* 텍스트 색상을 팀의 기본 색상으로 변경 */
        font-weight: bold; /* 헤더 글씨를 더 두껍게 */
    }

    .attendance-table tbody tr:nth-child(even) {
        background-color: #f9fbfd; /* 짝수 행 배경색을 부드럽게 수정 */
    }

    .attendance-table tbody tr:nth-child(odd) {
        background-color: #ffffff; /* 홀수 행 배경색 */
    }
</style>
</head>

<body class="text-base bg-body-bg text-body font-public dark:text-zink-100 dark:bg-zink-800 group-data-[skin=bordered]:bg-body-bordered group-data-[skin=bordered]:dark:bg-zink-700">
<div class="group-data-[sidebar-size=sm]:min-h-sm group-data-[sidebar-size=sm]:relative">
    
	<!-- Left Sidebar Start -->
    <div class="app-menu w-vertical-menu bg-vertical-menu ltr:border-r rtl:border-l border-vertical-menu-border fixed bottom-0 top-0 z-[1003] transition-all duration-75 ease-linear group-data-[sidebar-size=md]:w-vertical-menu-md group-data-[sidebar-size=sm]:w-vertical-menu-sm group-data-[sidebar-size=sm]:pt-header group-data-[sidebar=dark]:bg-vertical-menu-dark group-data-[sidebar=dark]:border-vertical-menu-dark group-data-[sidebar=brand]:bg-vertical-menu-brand group-data-[sidebar=brand]:border-vertical-menu-brand group-data-[sidebar=modern]:bg-gradient-to-tr group-data-[sidebar=modern]:to-vertical-menu-to-modern group-data-[sidebar=modern]:from-vertical-menu-form-modern group-data-[layout=horizontal]:w-full group-data-[layout=horizontal]:bottom-auto group-data-[layout=horizontal]:top-header hidden md:block print:hidden group-data-[sidebar-size=sm]:absolute group-data-[sidebar=modern]:border-vertical-menu-border-modern group-data-[layout=horizontal]:dark:bg-zink-700 group-data-[layout=horizontal]:border-t group-data-[layout=horizontal]:dark:border-zink-500 group-data-[layout=horizontal]:border-r-0 group-data-[sidebar=dark]:dark:bg-zink-700 group-data-[sidebar=dark]:dark:border-zink-600 group-data-[layout=horizontal]:group-data-[navbar=scroll]:absolute group-data-[layout=horizontal]:group-data-[navbar=bordered]:top-[calc(theme('spacing.header')_+_theme('spacing.4'))] group-data-[layout=horizontal]:group-data-[navbar=bordered]:inset-x-4 group-data-[layout=horizontal]:group-data-[navbar=hidden]:top-0 group-data-[layout=horizontal]:group-data-[navbar=hidden]:h-16 group-data-[layout=horizontal]:group-data-[navbar=bordered]:w-[calc(100%_-_2rem)] group-data-[layout=horizontal]:group-data-[navbar=bordered]:[&.sticky]:top-header group-data-[layout=horizontal]:group-data-[navbar=bordered]:rounded-b-md group-data-[layout=horizontal]:shadow-md group-data-[layout=horizontal]:shadow-slate-500/10 group-data-[layout=horizontal]:dark:shadow-zink-500/10 group-data-[layout=horizontal]:opacity-0">
    	 <c:import url="/WEB-INF/view/inc/leftSidebar.jsp"></c:import>   
    </div>
    <!-- Left Sidebar End -->
    
    <div id="sidebar-overlay" class="absolute inset-0 z-[1002] bg-slate-500/30 hidden"></div>
   	<header id="page-topbar" class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm group-data-[layout=horizontal]:ltr:left-0 group-data-[layout=horizontal]:rtl:right-0 fixed right-0 z-[1000] left-0 print:hidden group-data-[navbar=bordered]:m-4 group-data-[navbar=bordered]:[&.is-sticky]:mt-0 transition-all ease-linear duration-300 group-data-[navbar=hidden]:hidden group-data-[navbar=scroll]:absolute group/topbar group-data-[layout=horizontal]:z-[1004]">
       	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
   	</header>
    
    <div class="relative min-h-screen group-data-[sidebar-size=sm]:min-h-sm">
        <div class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
            <div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">
                <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
                    <div class="grow">
                        <h5 class="text-16">휴가</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">휴가</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            휴가
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="grid grid-cols-1 gap-x-5 md:grid-cols-2 xl:grid-cols-12">
				<div class="col-span-12 md:order-3 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12 items-center">
                                <div class="col-span-8 md:col-span-8">
                                    <p class="text-slate-500 dark:text-slate-200" style="font-size: 0.9rem">총 연차휴가</p>
                                    <h5 class="mt-3 mb-4" style="font-size: 1.2rem;"><span class="counter-value" data-target="${totalVacationDays}">"${totalVacationDays}"</span></h5>
                                </div>
								  <div style="display: flex; align-items: center; margin-bottom: 15px;">
								    <span style="font-size: 55px; margin-right: 0px;">🏖️</span>
								  </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-12 md:order-5 2xl:order-6 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12 items-center">
                                <div class="col-span-8 md:col-span-8">
                                    <p class="text-slate-500 dark:text-slate-200" style="font-size: 0.9rem">사용연차</p>
                                    <h5 class="mt-3 mb-4" style="font-size: 1.2rem;"><span class="counter-value" data-target="${usedVacationDays}">${usedVacationDays}</span></h5>
                                </div>
								 <div style="display: flex; align-items: center; margin-bottom: 15px;">
								    <span style="font-size: 55px; margin-right: 0px;">✈️</span>
								 </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-12 md:order-6 2xl:order-7 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12 items-center">
                                <div class="col-span-8 md:col-span-8">
                                    <p class="text-slate-500 dark:text-slate-200" style="font-size: 0.9rem">잔여연차</p>
                                    <h5 class="mt-3 mb-4" style="font-size: 1.2rem;"><span class="counter-value" data-target="${remainingVacationDays}">${remainingVacationDays}</span></h5>
                                </div>
                                  <div style="display: flex; align-items: center; margin-bottom: 15px;">
								    <span style="font-size: 55px; margin-right: 0px;">🏕️</span>
								  </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            <!-- 휴가리스트 -->
		   <div class="card">
                    <div class="items-center gab3 card-body">
                        <div class="grid grid-cols-1 gap-5 mb-5 xl:grid-cols-12">
                            <div class="xl:col-span-12">
                     <!-- 선택박스 -->
                     
                  <div id="container" style="gap: 20px; width: 100%; justify-content: space-between;">
				    <!-- 선택 박스 : 부서 선택 -->
				    <div style="display: flex; gap: 10px; width: 100%;">
					  <div class="select-box" style="flex: 1; max-width: 250px;">
					    <input type="text" id="startDate" class="border border-gray-300 rounded w-full p-2" title="시작일" placeholder="시작일" onfocus="this.type='date'" onblur="if(!this.value)this.type='text'" />
					  </div>
					  <div class="select-box" style="flex: 1; max-width: 250px;">
					    <input type="text" id="endDate" class="border border-gray-300 rounded w-full p-2" title="종료일" placeholder="종료일" onfocus="this.type='date'" onblur="if(!this.value)this.type='text'" />
					  </div>
			        
				    <!-- 휴가일 조회 -->
				      <div class="button-box" id="buttonBox">
						<button type="button" id="btnAddFile" class="mr-1 p-2 bg-white text-custosm-500 btn btn-sm hover:text-custom-500 hover:bg-custom-100 focus:text-custom-500 focus:bg-custom-100 active:text-custom-500 active:bg-custom-100" style="font-size: 14px; display: flex; align-items: center; justify-content: center; width: 40px; height: 40px;">
						  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="inline-block">
						    <circle cx="11" cy="11" r="8"></circle>
						    <path d="m21 21-4.3-4.3"></path>
						  </svg>
						</button>
				    </div>
			    </div>

			    <!-- Employee search input and search button on the right -->
				    <div style="display: flex; gap: 10px;">
					<!-- 직원 리스트 테이블 -->
					<div id="newAttendance" style="display: none;">
					<table class="attendance-table">
				        <thead>
				            <tr>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">사번</th>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">직원이름</th>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">출근날짜</th>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">출근시간</th>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">퇴근시간</th>
		                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">근태상태</th>
		                    </tr>
				        </thead>
					    <tbody id="attendanceTableBody">
					        <!-- 직원 목록 동적으로 추가 -->
					    </tbody>
				    </table>
					
					<!-- Pagination controls -->
		            <div id="paginationContainer" style="margin-top: 20px; align-items: center; justify-self: end;">
		                <c:if test="${currentPage > 1}">
		                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage - 1}&empName=${param.empName}" class="prev" dfstyle="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> < 이전</a>
		                </c:if>
		
		                <c:forEach var="pageNum" begin="1" end="${totalPages}">
		                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${pageNum}&empName=${param.empName}" class="page-num" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;">${pageNum}</a>
		                </c:forEach>
		
		                <c:if test="${currentPage < totalPages}">
		                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage + 1}&empName=${param.empName}" class="next" style="margin-left: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> 다음 > </a>
		                </c:if>
		            </div>
					</div>
                            </div><!--end col-->
                            <div class="xl:col-span-2 xl:col-start-11">
                            
                            </div>
                            
                        </div><!--end grid-->
                        <div id="existingAttendance" style="display-block;">
                            <table class="attendance-table">
                          <thead class="ltr:text-left rtl:text-right bg-slate-100 text-slate-500 dark:bg-zink-600 dark:text-zink-200">
                    <tr>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">사번</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">직원이름</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">문서제목</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">시작일</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">종료일</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">휴가유형</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="v" items="${vacationList}">
                        <tr>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${v.empNo}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${v.empName}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${v.docTitle}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${v.startDate}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${v.endDate}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">
                            <c:choose>
			                    <c:when test="${v.vacationType == 'AL'}">연차</c:when>
			                    <c:when test="${v.vacationType == 'HLA'}">오전 반차</c:when>
			                    <c:when test="${v.vacationType == 'HLP'}">오후 반차</c:when>
				                <c:otherwise>알 수 없음</c:otherwise>
			                </c:choose>
		                	</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        
        	<!-- Pagination controls -->
            <div id="paginationContainer" style="margin-top: 20px; align-items: center; justify-self: end;">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/vacation/vacationList?page=${currentPage - 1}&empName=${param.empName}" class="prev" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> < 이전</a>
                </c:if>

                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <a href="${pageContext.request.contextPath}/vacation/vacationList?page=${pageNum}&empName=${param.empName}" class="page-num" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;">${pageNum}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/vacation/vacationList?page=${currentPage + 1}&empName=${param.empName}" class="next" style="margin-left: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> 다음 > </a>
                </c:if>
            </div>
        </div>
        </div>
    </div></div>
				    </div>
                
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

		<!-- Start Footer -->
        <footer class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm absolute right-0 bottom-0 px-4 h-14 group-data-[layout=horizontal]:ltr:left-0  group-data-[layout=horizontal]:rtl:right-0 left-0 border-t py-3 flex items-center dark:border-zink-600">
        	<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>    
        </footer>
        <!-- End Footer -->
    </div>
</div>
<!-- End Main Content -->
<c:import url="/WEB-INF/view/inc/customizerButton.jsp"></c:import>

<script src='${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
<script src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
<!--apexchart js-->
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<script>
	// 날짜 검색
	 $('#startDate').on('focus', function() {
	    $(this).attr('type', 'date'); // 클릭시 input type변환
	  }).on('blur', function() {
	    if (!$(this).val()) {
	      $(this).attr('type', 'text'); // 값 입력 없을시, 기본 text 로 돌아가기,
	    }
	  });
	
	  $('#endDate').on('focus', function() {
	    $(this).attr('type', 'date'); // 클릭시 input type변환
	  }).on('blur', function() {
	    if (!$(this).val()) {
	      $(this).attr('type', 'text'); //  값 입력 없을시, 기본 text 로 돌아가기,
	    }
	  });
	
</script>
</body>

</html>