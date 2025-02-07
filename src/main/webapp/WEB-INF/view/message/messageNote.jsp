<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<!-- 모달 스크롤 css 추후 수정 필요 -->
<head>
  <style>
     #recipientTableContainer {
      max-height: 2400px;  
      overflow-y: auto;  
      width: 100%;        
    }


    table {
      width: 100%;
      table-layout: fixed; 
    }

    thead {
      position: sticky;  
      top: 0;            
      background-color: white; 
      z-index: 1;         
    }

    tbody {
      max-height: 200px;  
    }

    tr {
      display: table;
      width: 100%;
      table-layout: fixed;
    }

    td {
      word-wrap: break-word; 
    }
    
    /* 쪽지 전달 모달 */
	.modal.hidden {
	    display: none;
	}
	
	.modal {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0, 0, 0, 0.5);
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.modal-content {
	    background: white;
	    padding: 20px;
	    border-radius: 5px;
	}
	
	.overflow-y-auto {
    max-height: 200px; 
    overflow-y: auto;   /* 수직 스크롤 추가 */
	}
	
	table {
	    width: 100%;
	    border-collapse: collapse; 
	}
	
	thead {
	    position: sticky;  
	    top: 0;            
	    background-color: white; 
	    z-index: 1;         
	}
	
	#employeeTable tbody tr:hover {
    background-color: #f0f0f0 ; 
    cursor: pointer; 
}

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
	<meta charset="utf-8">
    <title>PetTopia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- ckeditor5  -->
    <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h5 class="title-font">쪽지 쓰기</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200 text-center">
                            <a href="${pageContext.request.contextPath}/message/messageList" class="text-slate-400 dark:text-zink-200">쪽지</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            쪽지 쓰기
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                
                <div class="card">
                    <div class="card-body">
							<form method="POST" id="messageForm" action="${pageContext.request.contextPath}/message/sendMessage">
							<div class="mb-4">
							    <span class="font-semibold">받는사람 :</span>
							    <input id="recipientInput" type="text" name="recipient" value="${recipientName != null ? recipientName : ''}"class="text-slate-500 border-b-0 focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200 text-center" placeholder="직원을 검색하세요." readonly/>
							    <button type="button" id="openModalBtn" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
							    	직원검색
							    </button>
							 <!-- message 전송을 위한 hidden값 -->
						  	<input type="hidden" id="recipientEmpNo" value="${recipientEmpNo != null ? recipientEmpNo : ''}" name="emp_No" />  
						  	
							</div>
							<div class="mb-2 pb-2">
							    <span class="font-semibold">제목 :</span>
							    <input type="text" id="messageTitle" name="title" class="text-slate-500 border-b-0 focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200 text-center" placeholder=" 제목을 입력하세요." />
							</div>
							
							<!-- 쪽지 내용 시작 -->
							<hr class="border-t border-blue-400 my-4" /> 
							<div class="mt-4">
							<textarea id="messageContent" name="content" class="w-full p-2 border border-slate-300 rounded focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200" rows="25" placeholder="내용을 입력하세요." required></textarea>
							 <div class="flex justify-end gap-2 mt-5">
								<button type="submit" id="submitMessage" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">
								    <i class="ri-mail-send-line inline-block mr-1" style="font-size: 1.05rem;"></i> <!-- 크기 조정 -->
								    <span class="align-middle">전송하기</span>
								</button>
							</form>
 								<a href="${pageContext.request.contextPath}/message/messageList" class="text-slate-500 btn bg-slate-200 border-slate-200 hover:text-slate-600 hover:bg-slate-300 hover:border-slate-300 focus:text-slate-600 focus:bg-slate-300 focus:border-slate-300 focus:ring focus:ring-slate-100 active:text-slate-600 active:bg-slate-300 active:border-slate-300 active:ring active:ring-slate-100 dark:bg-zink-600 dark:hover:bg-zink-500 dark:border-zink-600 dark:hover:border-zink-500 dark:text-zink-200 dark:ring-zink-400/50">
								    <i class="ri-mail-line inline-block mr-1" style="font-size: 1.05rem;"></i> <!-- 크기 조정 -->
								    <span class="align-middle">쪽지보관함</span>
								</a>
                            </div>
							</div>
                            <div class="grid grid-cols-1 gap-5 xl:grid-cols-12">
                            </div><!--end grid-->
                    </div>
                </div>
                
				<!-- 모달창 HTML -->
				<div id="recipientModal" class="fixed inset-0 z-50 bg-gray-800 hidden bg-opacity-50 flex items-center justify-center">
				    <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-2xl" >
				        <div class="flex justify-between items-center mb-4">
				            <h2 class="text-lg font-semibold">직원 검색</h2>
				            <button id="closeModalBtn" class="text-gray-500 hover:text-gray-700">
				                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
				                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
				                </svg>
				            </button>
				        </div>
				
				        <!-- 선택 박스 -->
				        <div class="flex space-x-4 mb-4">
				            <div class="flex-grow">
				                <select id="departmentSelect" class="border border-gray-300 rounded w-full p-2">
				                    <option value="">부서 선택</option>
				                </select>
				            </div>
				
				            <div class="flex-grow">
				                <select id="teamSelect" class="border border-gray-300 rounded w-full p-2">
				                	<option value="">팀 선택</option>
				                </select>
				            </div>
				        </div>

				        <!-- 사원 입력란 -->
				        <div class="mb-4">
				            <label class="block mb-1">이름</label>
				            <input type="text" id="employeeSearchInput" class="border border-gray-300 rounded w-full p-2" placeholder="직원이름을 입력하세요." />
				        </div>
						 
						<div class="flex justify-end mb-4">
							<button id="searchEmployeeBtn" class="bg-blue-500 hover:bg-blue-700 text-black rounded p-2">검색</button>
						</div>
						
						<!-- 선택된 직원 이름 표시 -->
				        <div id="selectedEmployee" class="mb-4"></div>
						
				        <!-- 직원 리스트 테이블 -->
				        <div class="overflow-y-auto" style="max-height: 200px; overflow-y: auto;">
				        <table id="employeeTable" style="width: 100%; border-collapse: collapse;">
						    <thead class="ltr:text-left rtl:text-right ">
						        <tr>
						            <th class="px-3.5 py-2.5 font-semibold border border-slate-200 dark:border-zink-500 text-center">부서</th>
						            <th class="px-3.5 py-2.5 font-semibold border border-slate-200 dark:border-zink-500 text-center">팀</th>
						            <th class="px-3.5 py-2.5 font-semibold border border-slate-200 dark:border-zink-500 text-center">직급</th>
						            <th class="px-3.5 py-2.5 font-semibold border border-slate-200 dark:border-zink-500 text-center">사원번호</th>
						            <th class="px-3.5 py-2.5 font-semibold border border-slate-200 dark:border-zink-500 text-center">이름</th>
						        </tr>
						    </thead>
					    <tbody id="recipientTableBody">
					        <!-- 직원 목록 동적으로 추가 -->
					    </tbody>
					</table>
				    </div>
				</div>
				
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

<!-- 받는사람 모달 -->
<script>
document.addEventListener('DOMContentLoaded', function() {
	// 모달 창 열기위한 event
    const openModalBtn = document.getElementById('openModalBtn');
    const modal = document.getElementById('recipientModal');
    const closeModalBtn = document.getElementById('closeModalBtn')
    // 받는 사람 자동입력 이벤트
    const recipientInput = document.getElementById('recipientInput');
    const recipientTableBody = document.getElementById('recipientTableBody');
    const departmentSelect = document.getElementById('departmentSelect'); // 부서 선택
    const teamSelect = document.getElementById('teamSelect'); // 팀 선택
    const employeeSearchInput = document.getElementById('employeeSearchInput'); // 직원 이름 input
    const searchEmployeeBtn = document.getElementById('searchEmployeeBtn'); // 직원 검색 Btn
    
    
    openModalBtn.addEventListener('click', openModal);
    closeModalBtn.addEventListener('click', closeModal);
    
	// 모달 창 열기
	function openModal() {
        modal.classList.remove('hidden');  // 모달창 show
        getDivisionList();  // 부서 목록 가져오기 (모달창 열릴때)
        resetInputs();
    }
	
    function resetInputs() {
        departmentSelect.value = '';
        teamSelect.value = '';
        recipientInput.value = '';
        recipientTableBody.innerHTML = '';
    }
	
    // 모달 창 닫기
    function closeModal() {
        modal.classList.add('hidden');  // 모달 창 숨기기
    }

	//부서 목록 가져오기 
    function getDivisionList() {
		$.ajax({
		    url: '/pettopia/message/divisionList',  // 부서 목록 API
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
	    } else {
	        // 부서를 선택하지 않은 경우 직원 목록 초기화
	        $('#recipientTableBody').html('');
	    }
	});
	
	// 팀 목록 가져오기 
	function getDepartmentList(divisionCode) {
		$.ajax({
		    url: '/pettopia/message/departmentList/' + divisionCode,  // 팀 목록 API
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
	
    // 부서 또는 팀 선택 시 직원 목록 업데이트
    $('#departmentSelect, #teamSelect').change(function() {
        updateEmployeeList();  // 부서나 팀 선택 시 직원 목록 갱신
    });
	
    // 직원 검색 필터링
    function updateEmployeeList() {
    	const divisionCode = $('#departmentSelect').val(); // 선택된 부서 코드
        const teamCode = $('#teamSelect').val(); // 선택된 팀 코드
        const employeeName = employeeSearchInput.value.trim(); // view 에서 입력된 이름
        const recipientTableBody = $('#recipientTableBody');
        recipientTableBody.html(''); // 기존 직원 리스트 초기화

        
        // 직원 이름 독립적으로 검색
	   if (!divisionCode && !teamCode && employeeName) {
	        // 부서나 팀 없이 이름만으로 검색
	        $.ajax({
	            url: '/pettopia/message/messageNote/employees',
	            type: 'GET',
	            data: {
	                empStatus: 'E',
	                empName: employeeName
	            },
	            success: function(data) {
	                if (!data || data.length === 0) {
	                    recipientTableBody.append('<tr><td colspan="5" style="text-align: center;">직원이 없습니다.</td></tr>');
	                } else {
	                    data.forEach(function(employee) {
	                        recipientTableBody.append('<tr style="cursor: pointer;"><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.divisionName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.deptName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.rankName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.empNo + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.empName + '</td></tr>'); // 직원 데이터 테이블에 추가
	                    });
	                }
	            },
	            error: function(error) {
	                console.error('Error fetching employees by name:', error);
	            }
	        });
	        return;
	    }

       // 부서와 팀을 선택한 경우 직원 목록 갱신
	   if (!divisionCode || !teamCode) {
	        return; // 부서나, 팀 선택 안될시 값 반환x
	    }

        
        // AJAX 요청
        $.ajax({
            url: '/pettopia/message/messageNote/employees', // 직원 목록 API
            type: 'GET',
            data: {
                empStatus: 'E', // 'E'는 재직중인 직원 필터링
                deptCode: teamCode || '', // 선택된 팀 코드 추가
                empName: employeeName || '' // 직원 이름 추가
            },
            success: function(data) {
            	if (!data || data.length === 0) {
                    recipientTableBody.append('<tr><td colspan="5" style="text-align: center;">직원이 없습니다.</td></tr>');  // 직원이 없을 경우 메시지 표시
                } else { // 직원 반복 추가.
                    data.forEach(function(employee) {
                    	recipientTableBody.append('<tr style="cursor: pointer;"><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.divisionName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.deptName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.rankName + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.empNo + '</td><td class="px-3.5 py-2.5 border border-slate-200 dark:border-zink-500" style="text-align: center;">' + employee.empName + '</td></tr>'); // 직원 데이터 테이블에 추가
                    });
                }
            },
            error: function(error) {
                console.error('직원목록 가져오기 실패:', error);
            },
        });
        
    }
    
    // 직원 검색 버튼 클릭 시 필터링
    $(searchEmployeeBtn).click(function () {
        updateEmployeeList(); // 직원 목록 필터링
    });
    
 	// 테이블 행 클릭 시 "받는사람" 자동 입력
    $('#recipientTableBody').on('click', 'tr', function () {
        const employeeName = $(this).find('td:last-child').text().trim(); // '이름' 열의 텍스트 가져오기
        const empNo = $(this).find('td:nth-child(4)').text().trim(); // '사원번호' 열의 텍스트 가져오기
        
        if (employeeName) {
            $('#recipientInput').val(employeeName); // 입력 필드에 값 설정
            $('#recipientEmpNo').val(empNo); // emp_no를 hidden 필드에 설정
            closeModal(); // 모달 창 닫기
        }
    });

    // 초기화 및 부서 목록 로드
    getDivisionList();
});
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById("messageForm");
        const modal = document.getElementById("messageSentModal");
        const closeModalBtn = document.getElementById("closeModalBtn");

        form.addEventListener('submit', function(event) {
            event.preventDefault();
            
            const userConfirmation = confirm("쪽지를 전송하시겠습니까?");
            
            if (userConfirmation) {
            	
          		form.submit();
          		
          		alert("쪽지가 성공적으로 전송 되었습니다.")
          		
	            modal.classList.remove('hidden');
	            document.getElementById("recipientInput").value = '';
	            document.getElementById("recipientEmpNo").value = '';
	            document.getElementById("messageTitle").value = '';
	            document.getElementById("messageContent").value = '';
            }
        });

        closeModalBtn.addEventListener('click', function() {
            modal.classList.add('hidden');
        });
    });
</script>
</body>

</body>
</html>