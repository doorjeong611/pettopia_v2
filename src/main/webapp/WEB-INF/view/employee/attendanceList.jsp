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
                    <div class="card-body">
                        <div class="grid grid-cols-1 gap-5 mb-5 xl:grid-cols-12">
                            <div class="xl:col-span-3">
                                <div class="relative">
                                    <input type="text" id="empName" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="직원 검색" autocomplete="off">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
                                    <button id="searchButton" class="bg-blue-500 text-white p-2 rounded">검색</button>
                                </div>
                            </div><!--end col-->
                            <div class="xl:col-span-2 xl:col-start-11">
                            
                            </div>
                            
                        </div><!--end grid-->
                        
                        <div>
                            <table class="w-full whitespace-nowrap">
                          <thead>
                    <tr>
                        <th class="px-3.5 py-1.5 border-y border-slate-200 text-center">직원이름</th>
                        <th class="px-3.5 py-1.5 border-y border-slate-200 text-center">출근날짜</th>
                        <th class="px-3.5 py-1.5 border-y border-slate-200 text-center">출근시간</th>
                        <th class="px-3.5 py-1.5 border-y border-slate-200 text-center">퇴근시간</th>
                        <th class="px-3.5 py-1.5 border-y border-slate-200 text-center">근태상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${attendanceList}">
                        <tr>
                            <td class="px-3.5 py-2 border-y border-slate-200 text-center">${a.empName}</td>
                            <td class="px-3.5 py-2 border-y border-slate-200 text-center">${a.attendanceDate}</td>
                            <td class="px-3.5 py-2 border-y border-slate-200 text-center">${a.clockInTime}</td>
                            <td class="px-3.5 py-2 border-y border-slate-200 text-center">${a.clockOutTime}</td>
                            <td class="px-3.5 py-2 border-y border-slate-200 text-center">${a.attendanceStatus}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        
    			 <div id="paginationItems">
		            <div>
		                <p>
		                </p>
		            </div>
        <!-- Pagination controls -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage - 1}" class="prev">이전</a>
                </c:if>

                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${pageNum}" class="page-num">${pageNum}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/employee/attendanceList?page=${currentPage + 1}" class="next">다음</a>
                </c:if>
            </div>
        </div>
        </div>
    </div></div>
    
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

<!-- grid  -->
<script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.production.min.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<script src='assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
<script src="assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/prismjs/prism.js"></script>
<script src="assets/libs/lucide/umd/lucide.js"></script>
<script src="assets/js/tailwick.bundle.js"></script>
<!-- App js -->
<script src="assets/js/app.js"></script>
</body>

</html>