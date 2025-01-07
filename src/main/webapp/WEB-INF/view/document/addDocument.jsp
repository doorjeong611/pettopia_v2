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
    <script src="assets/libs/flatpickr/flatpickr.min.js"></script>
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
                <div class="xl:col-span-9">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="mb-5 text-15">문서 작성</h6>
                                
                                
                                <form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                                    <div class="grid grid-cols-1 gap-5 lg:grid-cols-2 xl:grid-cols-12">
                                    	<div class="xl:col-span-6">
                                            <label for="docTitle" class="inline-block mb-2 text-base font-medium">문서 제목</label>
                                            <input type="text" id="docTitle" name="docTitle" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="문서 제목을 입력하세요" required="">
                                        </div><!--end col-->
                                        
                                    	<div class="xl:col-span-6">
                                    		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                    		<select id="docType" name="docType" class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                                    <option value="">유형을 선택하세요</option>
			                                    <option value="D">기안 문서</option>
			                                	<option value="V">휴가 신청서</option>
			                                	<option value="M">자재 신청서</option>
		                                	</select>
                                		</div>
                                        
                                        <div class="xl:col-span-6">
                                            <label for="docWriterNo" class="inline-block mb-2 text-base font-medium">문서 작성자</label>
                                            <input type="hidden" name="docWriterNo" id="docWriterNo" value="${loginEmp.empNo}">
                                            <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="${loginEmp.empNo} / ${loginEmp.empName}" disabled required>
                                        </div><!--end col-->
                                        
                                        <!-- 모달 -->
                                        <div class="xl:col-span-6">
										    <label for="approverEmpNo" class="inline-block mb-2 text-base font-medium">결재 수신자</label>
										    <input type="text" name="approverEmpNo" id="approverEmpNo" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="수신 받을 직원을 선택하세요" readonly required>
										</div>
                                        
                                        <div id="approverModal" modal-center="" class="fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
										    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
										        <!-- Modal Header -->
										        <div class="flex items-center justify-start p-4 bg-slate-100 border-b">
												    <h5 class="text-16">결재 수신자 목록</h5>
												</div>


										        
										        <!-- Modal Content -->
										        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
										            <h5 class="mb-3 text-16">직원 검색</h5>
										            <input type="text" id="approverSearch" class="form-input w-full mb-4" placeholder="직원 검색">
										            <ul id="approverList" class="mt-2">
										                <!-- 예시 직원 목록 -->
										                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400007">202400007</li>
										                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400008">202400008 / 박지민</li>
										                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400009">202400009 / 이영호</li>
										                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400010">202400010 / 김지혜</li>
										                <li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="202400011">202400011 / 홍길동</li>
										            </ul>
										        </div>
										
										        <!-- Modal Footer -->
										        <div class="flex items-center justify-end p-4 mt-auto border-t border-slate-200 dark:border-zink-500">
										            <button id="closeModal" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
										                닫기
										                <i class="align-baseline ltr:pl-1 rtl:pr-1 ri-close-line"></i>
										            </button>
										        </div>
										    </div>
										</div>
										
										<!-- 유형 선택 하기 전 -->
                                        <div id="documentDiv" class="lg:col-span-2 xl:col-span-12" style="display:block;">
                                            <div>
                                                <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
                                                <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="문서 유형을 먼저 선택하세요" rows="10" readonly></textarea>
                                            </div>
                                        </div>
                                        
                                        <!-- 기안 문서 -->
										<div id="draftDiv" class="lg:col-span-2 xl:col-span-12" style="display:none;">
										    <label for="docContent" class="inline-block mb-2 text-base font-medium">기안 내용</label>
										    <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="기안 내용을 입력하세요" rows="10"></textarea>
										</div>
										
										<!-- 휴가 신청서 문서 -->
										<div id="vacationDiv" class="lg:col-span-2 xl:col-span-12" style="display:none;">
											<div class="xl:col-span-6">
												<label for="vacationType" class="font-large">연차</label>
												<input type="radio">
											</div>
											<div class="xl:col-span-6">
											    <label for="docWriter" class="inline-block mb-2 text-base font-medium">휴가 타입</label>
											    <div class="flex items-center space-x-2">
											        <!-- 라디오 버튼 추가 -->
											        <input type="radio" id="docWriterRadio" name="docWriterOption" value="1" class="form-radio text-custom-500"> 연차
											    </div>
											</div><!--end col-->
											
											<div class="xl:col-span-6">
											</div>
											<div class="xl:col-span-12">
											    <label for="docContent" class="inline-block mb-2 text-base font-medium">휴가 사유</label>
											    <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="휴가 사유를 입력하세요" rows="10"></textarea>
											</div>
										</div>
										
										<!-- 자재 신청서 문서 -->
										<div id="materialDiv" class="lg:col-span-2 xl:col-span-12" style="display:none;">
										    <label for="docContent" class="inline-block mb-2 text-base font-medium">자재 신청 사유</label>
										    <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="자재 신청 사유를 입력하세요" rows="10"></textarea>
										</div>
                                        
                                        
                                        
                                        <div class="lg:col-span-2 xl:col-span-12">
                                            <label for="genderSelect" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                            <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dark:bg-zink-700 dark:border-zink-500 dropzone2 dz-clickable">
                                                
                                                <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                    <div class="mb-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200 dark:text-zink-200 dark:fill-zink-500"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                    </div>

                                                    <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product images or <a href="#!">browse</a> your product images</h5>
                                                </div>
                                            </div>

                                            <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                                
                                            </ul>
                                        </div>
                                    </div><!--end grid-->
                                    <div class="flex justify-end gap-2 mt-4">
                                        <button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                        <button type="submit" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
										<button type="button" class="text-white bg-green-500 border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button>

                                    </div>
                                </form>
                            </div>
                        </div><!--end card-->
                    </div>
            <!-- container-fluid -->
        </div>
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
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>

<script>
    // DOM 요소들
    const approverInput = document.getElementById('approverEmpNo');
    const approverModal = document.getElementById('approverModal');
    const closeModalButton = document.getElementById('closeModal');
    const approverList = document.getElementById('approverList');
    
    // 모달 창 열기
    approverInput.addEventListener('click', () => {
        approverModal.classList.remove('hidden');  // 모달을 보이게 함
    });

    // 모달 창 닫기
    closeModalButton.addEventListener('click', () => {
        approverModal.classList.add('hidden');  // 모달을 숨김
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', (event) => {
        if (event.target === approverModal) {
            approverModal.classList.add('hidden');  // 모달을 숨김
        }
    });

    // 모달에서 직원 선택 시 입력 필드에 값 채우기
    approverList.addEventListener('click', (event) => {
        // 리스트 항목 클릭 시
        if (event.target && event.target.classList.contains('approver-item')) {
            const selectedEmpNo = event.target.getAttribute('data-emp-no');
            const selectedEmpName = event.target.textContent;

            // 수신자 입력 필드에 직원 이름을 입력하고, empNo 값도 사용할 수 있도록 숨겨둠
            approverInput.value = selectedEmpName;  // 직원 이름 입력 필드에 넣기
            approverInput.setAttribute('data-emp-no', selectedEmpNo);  // 숨겨진 값으로 empNo 저장

            approverModal.classList.add('hidden');  // 모달 닫기
        }
    });
    
    
 	// <select> 요소
    const docTypeSelect = document.getElementById('docType');

    // 문서 작성 텍스트를 변경할 <h6> 요소
    const documentTitle = document.querySelector('h6.mb-5.text-15');

    // 각 문서 유형에 해당하는 div들
    const documentDiv = document.getElementById('documentDiv');
    const draftDiv = document.getElementById('draftDiv');
    const vacationDiv = document.getElementById('vacationDiv');
    const materialDiv = document.getElementById('materialDiv');

    // <select>의 변화에 따라 div를 숨기거나 보이게 하기
    docTypeSelect.addEventListener('change', function() {
        const selectedValue = docTypeSelect.value;
        
        // 모든 div 숨기기
        documentDiv.style.display = 'none';
        draftDiv.style.display = 'none';
        vacationDiv.style.display = 'none';
        materialDiv.style.display = 'none';
        
        // 선택된 문서 유형에 맞는 div만 보이기
        if (selectedValue === '') {
            documentDiv.style.display = 'block';  // 기본 문서 내용 보이기
            documentTitle.textContent = '문서 작성';  // 기본 문서 제목
        } else if (selectedValue === 'V') {
            vacationDiv.style.display = 'block';  // 휴가 신청서 보이기
            documentTitle.textContent = '휴가 신청서 작성';  // 휴가 신청서 제목
        } else if (selectedValue === 'M') {
            materialDiv.style.display = 'block';  // 자재 신청서 보이기
            documentTitle.textContent = '자재 신청서 작성';  // 자재 신청서 제목
        } else if (selectedValue === 'D') {
            draftDiv.style.display = 'block';  // 기안 문서 보이기
            documentTitle.textContent = '기안 문서 작성';  // 기안 문서 제목
        }
    });


</script>


</body>

</html>