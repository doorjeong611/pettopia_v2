<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 시큐리티 세션 사용을 위한 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 시큐리티 세션정보 접근 -->
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="loginEmp"/></sec:authorize>


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
                    <div class="grow">
                        <h5 class="text-16">메인 화면</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">메인 화면</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            템플릿
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
				<div class="xl:col-span-9 flex justify-center">
				  <div class="card w-full max-w-5xl">
				    <div class="card-body">
				      <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
				        <!-- 에러메세지 -->
				        <div id="alert-error-msg" class="hidden px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-500/20"></div>
				
				        <!-- 직원 프로필 사진  -->
				        <div class="relative mx-auto mb-4 rounded-full shadow-md size-24 bg-slate-100 profile-user dark:bg-zink-500">
				          <img id="profileImg" src="${pageContext.request.contextPath }/employeeFile/${empInfo.empFileName}" alt="" class="object-cover w-15 h-15 rounded-full user-profile-image">
				        </div>
				
				        <!-- 직원 정보 입력 -->
				        <div class="grid grid-cols-1 gap-4 xl:grid-cols-12 " style="padding-left: 100px;">
				          <!-- 사번 : 자동입력 -->
				          <div class="xl:col-span-4">
				            <label for="employeeId" class="inline-block mb-2 text-base font-medium">직원 번호</label>
				            <input type="number" name="empNo" id="employeeId" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${loginEmp.username}" readOnly>
				          </div>
				
				          <!-- 이름 -->
				          <div class="xl:col-span-4 ">
				            <label for="employeeInput" class="inline-block mb-2 text-base font-medium">이름</label>
				            <input type="text" name="empName" id="employeeInput" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empName}" readonly>
				          </div>
				
				          <!-- 생년월일 -->
				          <div class="xl:col-span-4 ">
				            <label for="joiningDateInput" class="inline-block mb-2 text-base font-medium">생년월일</label>
				            <div class="gap-2">
				              <input type="text" name="empBirth" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.empBirth}" readonly>
				            </div>
				          </div>
				
				          <!-- 이메일 -->
				          <div class="xl:col-span-4">
				            <label for="emailInput" class="inline-block mb-2 text-base font-medium">이메일</label>
				            <input type="text" name="empEmail" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none " value="${empInfo.empEmail}" readonly>
				          </div>
				
				          <!-- 연락처 -->
				          <div class="xl:col-span-4 ">
				            <label for="phoneNumberInput" class="inline-block mb-2 text-base font-medium">연락처</label>
				            <div class="flex items-center space-x-4">
				              <input type="text" name="empPhone" id="phoneNumberInput2" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empPhone}" readonly>
				            </div>
				          </div>
				
				          <!-- 성별 -->
				          <div class="xl:col-span-4 ">
				            <label class="block text-base font-medium mb-2" style=" margin-bottom: 8px;">성별</label>
				            <div class="flex items-center space-x-4">
				              <input type="text" name="empGender" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.empGender}" readonly>
				            </div>
				          </div>
				
				          <!-- 주소 -->          
				          <div class="xl:col-span-4 ">
				            <label for="locationInput" class="inline-block mb-2 text-base font-medium">
				              주소
				            </label>
				            <div class="grid gap-2">
				              <!-- 우편번호 -->
				              <div class="flex items-center space-x-2">
				                <input type="text" name="postalCode" id="sample6_postcode" class="flex-grow border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.postalCode}" readonly>
				              </div>
				              
				              <!-- 주소 입력 -->
				              <input type="text" name="basicAddress" id="sample6_address" class="border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.basicAddress}" readonly>
				              <input type="text" name="detailAddress" id="sample6_detailAddress" class="border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.detailAddress}" readonly>
				              
				            </div>
				          </div>
				
				          <!-- 입사일 -->
				          <div class="xl:col-span-4 ">
				            <label for="joiningDateInput" class="inline-block mb-2 text-base font-medium">입사일</label>
				            <div class="gap-2">
				              <input type="text" name="hireDate" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.hireDate}" readonly>
				            </div>
				          </div>
				
				          <!-- 부서 -->
				          <div class="xl:col-span-4 ">
				            <label for="designationSelect" class="inline-block mb-2 text-base font-medium">소속 부서</label>
				            <div class="gap-2">
				              <input type="text" name="divisionCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.divisionName}" readonly>
				              <input type="text" name="deptCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.deptName}" readonly>
				              <input type="text" name="rankNo" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.rankName}" readonly>
				            </div>
				          </div>
				        </div>
				
				        <!-- 수정 버튼 -->
				        <div class="flex justify-end gap-2 mt-4">
				         <a href="${pageContext.request.contextPath }/employee/modifyEmployeeOne?empNo=${loginEmp.username}"> <button type="button" id="addNew" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button></a> 
				        </div>
				
				      </div>
				    </div>
				  </div>
				</div>
               
				<!-- 끝 : Main content -->
                
                
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

</body>

</html>