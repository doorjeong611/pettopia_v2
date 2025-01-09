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
    
    <script>
	 	// 오늘 날짜 구하기
	    const today = new Date();
	
	    // 날짜를 'yyyy-mm-dd' 형식으로 포맷 (예: 2024-01-08)
	    const formattedDate = today.toISOString().split('T')[0];
	
	    // 'vacationStartDate' 요소 선택
	    const vacationStartDateElement = document.querySelector('#vacationStartDate');
	
	    // data-default-date 속성에 오늘 날짜를 설정
	    if (vacationStartDateElement) {
	        vacationStartDateElement.setAttribute('data-default-date', formattedDate);
	    }
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
                <div class="xl:col-span-9">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="mb-5 text-15">문서 작성</h6>
                                
                                <form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                                    <div class="grid grid-cols-1 gap-5 lg:grid-cols-2 xl:grid-cols-12">
                                    	<div class="xl:col-span-2">
                                    		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                    		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                                    <option value="">유형을 선택하세요</option>
			                                    <option value="D">기안 문서</option>
			                                	<option value="V">휴가 신청서</option>
			                                	<option value="M">자재 신청서</option>
		                                	</select>
                                		</div>
                                    	<div class="xl:col-span-8">
                                            <label for="docTitle" class="inline-block mb-2 text-base font-medium">문서 제목</label>
                                            <input type="text" id="docTitle" name="docTitle" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="문서 제목을 입력하세요" required="">
                                        </div><!--end col-->
                                        
                                        <div class="xl:col-span-2">
                                        	<label for="docWriterNo" class="inline-block mb-2 text-base font-medium">부서</label>
                                            <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="${empDept.deptName}" disabled required>
                                        </div>
                                        
                                        
                                        <div class="xl:col-span-4">
                                            <label for="docWriterNo" class="inline-block mb-2 text-base font-medium">문서 작성자</label>
                                            <input type="hidden" name="docWriterNo" id="docWriterNo" value="${loginEmp.empNo}">
                                            <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="${loginEmp.empNo} / ${loginEmp.empName}" disabled required>
                                        </div><!--end col-->
                                        
                                        <!-- 모달 -->
                                        <div class="xl:col-span-4">
										    <label for="approverEmpNo" class="inline-block mb-2 text-base font-medium">결재 수신자</label>
										    <input type="text" name="approverEmpNo" id="approverEmpNo" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="수신 받을 직원을 선택하세요" readonly required>
										</div>
                                        
                                        <div class="xl:col-span-4"></div>
                                        
                                        <div id="approverModal" modal-center="" class="fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
										    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
										        <!-- Modal Header -->
										        <div class="flex items-center justify-start p-4 bg-slate-100 border-b">
												    <h5 class="text-16">결재 수신자 목록</h5>
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
											<div class="xl:col-span-12 mb-3 flex flex-wrap gap-4">
											    <div class="xl:col-span-6 flex flex-col">
											        <label for="vacationType" class="inline-block mb-2 text-base font-medium">휴가 타입 선택</label>
											        <div class="flex gap-4">
											            <div class="flex items-center gap-2">
											                <input id="vacationTypeAL" name="vacationType" class="border rounded-full appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 dark:bg-zink-600 dark:border-zink-500 checked:bg-custom-500 checked:border-custom-500" type="radio" value="AL">
											                <label for="vacationTypeAL" class="align-middle">연차</label>
											            </div>
											            <div class="flex items-center gap-2">
											                <input id="vacationTypeHLa" name="vacationType" class="border rounded-full appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 dark:bg-zink-600 dark:border-zink-500 checked:bg-green-500 checked:border-green-500" type="radio" value="HLa">
											                <label for="vacationTypeHLa" class="align-middle">반차(오전)</label>
											            </div>
											            <div class="flex items-center gap-2">
											                <input id="vacationTypeHLp" name="vacationType" class="border rounded-full appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 dark:bg-zink-600 dark:border-zink-500 checked:bg-green-500 checked:border-green-500" type="radio" value="HLp">
											                <label for="vacationTypeHLp" class="align-middle">반차(오후)</label>
											            </div>
											        </div>
											    </div>
											    
											    <!-- 연차 기간 -->
											    <div id="ALDivStart" class="xl:col-span-6 flex flex-col" style="display:none;">
											        <label for="vacationStartDate" class="inline-block mb-2 text-base font-medium">연차 시작 날짜 선택</label>
						                            <input type="text" name="vacationStartDate" id="vacationStartDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" readonly="readonly" placeholder="날짜를 선택하세요">
											    </div>
												
											    <div id="ALDivEnd" class="xl:col-span-6 flex flex-col" style="display:none;">
											        <label for="vacationEndDate" class="inline-block mb-2 text-base font-medium">연차 종료 날짜 선택</label>
						                            <input type="text" name="vacationEndDate" id="vacationEndDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" readonly="readonly" placeholder="날짜를 선택하세요">
											    </div>
											    
											    <!-- 반차 날짜 선택 -->
											    <div id="HLDivStart" class="xl:col-span-6 flex flex-col" style="display:none;">
											        <label for="publishDateTimeStart" class="inline-block mb-2 text-base font-medium">반차 날짜 선택</label>
						                            <input type="text" name="vacationStartDate" id="vacationStartDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" readonly="readonly" placeholder="날짜를 선택하세요">
											    </div>
											</div>
											
											<div class="xl:col-span-12">
											    <label for="docContent" class="inline-block mb-2 text-base font-medium">휴가 사유</label>
											    <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="휴가 사유를 입력하세요" rows="10"></textarea>
											</div>
										</div>
										
										<!-- 자재 신청서 문서 -->
										<div id="materialDiv" class="lg:col-span-2 xl:col-span-12" style="display:none;">
										    <div class="grid grid-cols-12 gap-4 mb-3">
										        <!-- 신청 물품 -->
										        <div class="xl:col-span-8 col-span-12">
										            <label for="materialList" class="inline-block mb-2 text-base font-medium">신청 물품</label>
										            <input type="text" id="materialList" name="materialList" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="신청 물품을 입력하세요" required="">
										        </div><!--end 신청 물품-->
										        
										        <!-- 수량 -->
										        <div class="xl:col-span-2 col-span-12">
										            <label for="materialQuantity" class="inline-block mb-2 text-base font-medium">수량</label>
										            <input type="number" id="materialQuantity" name="materialQuantity" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="수량을 입력하세요" min="0" max="9999" required="">
										        </div><!--end 수량-->
										        
										        <div class="xl:col-span-2 col-span-12"></div><!--end 빈 공간-->
										    </div><!--end grid-->
										
										    <!-- 자재 신청 사유 -->
										    <div class="xl:col-span-12">
										        <label for="docContent" class="inline-block mb-2 text-base font-medium">자재 신청 사유</label>
										        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="자재 신청 사유를 입력하세요" rows="10"></textarea>
										    </div>
										</div>

                                        <div class="lg:col-span-2 xl:col-span-12">
                                            <label for="genderSelect" class="inline-block mb-2 text-base font-medium">Product Images</label>
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
                                        <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
										<button type="button" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button>
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
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>
<div class="fixed inset-0 bg-slate-900/40 dark:bg-zink-800/70 z-[1049] backdrop-overlay hidden" id="backDropDiv"></div>
<!--apexchart js-->
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<input type="file" multiple="multiple" class="dz-hidden-input" tabindex="-1" style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">


<script>

    
    
 	// <select> 요소
    const docTypeSelect = $('#docType');
 	// <radio> 요소
    const vacationTypeRadio = $('input[name="vacationType"]');

    // 문서 작성 텍스트를 변경할 <h6> 요소
    const documentTitle = $('h6.mb-5.text-15');

    // 각 문서 유형에 해당하는 div들
    const documentDiv = $('#documentDiv');
    const draftDiv = $('#draftDiv');
    const vacationDiv = $('#vacationDiv');
    const materialDiv = $('#materialDiv');
    const ALDivStart = $('#ALDivStart');
    const ALDivEnd = $('#ALDivEnd');
    const HLDivStart = $('#HLDivStart');
    const HLDivEnd = $('#HLDivEnd');

    // 각 div의 부모와 형제 요소를 기억
    const alStartParent = ALDivStart.parent();
    const alEndParent = ALDivEnd.parent();
    const hlStartParent = HLDivStart.parent();
    const documentParent = documentDiv.parent();
    const draftParent = draftDiv.parent();
    const vacationParent = vacationDiv.parent();
    const materialParent = materialDiv.parent();

    const alStartNext = ALDivStart.next();
    const alEndNext = ALDivEnd.next();
    const hlStartNext = HLDivStart.next();
    const documentNext = documentDiv.next();
    const draftNext = draftDiv.next();
    const vacationNext = vacationDiv.next();
    const materialNext = materialDiv.next();

    // <select>의 변화에 따라 div를 숨기거나 보이게 하기
    $('#docType').on('change', function() {
        const selectedValue = $(this).val();
        
        // 모든 div 제거
        documentDiv.parent().remove();
        draftDiv.parent().remove();
        vacationDiv.parent().remove();
        materialDiv.parent().remove();

        function resetVacationRadioButtons() {
            $('#vacationTypeAL').prop('checked', false);  // 연차 버튼 초기화
            $('#vacationTypeHLa').prop('checked', false);  // 반차(오전) 버튼 초기화
            $('#vacationTypeHLp').prop('checked', false);  // 반차(오후) 버튼 초기화
        }

        function removeDivs() {
            ALDivStart.parent().remove();
            ALDivEnd.parent().remove();
            HLDivStart.parent().remove();
        }
        
        // 선택된 문서 유형에 맞는 div만 보이기
        if (selectedValue === '') {
            $('body').append(documentDiv);
            documentDiv.show();  // 기본 문서 내용 보이기
            documentTitle.text('문서 작성');  // 기본 문서 제목
            removeDivs();
            resetVacationRadioButtons();  // 연차 버튼 초기화
        } else if (selectedValue === 'V') {
            $('body').append(vacationDiv);
            vacationDiv.show();  // 휴가 신청서 보이기
            documentTitle.text('휴가 신청서 작성');  // 휴가 신청서 제목
            removeDivs();
        } else if (selectedValue === 'M') {
            $('body').append(materialDiv);
            materialDiv.show();  // 자재 신청서 보이기
            documentTitle.text('자재 신청서 작성');  // 자재 신청서 제목
            removeDivs();
            resetVacationRadioButtons();  // 연차 버튼 초기화
        } else if (selectedValue === 'D') {
            $('body').append(draftDiv);
            draftDiv.show();  // 기안 문서 보이기
            documentTitle.text('기안 문서 작성');  // 기안 문서 제목
            removeDivs();
            resetVacationRadioButtons();  // 연차 버튼 초기화
        }
    });

    // 라디오 버튼에 'change' 이벤트 추가
    vacationTypeRadio.on('change', function() {
        const radioValue = $(this).val();  // 선택된 radio 버튼의 value 가져오기

        // vacationDiv가 숨겨져 있다면 보이게 하기
        vacationDiv.show();  // vacationDiv는 보이게 설정

        // 선택된 문서 유형에 맞는 div만 보이게 하기
        if (radioValue === 'AL') {
            // 연차 관련 div 추가
            ALDivStart.parent().remove();
            ALDivEnd.parent().remove();
            HLDivStart.parent().remove();
            vacationDiv.append(ALDivStart);
            vacationDiv.append(ALDivEnd);
            // 삭제된 요소를 원래 위치에 복원
            alStartParent.prepend(ALDivStart);
            alEndParent.prepend(ALDivEnd);
            ALDivStart.show();
            ALDivEnd.show();
        } else if (radioValue === 'HLa' || radioValue === 'HLp') {
            // 반차 관련 div 추가
            ALDivStart.parent().remove();
            ALDivEnd.parent().remove();
            HLDivStart.parent().remove();
            vacationDiv.append(HLDivStart);
            // 삭제된 요소를 원래 위치에 복원
            hlStartParent.prepend(HLDivStart);
            HLDivStart.show();
        }
    });
 	



</script>

</body>

</html>