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
       <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h5 class="text-16">오늘의 근태기록</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">근태리스트</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            템플릿
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="grid grid-cols-1 gap-x-5 md:grid-cols-2 xl:grid-cols-12">
                    <div class="xl:col-span-3">
                        <div class="card">
                            <div class="flex items-center gap-4 card-body">
                                <div class="flex items-center justify-center rounded-md size-12 text-sky-500 bg-sky-100 text-15 dark:bg-sky-500/20 shrink-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="users-2" class="lucide lucide-users-2"><path d="M18 21a8 8 0 0 0-16 0"></path><circle cx="10" cy="8" r="5"></circle><path d="M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3"></path></svg></div>
                                <div class="overflow-hidden grow">
                                    <h5 class="mb-1 text-16">${presentEmployee}</h5>
                                    <p class="truncate text-slate-500 dark:text-zink-200">출근 직원</p>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="xl:col-span-3">
                        <div class="card">
                            <div class="flex items-center gap-4 card-body">
                                <div class="flex items-center justify-center text-red-500 bg-red-100 rounded-md size-12 text-15 dark:bg-red-500/20 shrink-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="user-x-2" class="lucide lucide-user-x-2"><path d="M2 21a8 8 0 0 1 11.873-7"></path><circle cx="10" cy="8" r="5"></circle><path d="m17 17 5 5"></path><path d="m22 17-5 5"></path></svg></div>
                                <div class="overflow-hidden grow">
                                    <h5 class="mb-1 text-16">${absentCount}</h5>
                                    <p class="truncate text-slate-500 dark:text-zink-200">결근 직원</p>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="xl:col-span-3">
                        <div class="card">
                            <div class="flex items-center gap-4 card-body">
                                <div class="flex items-center justify-center text-green-500 bg-green-100 rounded-md size-12 text-15 dark:bg-green-500/20 shrink-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="user-check-2" class="lucide lucide-user-check-2"><path d="M2 21a8 8 0 0 1 13.292-6"></path><circle cx="10" cy="8" r="5"></circle><path d="m16 19 2 2 4-4"></path></svg></div>
                                <div class="overflow-hidden grow">
                                    <h5 class="mb-1 text-16">${halfDayLeaveCount}</h5>
                                    <p class="truncate text-slate-500 dark:text-zink-200">반차 직원</p>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="xl:col-span-3">
                        <div class="card">
                            <div class="flex items-center gap-4 card-body">
                                <div class="flex items-center justify-center rounded-md size-12 text-custom-500 bg-custom-100 text-15 dark:bg-custom-500/20 shrink-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="briefcase" class="lucide lucide-briefcase"><rect width="20" height="14" x="2" y="7" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg></div>
                                <div class="overflow-hidden grow">
                                    <h5 class="mb-1 text-16">${annualLeaveCount}</h5>
                                    <p class="truncate text-slate-500 dark:text-zink-200">연차 직원</p>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div>
                
		   <div class="card">
                    <div class="items-center gab3 card-body">
                        <div class="grid grid-cols-1 gap-5 mb-5 xl:grid-cols-12">
                            <div class="xl:col-span-12">
                     <!-- 선택박스 -->
                     
                  <div id="container" style="gap: 20px; width: 100%; justify-content: space-between;">
				    <!-- 선택 박스 : 부서 선택 -->
				    <div style="display: flex; gap: 10px; width: 100%;">
				        <div class="select-box" style="flex: 1; max-width: 250px;">
				            <select id="departmentSelect" class="border border-gray-300 rounded w-full p-2">
				                <option value="">부서 선택</option>
				            </select>
				        </div>
				        
			        <div class="select-box" style="flex: 1; max-width: 250px;">
			            <select id="teamSelect" class="border border-gray-300 rounded w-full p-2">
			                <option value="">팀 선택</option>
			            </select>
			        </div>
			        
				    <div class="input-box" id="employeeBox" style="max-width: 300px; position: relative;">
					    <input type="text" id="employeeSearchInput" value="${param.empName}" style="height: 35px; padding-left: 35px;" class="ltr:pl-8 search form-input border-slate-200 focus:outline-none focus:border-custom-500 placeholder:text-slate-400" placeholder="직원이름을 입력하세요." />
					    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%); color: #808080;">
					        <circle cx="11" cy="11" r="8"></circle>
					        <path d="m21 21-4.3-4.3"></path>
					    </svg>
					</div>
				    
				    <!-- 직원 검색 -->
				      <div class="button-box" id="buttonBox">
				        <button id="searchEmployeeBtn" style="width:50px; height: 35px; background-color: #007BFF; color: white; border-radius: 4px; cursor: pointer; transition: background-color 0.3s; " onmouseover="this.style.backgroundColor='#66B2FF';" onmouseout="this.style.backgroundColor='#007BFF';">검색</button>
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
		                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage - 1}&empName=${param.empName}" class="prev" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> < 이전</a>
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
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">소속팀</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">직원이름</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">출근날짜</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">출근시간</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">퇴근시간</th>
                        <th class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">근태상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${attendanceList}">
                        <tr>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${a.deptName}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${a.empName}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${a.attendanceDate}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${a.clockInTime}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">${a.clockOutTime}</td>
                            <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500">  
                            <c:choose>
		                    <c:when test="${a.attendanceStatus == 'P'}">출근</c:when>
		                    <c:when test="${a.attendanceStatus == 'L'}">지각</c:when>
		                    <c:when test="${a.attendanceStatus == 'E'}">조퇴</c:when>
		                    <c:when test="${a.attendanceStatus == 'A'}">결근</c:when>
		                    <c:when test="${a.attendanceStatus == 'V'}">연차</c:when>
		                    <c:when test="${a.attendanceStatus == 'H'}">반차</c:when>
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
                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage - 1}&empName=${param.empName}" class="prev" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> < 이전</a>
                </c:if>

                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${pageNum}&empName=${param.empName}" class="page-num" style="margin-right: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;">${pageNum}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/attendanceList?page=${currentPage + 1}&empName=${param.empName}" class="next" style="margin-left: 10px; padding: 8px 12px; border: 1px solid #007bff; background-color: #ffffff; color: #007bff; border-radius: 4px; text-decoration: none;"> 다음 > </a>
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
document.addEventListener('DOMContentLoaded', function() {
    const attendanceTableBody = document.getElementById('attendanceTableBody');
    const departmentSelect = document.getElementById('departmentSelect'); // 부서 선택
    const teamSelect = document.getElementById('teamSelect'); // 팀 선택
    const employeeSearchInput = document.getElementById('employeeSearchInput'); // 직원 이름 input
    const searchEmployeeBtn = document.getElementById('searchEmployeeBtn'); // 직원 검색 Btn
    
    function resetInputs() {
        departmentSelect.value = '';
        teamSelect.value = '';
        attendanceTableBody.innerHTML = '';
        
    }
	
	//부서 목록 가져오기 
    function getDivisionList() {
		$.ajax({
		    url: '/pettopia/attendance/divisionList',  // 부서 목록 API
		    type: 'GET',
		    success: function(data) {
		        let divisionSelect = $('#departmentSelect');
		        divisionSelect.empty();  // 기존 옵션 삭제
		        divisionSelect.append('<option value="">부서 선택</option>');
		        data.forEach(function(division) {
		            divisionSelect.append('<option value="' + division.divisionCode + '">' + division.divisionName + '</option>');
		        });
		    },
		    error: function(error) {
		        console.error('부서목록 가져오기 실패 :', error);
			    }
			});
		}
	
	// 부서 선택 시 팀 목록 가져오기
	$('#departmentSelect').change(function() {
	    var selectedDivisionCode = $(this).val();
	    
	    // 팀 선택 초기화
	    let departmentSelect = $('#teamSelect');
	    departmentSelect.empty(); 
	    departmentSelect.append('<option value="">팀 선택</option>'); 
	
	    // 이름 검색 초기화
	    employeeSearchInput.value = ''; 
	    
	    // 부서 선택 시 선택된 부서 코드로 팀 목록 가져오기
	    if (selectedDivisionCode) {
	        getDepartmentList(selectedDivisionCode);
	        $('#existingAttendance').show(); // 기존 테이블 보이기
	        $('#newAttendance').hide(); // AJAX 테이블 숨기기
	    } else {
	        // 부서를 선택하지 않은 경우 직원 목록 초기화
	        $('#attendanceTableBody').html('');
	        $('#existingAttendance').show(); // 기존 테이블 보이기
	        $('#newAttendance').hide(); // AJAX 테이블 숨기기
	    }
	});
	
	// 팀 목록 가져오기 
	function getDepartmentList(divisionCode) {
		$.ajax({
		    url: '/pettopia/attendance/departmentList/' + divisionCode,  // 팀 목록 API
		    type: 'GET',
		    success: function(data) {
		        let departmentSelect = $('#teamSelect');
		        departmentSelect.empty();  // 기존 옵션 삭제
		        departmentSelect.append('<option value="">팀 선택</option>');
		        data.forEach(function(department) {
		            departmentSelect.append('<option value="' + department.deptCode + '">' + department.deptName + '</option>');
		        });
		        updateEmployeeList(); // 팀 목록 갱신 후 직원 목록 업데이트
		    },
		    error: function(error) {
		        console.error('팀목록 가져오기 실패 :', error);
		    }
		});
	   }
	
    // 팀 선택 시 직원 목록 업데이트
	$('#teamSelect').change(function() {
        updateEmployeeList();  // 팀 선택 시 직원 목록 갱신
    });
	
	  // 직원 이름으로 검색
    function searchEmployeeByName() {
        const employeeName = employeeSearchInput.value.trim(); // 입력된 이름
        const attendanceTableBody = $('#attendanceTableBody');
        
        attendanceTableBody.html(''); // 기존 직원 리스트 초기화

        if (employeeName) {
            $.ajax({
                url: '/pettopia/attendance/attendanceList',
                type: 'GET',
                data: {
                    empStatus: 'E',
                    empName: employeeName
                },
                success: function(data) {
                    if (!data || data.length === 0) {
                        attendanceTableBody.append('<tr><td colspan="6" style="text-align: center;">근태기록이 없습니다.</td></tr>');
                    } else {
                        data.forEach(function(employee) {
                            // 근태 상태 처리
                            let statusText;
                            switch (employee.attendanceStatus) {
                                case 'P':
                                    statusText = '출근';
                                    break;
                                case 'L':
                                    statusText = '지각';
                                    break;
                                case 'E':
                                    statusText = '조퇴';
                                    break;
                                case 'A':
                                    statusText = '결근';
                                    break;
                                case 'V':
                                    statusText = '연차';
                                    break;
                                case 'H':
                                    statusText = '반차';
                                    break;
                                default:
                                    statusText = '알 수 없음';
                            }
                            attendanceTableBody.append('<tr><td>' + employee.empNo + '</td>' + '<td>' + employee.empName + '</td>' + '<td>' + employee.attendanceDate + '</td>' + '<td>' + employee.clockInTime + '</td>' + '<td>' + employee.clockOutTime + '</td>' + '<td>' + statusText + '</td></tr>'); // 직원 데이터 테이블에 추가
                        });
                    }
                },
                error: function(error) {
                    console.error('Error fetching employees by name:', error);
                }
            });
            $('#newAttendance').show(); // 새로운 목록 보이기
            $('#existingAttendance').hide(); // 기존 목록 숨기기
        } else {
            // 이름이 입력되지 않은 경우
            $('#existingAttendance').show(); // 기존 테이블 보이기
            $('#newAttendance').hide(); // AJAX 테이블 숨기기
        }
    }

    // 직원 검색 버튼 클릭 시 필터링
    $(searchEmployeeBtn).click(function () {
        searchEmployeeByName(); // 이름으로 직원 검색
    });
    
    $('#employeeSearchInput').on('keydown', function(event) {
        if (event.key === "Enter") {
            event.preventDefault();  // 기본 엔터 동작 방지 (폼 제출 방지)
            searchEmployeeByName();  // 엔터 키가 눌렸을 때 실행할 함수 호출
        }
    });

    // 직원 목록 업데이트
    function updateEmployeeList() {
        const divisionCode = $('#departmentSelect').val(); // 선택된 부서 코드
        const teamCode = $('#teamSelect').val(); // 선택된 팀 코드
        const attendanceTableBody = $('#attendanceTableBody');

        attendanceTableBody.html(''); // 기존 직원 리스트 초기화

        // 부서와 팀 선택한 경우에만 목록 갱신
        if (divisionCode && teamCode) {
            $('#newAttendance').show(); // 새로운 목록 보이기
            $('#existingAttendance').hide(); // 기존 목록 숨기기

            // AJAX 요청
            $.ajax({
                url: '/pettopia/attendance/attendanceList', // 직원 목록 API
                type: 'GET',
                data: {
                    empStatus: 'E', // 'E'는 재직중인 직원 필터링
                    deptCode: teamCode || '' // 선택된 팀 코드 추가
                },
                success: function(data) {
                    if (!data || data.length === 0) {
                        attendanceTableBody.append('<tr><td colspan="6" style="text-align: center;">근태기록이 없습니다.</td></tr>');  // 직원이 없을 경우 메시지 표시
                    } else { // 직원 반복 추가.
                        data.forEach(function(employee) {
                            // 근태 상태를 처리
                            let statusText;
                            switch (employee.attendanceStatus) {
                                case 'P':
                                    statusText = '출근';
                                    break;
                                case 'L':
                                    statusText = '지각';
                                    break;
                                case 'E':
                                    statusText = '조퇴';
                                    break;
                                case 'A':
                                    statusText = '결근';
                                    break;
                                case 'V':
                                    statusText = '연차';
                                    break;
                                case 'H':
                                    statusText = '반차';
                                    break;
                                default:
                                    statusText = '알 수 없음';
                            }
                            attendanceTableBody.append('<tr><td>' + employee.empNo + '</td>' + '<td>' + employee.empName + '</td>' + '<td>' + employee.attendanceDate + '</td>' + '<td>' + employee.clockInTime + '</td>' + '<td>' + employee.clockOutTime + '</td>' + '<td>' + statusText + '</td></tr>'); // 직원 데이터 테이블에 추가
                        });
                    }
                },
                error: function(error) {
                    console.error('직원목록 가져오기 실패:', error);
                }
            });
        }
    }

    // 초기화 및 부서 목록 로드
    getDivisionList();
});



</script>

</body>

</html>