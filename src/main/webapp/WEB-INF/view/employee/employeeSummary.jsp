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

    <div class="xl:col-span-9">
      <div class="card">
        <div class="card-body">
          <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">

            <!-- Hidden Fields -->
            <input type="hidden" value="" name="id" id="id">
            <input type="hidden" value="add" name="action" id="action">
            <input type="hidden" id="id-field">

            <!-- 에러메세지 -->
            <div id="alert-error-msg" class="hidden px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-500/20"></div>

            <!-- 직원 프로필 사진  -->
			<div class="relative mx-auto mb-4 shadow-md size-24 bg-slate-100 profile-user dark:bg-zink-500">
			    <img id="profileImg" src="${pageContext.request.contextPath }/employeeFile/${empInfo.fileName == null ? 'placeholder.png' : empInfo.fileName }" alt="" class="object-cover w-full h-full user-profile-image">
			</div>

            <!-- 직원 정보 -->
            <div class="grid grid-cols-1 gap-4 xl:grid-cols-12">
              <!-- 사번 -->
              <div class="xl:col-span-4">
                <label for="employeeId" class="inline-block mb-2 text-base font-medium">직원 번호</label>
                <input type="number" name="empNo" id="employeeId" class="form-input border-slate-200 dark:border-zink-500" value="${loginEmp.username}" readOnly>
              </div>

              <!-- 이름 -->
              <div class="xl:col-span-4 ">
	            <label for="employeeInput" class="inline-block mb-2 text-base font-medium">이름</label>
	            <input type="text" name="empName" id="employeeInput" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empName}" readonly>
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
	          
              <!-- 내선번호 -->
	          <div class="xl:col-span-4 ">
	            <label for="phoneNumberInput" class="inline-block mb-2 text-base font-medium">내선번호</label>
	            <div class="flex items-center space-x-4">
	              <input type="text" name="empPhone" id="phoneNumberInput2" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.deptExt}" readonly>
	            </div>
	          </div>
              
              
              <!-- 입사일 -->
               <div class="xl:col-span-4 ">
	            <label for="joiningDateInput" class="inline-block mb-2 text-base font-medium">입사일</label>
	            <div class="gap-2">
	              <input type="text" name="hireDate" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.hireDate}" readonly>
	            </div>
	          </div>
            
            <form action="${pageContext.request.contextPath}/admin/modifyEmployeSummary" method="post" id="modifyEmpSumForm" >  
	          
	          <!-- 부서 -->
	          <div class="xl:col-span-4 ">
	            <label id="divisionDiv" for="designationSelect" class="inline-block mb-2 text-base font-medium">소속 부서</label>
	            <div class="gap-2">
	              <input type="text" name="divisionCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none " value="${empInfo.divisionName}" readonly>
	              <input type="text" name="deptCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none " value="${empInfo.deptName}" readonly>
	            </div>
	          </div>
	          
	          <!-- 직급, 팀장여부 -->
	          <div class="xl:col-span-4 ">
	            <label for="designationSelect" class="inline-block mb-2 text-base font-medium">직급</label>
	            <div class="gap-2">
	              <input type="text" name="rankNo" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.rankName}" readonly>
	              <input type="text" name="isTeamLeader" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.isTeamLeader == 'H' ? '팀장' : '팀원'}" readonly>
	            </div>
	          </div>
	          
	          <!-- 재직 상태 -->
	          <div class="xl:col-span-4 ">
	            <label for="designationSelect" class="inline-block mb-2 text-base font-medium">재직 상태</label>
	            <div class="gap-2">
	              <input type="text" name="empStatus" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.empStatus}" readonly>
	            </div>
	          </div>
	         
	         
	         <div class="xl:col-span-12 ">
             	<button type="button" id="modifyEmpSumBtn" class="text-white btn bg-custom-500 hover:bg-custom-600 ml-auto">수정</button>
            </div>
	         
	        </form> 
	     
	     
	     
	     
	     
	       
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
			                    <option value="">부서 선택</option>
			                </select>
			                <select name="deptCode" id="departSelect" class="form-input border-slate-200 dark:border-zink-500">
			                    <option value="">팀 선택</option>
			                </select>
			            </div>
			        </div>
			        <div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
			            <button id="modifyDeptBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600"> 부서 수정</button>
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
			            <button id="modifyRankBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600"> 직급 수정</button>
			        </div>
			    </div>
			</div> 

		</div><!-- 직급 끝: modalContainer -->
		
		
		
		
		
		
		
							  
					
          </div>
          </div>
        </div>
      </div>
    </div>
	<!-- 끝 : main content -->
        

                
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
<%-- <script src="${pageContext.request.contextPath}/assets/js/app.js"></script> --%>

<!-- 모달창 스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	// isAdmin이 true일 때 input 클릭해서 모달창 띄우기
	const isAdmin = ${isAdmin};
	
	console.log('isAdmin : ' + isAdmin);
	
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
            
            
            // hidden으로 전달
            $("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empDeptCode', value: selectedDeptCode}));
            
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
    closeModalBtn.click(closeRankModal);

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
           
            
            // hidden으로 전달
            $("#modifyEmpSumForm").append($('<input>', {type: 'hidden', name: 'empRankNo', value: selectedRankNo}));
            
            closeRankModal();
        });
    
        
    }); /* 끝 : 직급 모달창  */
    
    
    

   
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
    
    
    
    
	
});
</script>           


</body>

</html>