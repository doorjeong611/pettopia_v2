<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>addDocument</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    <script src="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    $(document).ready(function() {
        const $initApproverInput = $('#initApproverNo');
        const $midApproverInput = $('#midApproverNo');
        const $finalApproverInput = $('#finalApproverNo');
        const $approverModal = $('#approverModal');
        const $closeModalButton = $('#closeModalHeader, #closeModalFooter');
        const $approverList = $('#approverList');

        let currentInput = null;

        // 결재자 입력 필드 클릭 시 모달 열기
        $initApproverInput.on('click', function() {
            currentInput = $initApproverInput;
            openModal();
        });

        $midApproverInput.on('click', function() {
            // 초기 결재자가 선택되었는지 확인
            if (!$initApproverInput.val()) {
                alert("초기 결재자를 먼저 선택하세요.");
                return;
            }
            currentInput = $midApproverInput;
            openModal();
        });

        $finalApproverInput.on('click', function() {
            // 중간 결재자가 선택되었는지 확인
            if (!$midApproverInput.val()) {
                alert("중간 결재자를 먼저 선택하세요.");
                return;
            }
            currentInput = $finalApproverInput;
            openModal();
        });

        // 모달 창 닫기
        $closeModalButton.on('click', function() {
            closeModal();
        });

        // ESC 키를 눌렀을 때 모달 닫기
        $(document).on('keydown', function(event) {
            if (event.key === 'Escape') {
                closeModal();
            }
        });

        // 모달에서 직원 선택 시 해당 결재자 입력 필드에 값 채우기
        $approverList.on('click', '.approver-item', function() {
            const selectedApproverId = $(this).data('emp-no');
            const selectedApproverText = $(this).text();

            // 중간 결재자와 초기 결재자 비교
            if (currentInput === $midApproverInput && selectedApproverText === $initApproverInput.val()) {
                alert("초기 결재자와 같은 직원입니다.");
                return;
            }

            // 최종 결재자와 초기, 중간 결재자 비교
            if (currentInput === $finalApproverInput &&
                (selectedApproverText === $initApproverInput.val() || selectedApproverText === $midApproverInput.val())) {
                alert("초기, 중간 결재자와 같은 직원입니다.");
                return;
            }

            if (currentInput) {
                currentInput.val(selectedApproverText); // 선택한 결재자의 이름을 입력 필드에 설정
            }

            currentInput.data('emp-no', selectedApproverId); // ID 저장

            closeModal(); // 선택 후 모달 닫기
        });

        function openModal() {
            $approverModal.removeClass('hidden').css('pointer-events', 'auto');
        }

        function closeModal() {
            $approverModal.addClass('hidden').css('pointer-events', 'none'); // 모달 숨기기
            currentInput = null; // 모달이 닫힐 때 currentInput 초기화
        }
    });
























        $(function() { // $(document).ready()의 간단한 문법
            var date = new Date();
            var year = date.getFullYear();
            var month = ("0" + (1 + date.getMonth())).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);

            const formattedDate = year + '-' + month + '-' + day;
            console.log('Formatted Date:', formattedDate); // debug

            $('#writingDate').val(formattedDate);
        });
    </script>
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
                        <h5 class="text-16">문서 작성</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">결재 문서</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            문서 작성
                    	</li>
                    </ul>
                </div>
                <!-- Main content -->
                <!-- Default 문서 -->
                <div id="F" class="default-form">
               		<div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="">유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V">* 연차 신청서</option>
			                            	<option value="M">* 비품 구매 신청서</option>
			                            	<option value="R">* 사직서</option>
	                                	</select>
                              			</div>
                              			
                              			
                                    	<!-- 문서 유형에 맞는 폼 -->
									<div class="xl:col-span-7">
                                    	<label for="docTitle" class="inline-block mb-2 text-base font-medium">문서 제목</label>
                                        <input type="text" id="docTitle" name="docTitle" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" placeholder="문서 제목을 입력하세요" required="">
	                                </div><!--end col-->
	                                
	                                <div class="xl:col-span-3"></div>
                                    
                                    <div class="xl:col-span-4">
                                        <label for="docWriterNo" class="inline-block mb-2 text-base font-medium">작성자</label>
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${loginEmp.empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${loginEmp.empNo} / ${loginEmp.empName}" disabled required>
                                    </div><!--end col-->
	                                        
                                    <div class="xl:col-span-2">
                                    	<label for="docWriterNo" class="inline-block mb-2 text-base font-medium">부서</label>
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empDept.deptName}" disabled required>
                                    </div>
                                    <div class="xl:col-span-2">
									    <label for="writingDate" class="inline-block mb-2 text-base font-medium">작성일</label>
									    <input type="text" id="writingDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="" disabled required>
									</div>
									
                                    <div class="xl:col-span-4"></div>
									
									<!-- 초기 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="initApproverNo" class="inline-block mb-2 text-base font-medium">초기 결재자</label>
									    <input type="text" name="initApproverNo" id="initApproverNo" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" name="midApproverNo" id="midApproverNo" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium">최종 결재자</label>
									    <input type="text" name="finalApproverNo" id="finalApproverNo" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
									</div>
									
									<!-- 결재 수신자 목록 모달 -->
									<div id="approverModal" modal-center="" class="fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
									    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md flex flex-col h-full">
									        <!-- Modal Header -->
									        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
									            <h5 class="text-16 mr-auto">결재 수신자 목록</h5> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
									            <button id="closeModalHeader" type="button" class="text-gray-500 hover:text-gray-700">
									                <i class="ri-close-line text-2xl"></i>
									            </button>
									        </div>
									        
									        <!-- Modal Content -->
									        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
									            <h5 class="mb-3 text-16">직원 검색</h5>
									            <input type="text" id="approverSearch" class="form-input w-full mb-4" placeholder="직원 검색">
									            <ul id="approverList" class="mt-2">
									                <!-- 예시 직원 목록 -->
									                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400007">202400007 / 이지민</li>
									                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400008">202400008 / 박지민</li>
									                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400009">202400009 / 이영호</li>
									                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="2024000010">202400010 / 김지혜</li>
									                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="2024000011">202400011 / 홍길동</li>
									            </ul>
									        </div>
									
									        <!-- Modal Footer -->
									        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
									            <button id="closeModalFooter" type="button" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
									                닫기
									                <i class="align-baseline ltr:pl-1 ri-close-line"></i>
									            </button>
									        </div>
									    </div>
									</div>
                                    
									
                           		</div>
                           	</form>
                   		</div>
               	    </div><!--end card-->
	           </div>
			   
			   <!-- Draft 문서 -->
	           <div id="D" class="draft-form" style="display: none;">
	               <!-- 기안서 관련 필드 추가 -->
	           </div>
	           
	           <!-- Vacation 문서 -->
	           <div id="V" class="vacation-form" style="display: none;">
	               <!-- 연차 신청서 관련 필드 추가 -->
	           </div>
	           
	           <!-- Material 문서 -->
	           <div id="M" class="material-form" style="display: none;">
	               <!-- 비품 구매 신청서 관련 필드 추가 -->
	           </div>
	           
	           <!-- Resignation 문서 -->
	            <div id="R" class="resignation-form" style="display: none;">
	                <!-- 사직서 관련 필드 추가 -->
	           </div>
            <!-- container-fluid -->
        	</div>
		</div>
        <!-- End Page-content -->
		<!-- Start Footer -->
        <footer class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm absolute right-0 bottom-0 px-4 h-14 group-data-[layout=horizontal]:ltr:left-0  group-data-[layout=horizontal]:rtl:right-0 left-0 border-t py-3 flex items-center">
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
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>
<!--apexchart js-->
<!-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>  -->

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>


<script>
	// <select> 요소
	const docTypeSelect = $('#docType');
	// <radio> 요소
	const vacationTypeRadio = $('input[name="vacationType"]');
	
	// 문서 작성 텍스트를 변경할 <h5> 요소
	const documentTitle = $('h5.text-16');

	// 각 문서 유형에 해당하는 div들
	const documentDiv = $('#F');  // 기본문서 관련 div
	const draftDiv = $('#D');  // 기안서 관련 div
	const vacationDiv = $('#V');  // 연차 신청서 관련 div
	const materialDiv = $('#M');  // 비품 구매 신청서 관련 div
	const resignDiv = $('#R');    // 사직서 관련 div
	
	// HTML을 문자열로 저장
	const documentFormHTML = $('#F')[0].outerHTML;
	const draftFormHTML = $('#D')[0].outerHTML;
	const vacationFormHTML = $('#V')[0].outerHTML;
	const materialFormHTML = $('#M')[0].outerHTML;
	const resignFormHTML = $('#R')[0].outerHTML;
	
	// 각 문서 유형에 해당하는 div들을 클론해서 저장
	const documentFormClone = $('#F').clone();  // 기본문서 관련 div 클론
	const draftFormClone = $('#D').clone();  // 기안서 관련 div 클론
	const vacationFormClone = $('#V').clone();  // 연차 신청서 관련 div 클론
	const materialFormClone = $('#M').clone();  // 비품 구매 신청서 관련 div 클론
	const resignFormClone = $('#R').clone();    // 사직서 관련 div 클론
	
	function removeAllDocuments() {
	    // 각 문서 관련 div들을 한 번에 삭제
	    $('#F, #D, #V, #M, #R').remove();
	}
	
    function resetVacationRadioButtons() {
        $('#vacationTypeAL').prop('checked', false);  // 연차 버튼 초기화
        $('#vacationTypeHLa').prop('checked', false);  // 반차(오전) 버튼 초기화
        $('#vacationTypeHLp').prop('checked', false);  // 반차(오후) 버튼 초기화
    }

	// <select>의 변화에 따라 div를 숨기거나 보이게 하기
    docTypeSelect.on('change', function() {
        const selectedValue = $(this).val();
        console.log('Selected Document Type:', selectedValue);
        
        removeAllDocuments();
        
     // 선택된 문서 유형에 맞는 div만 추가
        // 선택된 문서 유형에 맞는 div만 추가
	    if (selectedValue === '') {
	    	console.log(documentFormHTML);
	        $('#someOtherElement').append(documentFormClone); // 기본문서
	        $('#someOtherElement').append($(documentFormHTML)); // 기본문서
	        documentTitle.text('문서 작성');  // 제목을 '문서 작성'으로 설정
	    } else if (selectedValue === 'D') {
	        $('#someOtherElement').append(draftFormClone); // 기안서
	        documentTitle.text('기안서 작성');  // 제목을 '기안서 작성'으로 설정
	    } else if (selectedValue === 'V') {
	        $('#someOtherElement').append(vacationFormClone); // 연차 신청서
	        documentTitle.text('연차 신청서 작성');  // 제목을 '연차 신청서 작성'으로 설정
	    } else if (selectedValue === 'M') {
	        $('#someOtherElement').append(materialFormClone); // 비품 신청서
	        documentTitle.text('비품 신청서 작성');  // 제목을 '비품 신청서 작성'으로 설정
	    } else if (selectedValue === 'R') {
	        $('#someOtherElement').append(resignFormClone); // 사직서
	        documentTitle.text('사직서 작성');  // 제목을 '사직서 작성'으로 설정
	    }

        resetVacationRadioButtons();  // 연차 관련 초기화
    });
</script>





</body>

</html>