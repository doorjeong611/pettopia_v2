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
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style type="text/css">
    	/* 인덱스 폰트 */
	@font-face {
	    font-family: 'PTBandocheB';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
	}
	
	.title-font{
		font-family: 'PTBandocheB' , 'cursive';
		
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
                        <h5 class="title-font">직원 상세 정보</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">직원 조회</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            직원 상세 정보
                        </li>
                    </ul>
                </div>
                
                
                <!-- Main content -->
<div class="xl:col-span-9">
  <div class="card">
    <div class="card-body">
      <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
      <div class="grid grid-cols-12 gap-4 items-start"> 
        
        <div class="col-span-12 xl:col-span-3 flex justify-end">
          <!-- 프로필 사진 -->
          <div class="relative shadow-md size-36 bg-slate-100 profile-user dark:bg-zink-500 flex-shrink-0 mt-8">
            <img id="profileImg" src="${pageContext.request.contextPath }/employeeFile/${empInfo.fileName == null ? 'placeholder.png' : empInfo.fileName }" alt="" class="object-cover w-36 h-full user-profile-image">
          </div>
        </div> 




	<div class="col-span-12 xl:col-span-9 ">

          <!-- 직원 정보 -->
          <form action="${pageContext.request.contextPath}/employee/modifyEmployeSummary" method="post" id="modifyEmpSumForm" class="flex-1">
            <input type="hidden" name="sendEmpNo" value="${empInfo.empNo}">
    	<div class="grid grid-cols-1 gap-4 xl:grid-cols-12"> 
              <!-- 직원 번호 -->
              <div class="xl:col-span-3">
                <label for="employeeId" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pt-1 pr-2">직원 번호</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-id-card"><path d="M16 10h2"/><path d="M16 14h2"/><path d="M6.17 15a3 3 0 0 1 5.66 0"/><circle cx="9" cy="11" r="2"/><rect x="2" y="5" width="20" height="14" rx="2"/></svg>
                </label>
                <input type="number" name="empNo" id="employeeId" class="form-input px-5 border-none dark:border-zink-500 focus:outline-none" value="${empInfo.empNo}" readOnly>
              </div>

              <!-- 이름 -->
              <div class="xl:col-span-3">
                <label for="employeeInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pt-1 pr-2">이름</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user-round"><path d="M18 20a6 6 0 0 0-12 0"/><circle cx="12" cy="10" r="4"/><circle cx="12" cy="12" r="10"/></svg>
                </label>
                <input type="text" name="empName" id="employeeInput" class="form-input border-none dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empName}" readonly>
              </div>

              <!-- 이메일 -->
              <div class="xl:col-span-4">
                <label for="emailInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">이메일</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                </label>
                <input type="text" name="empEmail" class="form-input border-none dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empEmail}" readonly>
              </div>

              <!-- 연락처 -->
              <div class="xl:col-span-3">
                <label for="phoneNumberInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">연락처</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-phone"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                </label>
                <input type="text" name="empPhone" id="phoneNumberInput" class="form-input border-none dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empPhone}" readonly>
              </div>

              <!-- 내선번호 -->
              <div class="xl:col-span-3">
                <label for="extNumberInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">내선번호</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-file-audio"><path d="M17.5 22h.5a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v3"/><path d="M14 2v4a2 2 0 0 0 2 2h4"/><path d="M2 19a2 2 0 1 1 4 0v1a2 2 0 1 1-4 0v-4a6 6 0 0 1 12 0v4a2 2 0 1 1-4 0v-1a2 2 0 1 1 4 0"/></svg>
                </label>
                <input type="text" name="deptExt" id="extNumberInput" class="form-input border-none dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.deptExt}" readonly>
              </div>

              <!-- 입사일 -->
              <div class="xl:col-span-4">
                <label for="joiningDateInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">입사일</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-contact-round"><path d="M16 2v2"/><path d="M17.915 22a6 6 0 0 0-12 0"/><path d="M8 2v2"/><circle cx="12" cy="12" r="4"/><rect x="3" y="4" width="18" height="18" rx="2"/></svg>
                </label>
                <input type="text" name="hireDate" class="form-input border-none dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.hireDate}" readonly>
              </div>

              <!-- 부서 -->
              <div class="xl:col-span-3">
                <label for="divisionInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">소속 부서</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-network"><rect x="16" y="16" width="6" height="6" rx="1"/><rect x="2" y="16" width="6" height="6" rx="1"/><rect x="9" y="2" width="6" height="6" rx="1"/><path d="M5 16v-3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3"/><path d="M12 12V8"/></svg>
                </label>

                <input type="text" name="divisionCode" id="viewDivi" class="form-input dark:border-zink-500 w-40 px-5 focus:outline-none ${isAdmin == 'true' ? 'border-slate-200' : 'border-none' }" value="${empInfo.divisionName}" readonly>
                <input type="text" name="deptCode" id="viewDept"  class="form-input dark:border-zink-500 px-5 w-40  focus:outline-none ${isAdmin == 'true' ? 'border-slate-200 mt-2' : 'border-none' }" value="${empInfo.deptName}" readonly>
                
              </div>

              <!-- 직급 -->
              <div class="xl:col-span-3">
                <label for="rankInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">직급</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-armchair"><path d="M19 9V6a2 2 0 0 0-2-2H7a2 2 0 0 0-2 2v3"/><path d="M3 16a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-5a2 2 0 0 0-4 0v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V11a2 2 0 0 0-4 0z"/><path d="M5 18v2"/><path d="M19 18v2"/></svg>
                </label>
                <input type="text" name="rankNo" id="viewRank"  class="form-input dark:border-zink-500 px-5 w-28  focus:outline-none ${isAdmin == 'true' ? 'border-slate-200' : 'border-none' }" value="${empInfo.rankName}" readonly>
                <input type="text" name="isTeamLeader" id="viewTeamL" class="form-input dark:border-zink-500 px-5 w-28  focus:outline-none ${isAdmin == 'true' ? 'border-slate-200 mt-2' : 'border-none' }" value="${empInfo.isTeamLeader == 'H' ? '팀장' : '팀원'}" readonly>
                
              </div>

              <!-- 재직 상태 -->
              <div class="xl:col-span-3">
                <label for="statusInput" class="flex inline-block mb-1 text-base font-semibold px-5">
                	<span class="pr-2 pt-1">재직 상태</span>
                	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#babec2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-badge"><path d="M3.85 8.62a4 4 0 0 1 4.78-4.77 4 4 0 0 1 6.74 0 4 4 0 0 1 4.78 4.78 4 4 0 0 1 0 6.74 4 4 0 0 1-4.77 4.78 4 4 0 0 1-6.75 0 4 4 0 0 1-4.78-4.77 4 4 0 0 1 0-6.76Z"/></svg>
                </label>
                <input type="text" name="empStatus" class="form-input  dark:border-zink-500 px-5 w-28 focus:outline-none ${isAdmin == 'true' ? 'border-slate-200' : 'border-none' }" value="${empInfo.empStatus}" readonly>
         
              </div>

              <!-- 버튼 -->
              <c:if test="${isAdmin}">
                <div class="xl:col-span-12 flex justify-end gap-2 mt-4">
                  <button type="button" id="reset" class="text-red-500 bg-white btn hover:bg-red-100">되돌리기</button>
                  <button type="button" id="modifyEmpSumBtn" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">수정</button>
                </div>
              </c:if>
        </div>
          </form>
         
      
	</div> 
          
          
          
          
          
        </div>
      </div>
    </div>
  </div>
</div>



			    
	<!-- 끝 : main content -->
	     
	     
	     
	       
       <!-- 부서 수정 modalContainer -->	  
		<div id="modalContainer" class="hidden">
			<!-- 모달 배경 : 바깥 부분 클릭해서 모달창 닫기 -->
			<div id="modalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;">
			</div>

            
			<!-- 수정 버튼을 통한 부서 수정 모달창 -->                 	
 			<div id="modifyFormModal" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-[1000]">
				
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
				  <div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">
				         
				         <button type="button" id="closeModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
				         	&#10060;
				         </button>
				  </div>
			        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
			            <h5 class="mb-3 text-16">부서 변경하기</h5>
			            <div>
			            	<select name="divisionCode" id="divisionSelect" class="form-input border-slate-200 dark:border-zink-500">
			                    <option value="null">부서 선택</option>
			                </select>
			                <select name="deptCode" id="departSelect" class="form-input border-slate-200 dark:border-zink-500">
			                    <option value="null">팀 선택</option>
			                </select>
			            </div>
			        </div>
			        <div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
			            <button id="modifyDeptBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button>
			        </div>
			    </div>
			</div> 

		</div><!-- 끝: modalContainer -->	

		
		
		
		
		
		
		<!-- 직급 수정 modalContainer -->	  
		<div id="rankModalContainer" class="hidden">
			<!-- 모달 배경 : 바깥 부분 클릭해서 모달창 닫기 -->
			<div id="rankModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;">
			</div>

            
			<!-- 수정 버튼을 통한 부서 수정 모달창 -->                 	
 			<div id="rankModifyFormModal" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-[1000]">
				
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
				  <div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">
				         
				         <button type="button" id="closeRankModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
				         	&#10060;
				         </button>
				  </div>
			        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
			            <h5 class="mb-3 text-16">직급 변경하기</h5>
			            <select name="rankNo" id="rankSelect" class="form-input border-slate-200 dark:border-zink-500">
		                    <option value="">직급 선택</option>
		                </select>
			        </div>
			        <div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
			            <button id="modifyRankBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button>
			        </div>
			    </div>
			</div> 

		</div><!-- 직급 끝: modalContainer -->
		
		
		<!-- 재직 상태 수정 modalContainer -->	  
		<div id="empStatusModalContainer" class="hidden">
			<!-- 모달 배경 : 바깥 부분 클릭해서 모달창 닫기 -->
			<div id="empStatusModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;">
			</div>

            
			<!-- 수정 버튼을 통한 부서 수정 모달창 -->                 	
 			<div id="empStatusModifyFormModal" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-[1000]">
				
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
				  <div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">
				         
				         <button type="button" id="closeEmpStatusModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
				         	&#10060;
				         </button>
				  </div>
			        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
			            <h5 class="mb-3 text-16">재직 상태 변경하기</h5>
			            <select name="empStatus" id="empStatusSelect" class="form-input border-slate-200 dark:border-zink-500">
		                    <option value="null">재직 상태</option>
		                    <option value="E">재직</option>
		                    <option value="H">대기</option>
		                    <option value="L">휴직</option>
		                    <option value="R">퇴직</option>
		                    <option value="T">임시</option>
		                </select>
			        </div>
			        <div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
			            <button id="modifyEmpStatusBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button>
			        </div>
			    </div>
			</div> 

		</div><!-- 직급 끝: modalContainer -->
						  

        

                
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
<%-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script> --%>

<!--dashboard ecommerce init js-->
<%-- <script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script> --%>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<!-- 모달창 스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	// isAdmin이 true일 때 input 클릭해서 모달창 띄우기
	const isAdmin = ${isAdmin};
	console.log('isAdmin : ' + isAdmin);
	

	
	// 되돌리기 버튼을 위해 초기값 저장
    const originalValues = {
        division: $("input[name='divisionCode']").val(), // 부서
        dept: $("input[name='deptCode']").val(),         // 팀
        rank: $("input[name='rankNo']").val(), // 직급
        status: $("input[name='empStatus']").val() // 재직 상태

    };

    // 되돌리기 버튼 클릭 이벤트
    $("#reset").click(function () {
        // 입력 필드를 초기값으로 되돌리기
        $("input[name='divisionCode']").val(originalValues.division); // 부서 복원
        $("input[name='deptCode']").val(originalValues.dept);         // 팀 복원
        $("input[name='rankNo']").val(originalValues.rank);         // 직급 복원
        $("input[name='empStatus']").val(originalValues.status);         // 재직상태 복원

        // hidden 삭제
        $("input[name='empDeptCode']").remove(); // 기존 hidden input 제거
        $("input[name='empRankNo']").remove();  // 기존 hidden input 제거
        $("input[name='empStatusVal']").remove();  // 기존 hidden input 제거

        // 모달 선택값 초기화 (필요한 경우 추가)
        $("#divisionSelect").val("").change(); // 부서 select 초기화
        $("#departSelect").val("").change();   // 팀 select 초기화

        alert("되돌리기 완료.");
    });
	

 // --------------------------------------------------------------------------------------------------------------------------------
	
	
	/* 부서 모달창 관련 id 가져오기 */
    const modalContainer = $("#modalContainer");
    const modalBackground = $("#modalBackground");
    const modifyFormModal = $("#modifyFormModal");
    const closeModalBtn = $("#closeModalBtn");
    const modifyDeptBtn = $("#modifyDeptBtn");

    // 모달창 띄우기
    $("input[name='divisionCode'], input[name='deptCode']").click(function() {
        if (isAdmin) {
            // 모달 배경과 모달 창을 보이게 하기
            $("#modalContainer").removeClass("hidden");
            /* $("#modalBackground").removeClass("hidden");
            $("#modifyFormModal").removeClass("hidden"); */
        }
    });
    // 모달 닫기 함수
    function closeModal() {
        modalContainer.addClass("hidden");
        $('body').removeClass('overflow-hidden');
    }

    // 닫기 버튼
    closeModalBtn.click(closeModal);

    // 수정 버튼
    modifyDeptBtn.click(function() {
        closeModal();
    });

    // 배경 클릭시 닫기
    modalBackground.click(function(event) {
        if (event.target === this) {
            closeModal();
        }
    });
    
    // 부서 및 팀 선택 후 input에 값 넣기
    $("#divisionSelect, #departSelect").change(function() {
        const selectedDivision = $("#divisionSelect option:selected").html();
        console.log('selectedDivisionText : ' + selectedDivision); 
        
        const selectedDept = $("#departSelect option:selected").html();
        const selectedDeptCode = $("#departSelect").val();
        console.log('selectedDivisionText : ' + selectedDept); 
        console.log('selectedDeptCode : ' + selectedDeptCode); 

        $('#modifyDeptBtn').click(function() {
        	 
        	
            // 선택된 부서 및 팀 값을 input에 업데이트
            $("input[name='divisionCode']").val(selectedDivision);  // 부서 input 값
            $("input[name='deptCode']").val(selectedDept);          // 팀 input 값
            
        	// 기존에 empDeptCode가 존재하면 삭제하고 새로 추가
            $("input[name='empDeptCode']").remove();  // 기존 hidden input 제거
            
            
            if($('#divisionSelect').val() == 'null' || $('#departSelect').val() == 'null'){
            	 // hidden으로 전달
            	$("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empDeptCode', value: 'null'}));
            	
            }else{
            	$("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empDeptCode', value: selectedDeptCode}));
            }
            
            closeModal();
        });
    
        
    }); /* 끝 : 부서 모달창  */
    
    // --------------------------------------------------------------------------------------------------------------------------------
    
    /* 직급 모달창 관련 id 가져오기 */
    const rankModalContainer = $("#rankModalContainer");
    const rankModalBackground = $("#rankModalBackground");
    const rankModifyFormModal = $("#rankModifyFormModal");
    const closeRankModalBtn = $("#closeRankModalBtn");
    const modifyRankBtn = $("#modifyRankBtn");

    // 모달창 띄우기
    $("input[name='rankNo'], input[name='isTeamLeader']").click(function() {
        if (isAdmin) {
            // 모달 배경과 모달 창을 보이게 하기
            rankModalContainer.removeClass("hidden");
           
        }
    });
    // 모달 닫기 함수
    function closeRankModal() {
    	rankModalContainer.addClass("hidden");
        $('body').removeClass('overflow-hidden');
    }

    // 닫기 버튼
    closeRankModalBtn.click(closeRankModal);

    // 수정 버튼
    modifyRankBtn.click(function() {
    	closeRankModal();
    });

    // 배경 클릭시 닫기
    rankModalBackground.click(function(event) {
        if (event.target === this) {
        	closeRankModal();
        }
    });
    
    // 직급 선택 후 input에 값 넣기
    $("#rankSelect").change(function() {
        const selectedRank = $("#rankSelect option:selected").html();
        console.log('selectedRank : ' + selectedRank); 
        
        const selectedRankNo = $("#rankSelect").val();
        console.log('selectedRankNo : ' + selectedRankNo); 

        $('#modifyRankBtn').click(function() {
        	  
            // 선택된 부서 및 팀 값을 input에 업데이트
            $("input[name='rankNo']").val(selectedRank);  // 직급 input 값
           
            
         	// 기존에 hidden 존재하면 삭제하고 새로 추가
            $("input[name='empRankNo']").remove();  // 기존 hidden input 제거
            
            
           if($('#rankSelect').val() == ''){
           		// hidden으로 전달
           		$("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empRankNo', value: 'null'}));
           	
           }else{
           		$("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empRankNo', value: selectedRankNo}));
           }
           
            
            closeRankModal();
        });
    
        
    }); /* 끝 : 직급 모달창  */
    
    
    
 	// --------------------------------------------------------------------------------------------------------------------------------
    
    /* 재직상태 모달창 관련 id 가져오기 */
    const empStatusModalContainer = $("#empStatusModalContainer");
    const empStatusModalBackground = $("#empStatusModalBackground");
    const empStatusModifyFormModal = $("#empStatusModifyFormModal");
    const closeEmpStatusModalBtn = $("#closeEmpStatusModalBtn");
    const modifyEmpStatusBtn = $("#modifyEmpStatusBtn");

    // 모달창 띄우기
    $("input[name='empStatus']").click(function() {
        if (isAdmin) {
            // 모달 배경과 모달 창을 보이게 하기
            empStatusModalContainer.removeClass("hidden");   
        }
    });
    
    // 모달 닫기 함수
    function closeEmpStatusModal() {
    	empStatusModalContainer.addClass("hidden");
        $('body').removeClass('overflow-hidden');
    }

    // 닫기 버튼
    closeEmpStatusModalBtn.click(closeEmpStatusModal);

    // 수정 버튼
    modifyEmpStatusBtn.click(function() {
    	closeEmpStatusModal();
    });

    // 배경 클릭시 닫기
    empStatusModalBackground.click(function(event) {
        if (event.target === this) {
        	closeEmpStatusModal();
        }
    });
    
    // 재직 상태 선택 후 input에 값 넣기
    $("#empStatusSelect").change(function() {
        const selectedEmpStatus = $("#empStatusSelect option:selected").html();
        console.log('selectedEmpStatus : ' + selectedEmpStatus); 
        
        const selectedEmpStatusVal = $("#empStatusSelect").val();
        console.log('selectedEmpStatusVal : ' + selectedEmpStatusVal); 

        $('#modifyEmpStatusBtn').click(function() {
        	  
            // 선택된 값을 input에 업데이트
            $("input[name='empStatus']").val(selectedEmpStatus);  // 직급 input 값
           
         	// 기존에 hidden 존재하면 삭제하고 새로 추가
            $("input[name='empStatusVal']").remove();  // 기존 hidden input 제거
            
            // hidden으로 전달
            $("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empStatusVal', value: selectedEmpStatusVal}));
            
            closeEmpStatusModal();
        });
    
        
    }); /* 끝 : 재직 상태 모달창  */
    
    
    
    

   
    // --------------------------------------------------------------------------------------------------------------------------------
    
    /* 부서, 팀 선택 */
    console.log("목록 스크립트 실행")

	$.ajax({
				url : '/pettopia/rest/divisionList',
				method : 'GET'
	}).done(function(result) {
				console.log($('#divisionSelect').css('display'));
				console.log($('#departSelect').css('visibility'));
				console.log($('#rankSelect').css('opacity'));
				console.log("응답받은 결과:", result);
				$(result).each(function(index,item) {
					$('#divisionSelect').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
				});
				console.log("typeSelect 내용:", 
				$('#divisionSelect').html()); // 드롭다운 내용 확인
			}).fail(function() {
		alert('부서 호출 실패');
	});

	/* 부서 선택 시 */
	$('#divisionSelect').change(function() {

		$.ajax({
			url : '/pettopia/rest/departmentList/'+ $('#divisionSelect').val(),
			method : 'GET'
		}).done(function(result) {
			// 팀 리셋
			$('#departSelect').empty();
			$('#departSelect').append('<option value="">팀 선택</option>');
			$(result).each(function(index, item) {
					$('#departSelect').append('<option value="' + item.deptCode + '">'+ item.deptName + '</option>');
			});

		}).fail(function() {
			alert('팀 호출 실패');
		});
	});    
    
    
	/* 직급 선택 */
	$.ajax({
		url : '/pettopia/rest/rankList',
		method : 'GET'
	}).done(function(result) {
		// 직급 리셋
		$('#rankSelect').empty();
		$('#rankSelect').append('<option value="">직급 선택</option>');
		$(result).each(function(index,item) {
				$('#rankSelect').append('<option value="' + item.rankNo + '">'+ item.rankName+ '</option>');
			});
		
	}).fail(function() {
		alert('직급 호출 실패');
	});
    
	
	// --------------------------------------------------------------------------------------------------------------------------------
    
	$("#modifyEmpSumBtn").click(function () {
        // hidden 태그가 존재하는지 확인
        const empDeptCodeExists = $("input[name='empDeptCode']");
        const empRankNoExists = $("input[name='empRankNo']");
        const empStatusValExists = $("input[name='empStatusVal']");

        // 모두 존재하지 않으면 폼 제출 X
        if (empDeptCodeExists.length === 0 && empRankNoExists.length === 0 && empStatusValExists.length === 0) {
	        alert("수정 사항이 없습니다.");
	        return; // 폼 제출 X
    	}
        
        if(empDeptCodeExists.val() == 'null' || empRankNoExists.val() == 'null' || empStatusValExists.val() == 'null'){
        	 alert("수정 사항이 없습니다.");
        	// 입력 필드를 초기값으로 되돌리기
             $("input[name='divisionCode']").val(originalValues.division); // 부서 복원
             $("input[name='deptCode']").val(originalValues.dept);         // 팀 복원
             $("input[name='rankNo']").val(originalValues.rank);         // 직급 복원
             $("input[name='empStatus']").val(originalValues.status);         // 재직상태 복원

             // hidden 삭제
             $("input[name='empDeptCode']").remove(); // 기존 hidden input 제거
             $("input[name='empRankNo']").remove();  // 기존 hidden input 제거
             $("input[name='empStatusVal']").remove();  // 기존 hidden input 제거
        	 
             return; // 폼 제출 X
        }

        // 하나라도 존재하면 폼 제출
        $("#modifyEmpSumForm").submit();
    });
    
	
});
</script>           


</body>

</html>