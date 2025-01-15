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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
    
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
                            <a href="${pageContext.request.contextPath}/document/documentList" class="text-slate-400 dark:text-zink-200">결재 문서</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            문서 작성
                    	</li>
                    </ul>
                </div>
                
                <div id="containerForm">
				    <!-- 폼들이 동적으로 append 될 곳 -->
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
			                            	<option value="F" selected>유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V">* 연차 신청서</option>
			                            	<option value="M">* 비품 구매 신청서</option>
			                            	<option value="R">* 사직서</option>
	                                	</select>
                             		</div>
                              			
                                    <!-- 문서 유형에 맞는 폼 -->
									<div class="xl:col-span-7">
                                    	<label for="docTitle" class="inline-block mb-2 text-base font-medium">문서 제목</label>
                                        <input type="text" id="docTitle" name="docTitle" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" placeholder="문서 유형을 먼저 선택하세요" readonly required="">
	                                </div><!--end col-->
	                                
	                                <div class="xl:col-span-3"></div>
                                    
                                    <div class="xl:col-span-4">
                                        <label for="docWriterNo" class="inline-block mb-2 text-base font-medium">작성자</label>
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empNo} / ${empName}" disabled required>
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
									    <input type="text" id="initApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="initApproverNo" id="initApproverNo" value="">
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" id="midApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="midApproverNo" id="midApproverNo" value="">
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium"> 최종 결재자</label>
									    <input type="text" id="finalApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="finalApproverNo" id="finalApproverNo" value="">
									</div>
									
									<!-- 결재 수신자 목록 모달 -->
									<div id="approverModal" modal-center="" class="defaultModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
									    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md flex flex-col h-full">
									        <!-- Modal Header -->
									        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
									            <h5 class="text-16 mr-auto">결재 수신자 목록</h5> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
									            <button id="closeModalHeader" type="button" class="text-gray-500 hover:text-gray-700">
									                <i class="ri-close-line text-2xl"></i>
									            </button>
									        </div>
									        
									        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
											    <h5 class="mb-3 text-16">부서 조회</h5>
											    
											    <!-- Flexbox로 나란히 배치 -->
											    <div class="flex space-x-4"> <!-- space-x-4는 항목 간에 여백을 추가 -->
											        <!-- Division Select -->
											        <select id="division" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500" style="margin-right: 15px;">
											            <option value="">부서 선택</option>
											        </select>
											        
											        <!-- Dept Select -->
											        <select id="dept" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500">
											            <option value="">팀 선택</option>
											        </select>
											    </div>
											    
											    <br><hr>
											</div>
									        
									         
									        <!-- Modal Content -->
									        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 pt-1 overflow-y-auto" style="max-height: 400px;">
									            <h5 class="mb-3 text-16">직원 검색</h5>
									            <div class="flex items-center mb-4">
												    <input type="text" id="approverSearch" value="" class="form-input mr-2" style="width: 26rem;" placeholder="직원 검색">
												    <button id="searchButton" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
												        검색
												    </button>
												</div>
									            <hr>
									            <ul id="approverList" class="mt-2 max-h-[300px] overflow-y-auto">
												    <!-- 예시 직원 목록 -->
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
									
									<!-- 문서 작성 -->
									<div id="documentDiv" class="lg:col-span-2 xl:col-span-12" style="display:block;">
	                                    <div>
	                                        <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
	                                        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="문서 유형을 먼저 선택하세요" rows="10" readonly></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 문서 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docRemarks" class="inline-block mb-2 text-base font-medium">비고</label>
	                                        <textarea name="docRemarks" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docRemarks" placeholder="비고" rows="3"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 파일 다운로드 -->
                                    <div class="lg:col-span-2 xl:col-span-12">
                                            <label for="fileUpload" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                            <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dropzone2 dz-clickable">
                                                
                                                <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                    <div class="mb-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                    </div>

                                                    <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product file</h5>
                                                </div>
                                            </div>

                                            <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                                
                                            </ul>
                                      </div>
                           		</div>
                                <div class="flex justify-end gap-2 mt-4">
                                	<button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                    <button type="button" class="bg-white text-sky-500 btn border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100">임시 저장</button>
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
                            	</div>
                           	</form>
                   		</div>
               	    </div><!--end card-->
	           </div>
			   
			   <!-- Draft 문서 -->
	           <div id="D" class="draft-form">
	               <!-- 기안서 관련 필드 추가 -->
	               <div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="F">유형을 선택하세요</option>
			                            	<option value="D" selected>* 기안서</option>
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
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empNo} / ${empName}" disabled required="">
                                    </div><!--end col-->
	                                        
                                    <div class="xl:col-span-2">
                                    	<label for="docWriterNo" class="inline-block mb-2 text-base font-medium">부서</label>
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empDept.deptName}" disabled required="">
                                    </div>
                                    
                                    <div class="xl:col-span-2">
									    <label for="writingDate" class="inline-block mb-2 text-base font-medium">작성일</label>
									    <input type="text" id="writingDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="" disabled required="">
									</div>
									
                                    <div class="xl:col-span-4"></div>
									
									<!-- 초기 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="initApproverNo" class="inline-block mb-2 text-base font-medium">초기 결재자</label>
									    <input type="text" id="initApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required="">
										<input type="hidden" name="initApproverNo" id="initApproverNo" value="" required="">
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" id="midApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required="">
										<input type="hidden" name="midApproverNo" id="midApproverNo" value="" required="">
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium"> 최종 결재자</label>
									    <input type="text" id="finalApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required="">
										<input type="hidden" name="finalApproverNo" id="finalApproverNo" value="" required="">
									</div>
									        
							        <!-- 문서 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
	                                        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="기안 내용을 입력하세요" rows="10" required=""></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 문서 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docRemarks" class="inline-block mb-2 text-base font-medium">비고</label>
	                                        <textarea name="docRemarks" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docRemarks" placeholder="비고" rows="3"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 파일 다운로드 -->
                                    <div class="lg:col-span-2 xl:col-span-12">
                                            <label for="fileUpload" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                            <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dropzone2 dz-clickable">
                                                
                                                <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                    <div class="mb-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                    </div>

                                                    <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product file</h5>
                                                </div>
                                            </div>

                                            <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                                
                                            </ul>
                                      </div>
                           		</div>
                                <div class="flex justify-end gap-2 mt-4">
                                	<button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                    <button type="button" class="bg-white text-sky-500 btn border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100">임시 저장</button>
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
                            	</div>
                       	    </form>
                        </div>
                   </div>
	           </div>
	           
	           <!-- Vacation 문서 -->
	           <div id="V" class="vacation-form">
	               <!-- 연차 신청서 관련 필드 추가 -->
	               <div class="card">
                   		<div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="F">유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V"selected>* 연차 신청서</option>
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
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empNo} / ${empName}" disabled required>
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
									    <input type="text" id="initApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="initApproverNo" id="initApproverNo" value="">
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" id="midApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="midApproverNo" id="midApproverNo" value="">
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium"> 최종 결재자</label>
									    <input type="text" id="finalApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="finalApproverNo" id="finalApproverNo" value="">
									</div>
									
									<!-- 대체 근무자 모달 -->
									<div class="xl:col-span-3">
										<label for="vacationBackup" class="inline-block mb-2 text-base font-medium"> 대체 근무자</label>
									    <input type="text" id="vacationBackupId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="대체 근무 직원을 선택하세요" readonly required>
										<input type="hidden" name="vacationBackup" id="vacationBackup" value="">
									</div>
									
									<div class="xl:col-span-1"></div>
									
									<div class="xl:col-span-3 radioDiv">
								    	<label for="vacationType" class="inline-block mb-4 text-base font-medium">휴가 타입 선택</label>
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
							        <div id="ALDivStart">
									    <div class="ALDiv xl:col-span-2 flex flex-col">
									        <label for="startDate" class="inline-block mb-2 text-base font-medium">연차 시작 날짜 선택</label>
				                            <input type="text" name="startDate" id="alStartDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" data-default-date="16 Oct, 2023" readonly="readonly" placeholder="날짜를 선택하세요">
									    </div>
								    </div>
								    
									<div id="ALDivEnd">
									    <div class="ALDiv xl:col-span-2 flex flex-col">
									        <label for="endDate" class="inline-block mb-2 text-base font-medium">연차 종료 날짜 선택</label>
				                            <input type="text" name="endDate" id="alEndDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" data-default-date="16 Oct, 2023" readonly="readonly" placeholder="날짜를 선택하세요">
									    </div>
									</div>

									
									<!-- 반차 날짜 선택 -->
									<div id="HLDivStart">
									    <div class="HLDiv xl:col-span-2 flex flex-col">
									        <label for="startDate" class="inline-block mb-2 text-base font-medium">반차 날짜 선택</label>
				                            <input type="text" name="startDate" id="hlStartDate" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 flatpickr-input" data-provider="flatpickr" data-date-format="Y-m-d" data-default-date="16 Oct, 2023" readonly="readonly" placeholder="날짜를 선택하세요">
									    </div>
								    </div>

									        
							        <!-- 문서 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
	                                        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="휴가 사유를 입력하세요" rows="10"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 비고 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docRemarks" class="inline-block mb-2 text-base font-medium">비고</label>
	                                        <textarea name="docRemarks" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docRemarks" placeholder="비고" rows="3"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 파일 다운로드 -->
                                    <div class="lg:col-span-2 xl:col-span-12">
                                            <label for="fileUpload" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                            <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dropzone2 dz-clickable">
                                                
                                                <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                    <div class="mb-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                    </div>

                                                    <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product file</h5>
                                                </div>
                                            </div>

                                            <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                                
                                            </ul>
                                      </div>
                           		</div>
                                <div class="flex justify-end gap-2 mt-4">
                                	<button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                    <button type="button" class="bg-white text-sky-500 btn border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100">임시 저장</button>
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
                            	</div>
                       	    </form>
                        </div>
                   </div>
                   </div>
	           </div>
	           
	           <!-- Material 문서 -->
	           <div id="M" class="material-form">
	               <!-- 비품 구매 신청서 관련 필드 추가 -->
	               <div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="F">유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V">* 연차 신청서</option>
			                            	<option value="M" selected>* 비품 구매 신청서</option>
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
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empNo} / ${empName}" disabled required>
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
									    <input type="text" id="initApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="initApproverNo" id="initApproverNo" value="">
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" id="midApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="midApproverNo" id="midApproverNo" value="">
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium"> 최종 결재자</label>
									    <input type="text" id="finalApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="finalApproverNo" id="finalApproverNo" value="">
									</div>
									
                           			<!-- 자재 신청서 문서 -->
									<div id="materialDiv" class="lg:col-span-2 xl:col-span-12">
										<div class="grid grid-cols-12 gap-4 mb-3">
									        <!-- 신청 물품 -->
									        <div class="xl:col-span-8 col-span-12">
									            <label for="docPurpose" class="inline-block mb-2 text-base font-medium">비품 용도</label>
									            <input type="text" id="docPurpose" name="docPurpose" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="사용 목적을 입력하세요" required="">
									        </div><!--end 신청 물품-->
									        
									        <div class="xl:col-span-4 col-span-12"></div><!--end 빈 공간-->
									        
									    </div><!--end grid-->
										
									    <div class="grid grid-cols-12 gap-4 mb-3">
									        <!-- 신청 물품 -->
									        <div class="xl:col-span-6 col-span-12">
									            <label for="materialName" class="inline-block mb-2 text-base font-medium">비품 품목</label>
									            <input type="text" id="materialName" name="materialName" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="신청 물품을 입력하세요" required="">
									        </div><!--end 신청 물품-->
									        
									        <!-- 가격 -->
									        <div class="xl:col-span-2 col-span-12">
									            <label for="docPrice" class="inline-block mb-2 text-base font-medium">단가</label>
									            <input type="number" id="docPrice" name="docPrice" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="가격을 입력하세요" min="0" required="">
									        </div><!--end 가격-->
									        
									        <!-- 수량 -->
									        <div class="xl:col-span-2 col-span-12">
									            <label for="materialQuantity" class="inline-block mb-2 text-base font-medium">수량</label>
									            <input type="number" id="materialQuantity" name="materialQuantity" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="수량을 입력하세요" min="0" max="9999" required="">
									        </div><!--end 수량-->
									    </div><!--end grid-->
									
									    <!-- 자재 신청 사유 -->
									    <div class="xl:col-span-12">
									        <label for="docContent" class="inline-block mb-2 text-base font-medium">자재 신청 사유</label>
									        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="자재 신청 사유를 입력하세요" rows="10"></textarea>
									    </div>
									</div>
									
									<!-- 비고 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docRemarks" class="inline-block mb-2 text-base font-medium">비고</label>
	                                        <textarea name="docRemarks" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docRemarks" placeholder="비고" rows="3"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 파일 다운로드 -->
                                    <div class="lg:col-span-2 xl:col-span-12">
                                           <label for="fileUpload" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                           <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dropzone2 dz-clickable">
                                               
                                               <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                   <div class="mb-3">
                                                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                   </div>

                                                   <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product file</h5>
                                               </div>
                                           </div>

                                           <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                               
                                           </ul>
                                     </div>
                           		</div>
                       	    	<div class="flex justify-end gap-2 mt-4">
                                	<button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                    <button type="button" class="bg-white text-sky-500 btn border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100">임시 저장</button>
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
                            	</div>
                       	    </form>
                        </div>
                   </div>
	           </div>
	           
	           <!-- Resignation 문서 -->
	           <div id="R" class="resignation-form">
	                <!-- 사직서 관련 필드 추가 -->
	                <div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="F">유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V">* 연차 신청서</option>
			                            	<option value="M">* 비품 구매 신청서</option>
			                            	<option value="R" selected>* 사직서</option>
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
                                        <input type="hidden" name="docWriterNo" id="docWriterNo" value="${empNo}">
                                        <input type="text" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-200 placeholder:text-slate-400" value="${empNo} / ${empName}" disabled required>
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
									    <input type="text" id="initApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="initApproverNo" id="initApproverNo" value="">
									</div>
									
									<!-- 중간 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="midApproverNo" class="inline-block mb-2 text-base font-medium">중간 결재자</label>
									    <input type="text" id="midApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="midApproverNo" id="midApproverNo" value="">
									</div>
									
									<!-- 최종 결재자 모달 -->
									<div class="xl:col-span-4">
										<label for="finalApproverNo" class="inline-block mb-2 text-base font-medium"> 최종 결재자</label>
									    <input type="text" id="finalApproverId" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" value="" placeholder="수신 받을 직원을 선택하세요" readonly required>
										<input type="hidden" name="finalApproverNo" id="finalApproverNo" value="">
									</div>
									
									<!-- 사직서 문서 -->
									<div id="resignationDiv" class="lg:col-span-2 xl:col-span-12">
										<div class="grid grid-cols-12 gap-4 mb-3">
											<!-- 사직 유형 선택 -->
									        <div class="xl:col-span-3 radioDiv">
										    	<label for="vacationType" class="inline-block mb-4 text-base font-medium">사직 유형 선택</label>
										        <div class="flex gap-4">
										        	<div class="flex items-center gap-2">
										                <input id="resignationTypeV" name="resignationType" class="border rounded-full appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500" type="radio" value="V">
										                <label for="resignationTypeV" class="align-middle">자발적 퇴사</label>
										            </div>
										            <div class="flex items-center gap-2">
										                <input id="resignationTypeT" name="resignationType" class="border rounded-full appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-green-500 checked:border-green-500" type="radio" value="T">
										                <label for="resignationTypeT" class="align-middle">정리 해고</label>
										            </div>
										        </div>
										    </div>
									        <div class="xl:col-span-4 col-span-12"></div><!--end 빈 공간-->
									        
									    </div><!--end grid-->
										
									
									    <!-- 사직 사유 -->
									    <div class="xl:col-span-12">
									        <label for="docContent" class="inline-block mb-2 text-base font-medium">사직 사유</label>
									        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="사직 사유를 입력하세요" rows="10"></textarea>
									    </div>
									</div>
									
									<!-- 비고 작성 -->
									<div class="lg:col-span-2 xl:col-span-12">
	                                    <div>
	                                        <label for="docRemarks" class="inline-block mb-2 text-base font-medium">비고</label>
	                                        <textarea name="docRemarks" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docRemarks" placeholder="비고" rows="3"></textarea>
	                                    </div>
                                    </div>
                                    
                                    <!-- 파일 다운로드 -->
                                    <div class="lg:col-span-2 xl:col-span-12">
                                           <label for="fileUpload" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
                                           <div class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dropzone2 dz-clickable">
                                               
                                               <div class="w-full py-5 text-lg text-center dz-message needsclick">
                                                   <div class="mb-3">
                                                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m16 16-4-4-4 4"></path></svg>
                                                   </div>

                                                   <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">Drag and drop your product file</h5>
                                               </div>
                                           </div>

                                           <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2">
                                               
                                           </ul>
                                     </div>
                            	</div>
                            	<div class="flex justify-end gap-2 mt-4">
                                	<button type="reset" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">리셋</button>
                                    <button type="button" class="bg-white text-sky-500 btn border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100">임시 저장</button>
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
                            	</div>
                       	    </form>
                        </div>
                   </div>
	            </div>
            	<!-- container-fluid -->
	            <!-- 결재 수신자 목록 모달 -->
				<div id="approverModal" modal-center="" class="approvalModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
				    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md flex flex-col h-full">
				        <!-- Modal Header -->
				        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
				            <h4 class="text-16 mr-auto">결재 수신자 목록</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
				            <button id="closeModalHeader" type="button" class="text-gray-500 hover:text-gray-700">
				                <i class="ri-close-line text-2xl"></i>
				            </button>
				        </div>
				        
				        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
						    <h4 class="mb-3 text-16">부서 조회</h4>
						    
						    <!-- Flexbox로 나란히 배치 -->
						    <div class="flex space-x-4"> <!-- space-x-4는 항목 간에 여백을 추가 -->
						        <!-- Division Select -->
						        <select id="division" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500" style="margin-right: 15px;">
						            <option value="">부서 선택</option>
						        </select>
						        
						        <!-- Dept Select -->
						        <select id="dept" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500">
						            <option value="">팀 선택</option>
						        </select>
						    </div>
						    
						    <br><hr>
						</div>
				        
				         
				        <!-- Modal Content -->
				        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
				            <h4 class="mb-3 text-16">직원 검색</h4>
				            <div class="flex items-center mb-4">
							    <input type="text" id="approverSearch" value="" class="form-input mr-2" style="width: 26rem;" placeholder="직원 검색">
							    <button id="searchButton" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
							        검색
							    </button>
							</div>
				            <hr>
				            <ul id="approverList" class="mt-2 max-h-[300px] overflow-y-auto">
							    <!-- 예시 직원 목록 -->
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
				
				<!-- 대체 근무자 목록 모달 -->
				<div id="vacationModal" modal-center="" class="fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
				    <div class="w-screen lg:w-[55rem] bg-white shadow rounded-md flex flex-col h-full">
				        <!-- Modal Header -->
				        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
				            <h4 class="text-16 mr-auto">대체 근무자 목록</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
				            <button id="closeModalHeader" type="button" class="text-gray-500 hover:text-gray-700">
				                <i class="ri-close-line text-2xl"></i>
				            </button>
				        </div>
				        
				        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
						    <h5 class="mb-3 text-16">부서 조회</h5>
						    
						    <!-- Flexbox로 나란히 배치 -->
						    <div class="flex space-x-4"> <!-- space-x-4는 항목 간에 여백을 추가 -->
						        <!-- Division Select -->
						        <select id="divisionBackup" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500" style="margin-right: 15px;">
						            <option value="">부서 선택</option>
						        </select>
						        
						        <!-- Dept Select -->
						        <select id="deptBackup" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500">
						            <option value="">팀 선택</option>
						        </select>
						    </div>
						    
						    <br><hr>
						</div>
				        
				        <!-- Modal Content -->
				        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
				            <h4 class="mb-3 text-16">직원 검색</h4>
				            <div class="flex items-center mb-4">
							    <input type="text" id="backupSearch" value="" class="form-input mr-2" style="width: 26rem;" placeholder="직원 검색">
							    <button id="searchBackupBtn" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
							        검색
							    </button>
							</div>
							<hr>
				            <ul id="backupList" class="mt-2 max-h-[300px] overflow-y-auto">
							    <!-- 예시 직원 목록 -->
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
		</div>
        <!-- End Page-content -->
		<!-- Start Footer -->
        <footer class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm absolute right-0 bottom-0 px-4 h-14 group-data-[layout=horizontal]:ltr:left-0  group-data-[layout=horizontal]:rtl:right-0 left-0 border-t py-3 flex items-center">
        	<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>    
        </footer>
        <!-- End Footer -->
    </div>
</div>
<!-- ContextPath -->
<div id="contextPath" data-context-path="${pageContext.request.contextPath}"></div>
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
<script src="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
<!--apexchart js-->
<!-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>  -->

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<script>
	$(document).ready(function() {
		
		// 부서 목록을 가져오는 AJAX 요청 (외부 함수로 분리)
        function loadDivisionList() {
			
        	$('#searchButton').on('click', function() {
                var searchEmp = $('#approverSearch').val(); // 검색어 가져오기
                console.log(searchEmp);

                // 부서 목록을 가져오는 AJAX 요청
                $.ajax({
                    method: "get",
                    url: "/pettopia/getEmpSearchByDocument/" + encodeURIComponent(searchEmp), // 쿼리 파라미터로 수정
                }).done(function(result) {
                    $('#division').empty();
                    $('#division').append('<option value="">부서 선택</option>');
                    $('#dept').empty();
        	        $('#dept').append('<option value="">팀 선택</option>');
                    $('#approverList').empty();
                    
                    if (result && result.length > 0) {
                        $(result).each(function(index, item) {
                            $('#approverList').append('<li class="approver-item cursor-pointer p-2 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
                        });
                    } else {
                        $('#approverList').append('<li class="p-2 text-gray-500">검색 결과가 없습니다.</li>'); // 결과가 없을 때 메시지 추가
                    }
                    
                 // 부서 목록을 가져오는 AJAX 요청
                	$.ajax({
                	    method: "get",
                	    url: "/pettopia/divisionListByDocument",
                	}).done(function(result) {
                	    // JQuery foreach 반복문
                		$('#division').empty();
                		$('#division').append('<option value="">부서 선택</option>');
                	    $(result).each(function(index, item) {
                	        $('#division').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>')
                	    });
                	})
                	.fail(function() {
                	    alert('부서 조회 실패');
                	});
                 
                })
                .fail(function() {
                    alert('직원 검색 실패');
                });
            });
			
            $.ajax({
                method: "get",
                url: "/pettopia/divisionListByDocument",
            }).done(function(result) {
                $('#division').empty();
                $('#division').append('<option value="">부서 선택</option>');
                $(result).each(function(index, item) {
                    $('#division').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>');
                });
                
             	// 부서 목록 변경 시, 모달 안의 값도 초기화
                $('#approverList').empty(); // 결재자 목록 초기화
                $('#division').val('');
                $('#dept').val('');
            }).fail(function() {
                alert('부서 조회 실패');
            });
        
	        // division값이 변경되면 팀 목록 갱신
	        $(document).on('change', '#division', function() {
	            $.ajax({
	                method: "get",
	                url: "/pettopia/deptListByDocument/" + $('#division').val(),
	            }).done(function(result) {
	                $('#dept').empty();
	                $('#dept').append('<option value="">팀 선택</option>');
	                $(result).each(function(index, item) {
	                    $('#dept').append('<option value="' + item.deptCode + '">' + item.deptName + '</option>');
	                });
	            }).fail(function() {
	                alert('팀 조회 실패');
	            });
	        });
	        
	        // dept값이 변경되면 직원 목록 갱신
	        $(document).on('change', '#dept', function() {
	            $.ajax({
	                method: "get",
	                url: "/pettopia/empListByDocument/" + $('#dept').val(),
	            }).done(function(result) {
	                $('#approverList').empty();
	                $(result).each(function(index, item) {
	                    $('#approverList').append('<li class="approver-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
	                });
	            }).fail(function() {
	                alert('직원 조회 실패');
	            });
	        });
        
		}
	
	    // 페이지 로드 시 폼 내용들을 저장
	    const documentTitle = $('h5.text-16');
	    const vacationTypeRadio = $('input[name="vacationType"]');
	    const loginEmpNo = $('#docWriterNo').val(); // 현재 로그인한 사원번호
	    console.log('로그인한 사원번호:', loginEmpNo); // 콘솔에 출력
	    
	    // 각 폼의 HTML 내용 저장
	    var defualtFormHTML = $('#F').html();  // 기본 양식 HTML 추출
	    var draftFormHTML = $('#D').html();    // 기안서 HTML 추출
	    var vacationFormHTML = $('#V').html(); // 연차 신청서 HTML 추출
	    var materialFormHTML = $('#M').html(); // 비품 구매 신청서 HTML 추출
	    var resignationFormHTML = $('#R').html(); // 사직서 HTML 추출
	    var ALDivStartHTML = $('#ALDivStart').html(); // 연차 시작 날짜 HTML 추출
	    var ALDivEndHTML = $('#ALDivEnd').html(); // 연차 종료 날짜 HTML 추출
	    var HLDivStartHTML = $('#HLDivStart').html(); // 반차 시작 날짜 HTML 추출
	
	    // 페이지 로드 시, 모든 div 제거하고 기본 양식만 띄움
	    $('#F, #D, #V, #M ,#R').remove();  // #D div를 완전히 삭제
	    $('#containerForm').append(defualtFormHTML);
	    
	    
	    // 첫 번째 select 값 변경 시 div 요소를 append하고 나머지 div는 삭제
	    $(document).on('change', '#docType', function() {
	        // 선택된 value 값
	        var selectedValue = $(this).val();
	        
	        var selectedDocType = $('#selectedDocType').val(selectedValue);
	        
	        $('.approvalModal').addClass('hidden').css('pointer-events', 'none');
	
	        // #containerForm의 내용을 비운 후, 선택된 value에 맞는 div를 append
	        $('#containerForm').children().remove();  // 기존 자식 요소들을 모두 삭제
	        
	        // 선택된 value에 따라 div를 append
	        if (selectedValue === "F") {
	            console.log("Appending default form HTML...");
	            documentTitle.text('문서 작성');
	            $('#containerForm').append(defualtFormHTML); // 기본 양식
	        } else if (selectedValue === "D") {
	            console.log("Appending draft form HTML...");
	            documentTitle.text('기안 문서 작성');
	            $('#containerForm').append(draftFormHTML); // 기안서
	        } else if (selectedValue === "V") {
	            console.log("Appending vacation form HTML...");
	            documentTitle.text('연차 신청서 문서 작성');
	            $('#containerForm').append(vacationFormHTML); // 연차 신청서
	            $('#ALDivStart, #ALDivEnd, #HLDivStart').remove();
	        } else if (selectedValue === "M") {
	            console.log("Appending material form HTML...");
	            documentTitle.text('비품 구매서 작성');
	            $('#containerForm').append(materialFormHTML); // 비품 구매 신청서
	        } else if (selectedValue === "R") {
	            console.log("Appending resignation form HTML...");
	            documentTitle.text('사직서 작성');
	            $('#containerForm').append(resignationFormHTML); // 사직서
	        }
	        
	    	// 문서 유형 변경 후, 부서 목록 다시 요청
            loadDivisionList();
	        
	        $(document).on('change', 'input[name="vacationType"]', function() {
	            let selectedValue = $(this).val(); // selectedValue를 let으로 선언
	            $('#ALDivStart, #ALDivEnd, #HLDivStart').remove();
	            let $radioDiv = $(this).closest('.radioDiv'); // $radioDiv를 let으로 선언
	
	            // 오늘 날짜를 가져오기
	            let today = new Date();
	            let todayFormatted = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
	
	            if (selectedValue === 'AL') {
	                $('.ALDiv, .HLDiv').remove();
	                $radioDiv.after(ALDivEndHTML);
	                $radioDiv.after(ALDivStartHTML);
	
	                // Flatpickr 초기화
	                let alStartPicker = flatpickr("#alStartDate", {
	                    dateFormat: "Y-m-d",
	                    minDate: todayFormatted, // 시작 날짜는 오늘보다 작을 수 없음
	                    onChange: function(selectedDates) {
	                        // 종료 날짜의 최소 날짜를 시작 날짜로 설정
	                        flatpickr("#alEndDate", {
	                            dateFormat: "Y-m-d",
	                            minDate: selectedDates[0] ? selectedDates[0] : todayFormatted, // 시작 날짜가 선택된 경우
	                        });
	                    }
	                });
	
	                flatpickr("#alEndDate", {
	                    dateFormat: "Y-m-d",
	                    minDate: todayFormatted, // 기본적으로 오늘 날짜
	                });
	            } else if (selectedValue === 'HLa' || selectedValue === 'HLp') {
	                $('.ALDiv, .HLDiv').remove();
	                $radioDiv.after(HLDivStartHTML);
	
	                let hlStartPicker = flatpickr("#hlStartDate", {
	                    dateFormat: "Y-m-d",
	                    minDate: todayFormatted, // 시작 날짜는 오늘보다 작을 수 없음
	                });
	            }
	            
	        });
	        
	        // 모달창 관리
	        const $initApproverInput = $('#initApproverId');
	        const $midApproverInput = $('#midApproverId');
	        const $finalApproverInput = $('#finalApproverId');
	        const $vacationBackupInput = $('#vacationBackupId');
	        const $approverModal = $('#approverModal');
	        const $vacationModal = $('#vacationModal');
	        const $closeModalButton = $('#closeModalHeader, #closeModalFooter');
	        const $approverList = $('#approverList');
	        const $backupList = $('#backupList');
	
	        let currentInput = null;
	        
	        function openModal() {
	            if (!$vacationModal.hasClass('hidden')) {
	                // 만약 결재 수신자 목록 모달이 열려 있다면 닫기
	                $vacationModal.addClass('hidden').css('pointer-events', 'none');
	            }
	            // 결재 수신자 목록 모달 열기
	            $approverModal.removeClass('hidden').css('pointer-events', 'auto');
	        }

	        function openVacationModal() {
	            if (!$approverModal.hasClass('hidden')) {
	                // 만약 대체 근무자 목록 모달이 열려 있다면 닫기
	                $approverModal.addClass('hidden').css('pointer-events', 'none');
	            }
	            // 대체 근무자 목록 모달 열기
	            $vacationModal.removeClass('hidden').css('pointer-events', 'auto');
	            
	            $('#searchBackupBtn').on('click', function() {
	                var searchBackup = $('#backupSearch').val(); // 검색어 가져오기
	                console.log(searchBackup);

	                // 부서 목록을 가져오는 AJAX 요청
	                $.ajax({
	                    method: "get",
	                    url: "/pettopia/getEmpSearchByDocument/" + encodeURIComponent(searchBackup), // 쿼리 파라미터로 수정
	                }).done(function(result) {
	                    $('#divisionBackup').empty();
	                    $('#divisionBackup').append('<option value="">부서 선택</option>');
	                    $('#deptBackup').empty();
	        	        $('#deptBackup').append('<option value="">팀 선택</option>');
	                    $('#backupList').empty();
	                    console.log('값 가져옴');
	                    if (result && result.length > 0) {
	                        $(result).each(function(index, item) {
	                            $('#backupList').append('<li class="backup-item cursor-pointer p-2 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
	                        });
	                    } else {
	                        $('#backupList').append('<li class="p-2 text-gray-500">검색 결과가 없습니다.</li>'); // 결과가 없을 때 메시지 추가
	                    }
	                    
	                 // 부서 목록을 가져오는 AJAX 요청
	                	$.ajax({
	                	    method: "get",
	                	    url: "/pettopia/divisionListByDocument",
	                	}).done(function(result) {
	                	    // JQuery foreach 반복문
	                		$('#divisionBackup').empty();
	                		$('#divisionBackup').append('<option value="">부서 선택</option>');
	                	    $(result).each(function(index, item) {
	                	        $('#divisionBackup').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>')
	                	    });
	                	})
	                	.fail(function() {
	                	    alert('부서 조회 실패');
	                	});
	                 
	                })
	                .fail(function() {
	                    alert('직원 검색 실패');
	                });
	            });
				
	            $.ajax({
	                method: "get",
	                url: "/pettopia/divisionListByDocument",
	            }).done(function(result) {
	                $('#divisionBackup').empty();
	                $('#divisionBackup').append('<option value="">부서 선택</option>');
	                $(result).each(function(index, item) {
	                    $('#divisionBackup').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>');
	                });
	                
	             	// 부서 목록 변경 시, 모달 안의 값도 초기화
	                $('#backupList').empty(); // 결재자 목록 초기화
	                $('#divisionBackup').val('');
	                $('#deptBackup').val('');
	                $('#backupSearch').val('');
	            }).fail(function() {
	                alert('부서 조회 실패');
	            });
	            
	         	// division값이 변경되면 팀 목록 갱신
		        $(document).on('change', '#divisionBackup', function() {
		            $.ajax({
		                method: "get",
		                url: "/pettopia/deptListByDocument/" + $('#divisionBackup').val(),
		            }).done(function(result) {
		                $('#deptBackup').empty();
		                $('#deptBackup').append('<option value="">팀 선택</option>');
		                $(result).each(function(index, item) {
		                    $('#deptBackup').append('<option value="' + item.deptCode + '">' + item.deptName + '</option>');
		                });
		            }).fail(function() {
		                alert('팀 조회 실패');
		            });
		        });
		        
		        // dept값이 변경되면 직원 목록 갱신
		        $(document).on('change', '#deptBackup', function() {
		            $.ajax({
		                method: "get",
		                url: "/pettopia/empListByDocument/" + $('#deptBackup').val(),
		            }).done(function(result) {
		                $('#backupList').empty();
		                $(result).each(function(index, item) {
		                    $('#backupList').append('<li class="backup-item cursor-pointer p-3 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
		                });
		            }).fail(function() {
		                alert('직원 조회 실패');
		            });
		        });
	        }
	
	        function closeModal() {
	            $approverModal.addClass('hidden').css('pointer-events', 'none'); // 모달 숨기기
	            currentInput = null; // 모달이 닫힐 때 currentInput 초기화
	        }
	        
	        function closeVacationModal() {
	            $vacationModal.addClass('hidden').css('pointer-events', 'none'); // 모달 숨기기
	            currentInput = null; // 모달이 닫힐 때 currentInput 초기화
	        }
	        
	        if (!$approverModal.hasClass('hidden')) {
	            closeModal();  // 결재자 모달 닫기
	        }

	        if (!$vacationModal.hasClass('hidden')) {
	            closeVacationModal();  // 연차 모달 닫기
	        }
	        
	        $vacationBackupInput.on('click', function() {
	            currentInput = $vacationBackupInput;
	            openVacationModal();
	        });
	
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
	            closeVacationModal();
	        });
	
	        // ESC 키를 눌렀을 때 모달 닫기
	        $(document).on('keydown', function(event) {
	            if (event.key === 'Escape') {
	                closeModal();
	                closeVacationModal();
	            }
	        });
	
	        // 모달에서 직원 선택 시 해당 결재자 입력 필드에 값 채우기
	        $approverList.on('click', '.approver-item', function() {
	            const selectedApproverId = $(this).data('emp-no'); // emp-no 가져오기
	            const selectedApproverText = $(this).text(); // 직원 이름 가져오기
	         	// 문자열을 '/' 기준으로 분리
	        	const parts = selectedApproverText.split(' / ');
	            // 마지막 3개 항목만 가져오기
	            const lastThreeParts = parts.slice(-3).join(' / ');
	            
	            let loginEmpNo = $('#docWriterNo').val(); // 현재 로그인한 사원번호
	            
	         // currentInput이 null이 아닌지 확인
	            if (currentInput !== null) { // null이 아닌 경우에만 아래 코드를 실행
	            	if (selectedApproverId == loginEmpNo) {
		                alert("본인은 결재자로 지정할 수 없습니다.");
		                closeModal();
		                return;
		            }
		            
		         	// 기존 값과 비교하여 유효성 검사
		            if (currentInput.is($midApproverInput) && (lastThreeParts === $initApproverInput.val())) {
		                alert("중간 결재자는 초기 결재자와 달라야 합니다.");
		                closeModal();
		                return;
		            }
		
		            if (currentInput.is($finalApproverInput) && 
		                (lastThreeParts === $initApproverInput.val() || lastThreeParts === $midApproverInput.val())) {
		                alert("최종 결재자는 초기 및 중간 결재자와 달라야 합니다.");
		                closeModal();
		                return;
		            }
		
		            // 히든 입력 필드에 사원번호만 설정
		            if (currentInput.is($initApproverInput)) {
		                $('#initApproverNo').val(selectedApproverId); // 사원번호만 설정
		                console.log('초기 결재자 emp-no:', selectedApproverId);
		            } else if (currentInput.is($midApproverInput)) {
		                $('#midApproverNo').val(selectedApproverId); // 사원번호만 설정
		                console.log('중간 결재자 emp-no:', selectedApproverId);
		            } else if (currentInput.is($finalApproverInput)) {
		                $('#finalApproverNo').val(selectedApproverId); // 사원번호만 설정
		                console.log('최종 결재자 emp-no:', selectedApproverId);
		            }
		
		            // 입력 필드에는 "사원번호 / 이름" 형식으로 설정
		            currentInput.val(lastThreeParts); // 사원번호와 이름 설정
		            console.log('입력 필드 값:', currentInput.val(lastThreeParts));
		
		            closeModal(); // 선택 후 모달 닫기
	            }
	            
	        });
	
	        
	     	// 모달에서 직원 선택 시 해당 결재자 입력 필드에 값 채우기
	        $backupList.on('click', '.backup-item', function() {
	            const selectedBackupId = $(this).data('emp-no');
	            const selectedBackupText = $(this).text();
	            console.log('현재 로그인', loginEmpNo);
	            console.log('대체 근무자', selectedBackupId);
	            
	         // 문자열을 '/' 기준으로 분리
	        	const partsBackup = selectedBackupText.split(' / ');
	            // 마지막 3개 항목만 가져오기
	            const lastThreePartsBackup = partsBackup.slice(-3).join(' / ');
	
	            // currentInput이 null이 아닐 때만 유효성 검사 진행
			    if (currentInput) {
			        if (currentInput.is($vacationBackupInput)) {
			            // 현재 로그인한 사용자가 선택된 경우
			            if (selectedBackupId == loginEmpNo) {
			                alert("본인을 대체 근무자로 선택할 수 없습니다.");
			                closeVacationModal();
			                return; // 선택하지 않고 함수 종료
			            }
			            $('#vacationBackup').val(selectedBackupId); // 사원번호만 설정
			            console.log('대체 근무자 emp-no:', selectedBackupId);
			        }
			        
			        currentInput.val(lastThreePartsBackup); // 사원번호와 이름 설정
			        console.log('입력 필드 값:', currentInput.val(lastThreePartsBackup));
			
			        closeVacationModal(); // 선택 후 모달 닫기
			    }
	        });
	
	        var date = new Date();
	        var year = date.getFullYear();
	        var month = ("0" + (1 + date.getMonth())).slice(-2);
	        var day = ("0" + date.getDate()).slice(-2);
	
	        const formattedDate = year + '-' + month + '-' + day;
	        console.log('Formatted Date:', formattedDate); // debug
	
	        $('#writingDate').val(formattedDate);
	    });
	    
	});

</script>

<script>
	$(function() { // $(document).ready()의 간단한 문법
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	
	    const formattedDate = year + '-' + month + '-' + day;
	    console.log('Formatted Date:', formattedDate); // debug
	
	    $('#writingDate').val(formattedDate);
	    
	  	// 모달창 관리
        const $initApproverInput = $('#initApproverId');
        const $midApproverInput = $('#midApproverId');
        const $finalApproverInput = $('#finalApproverId');
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
            const selectedApproverId = $(this).data('emp-no'); // emp-no 가져오기
            const selectedApproverText = $(this).text(); // 직원 이름 가져오기
         	// 문자열을 '/' 기준으로 분리
        	const parts = selectedApproverText.split(' / ');
            // 마지막 3개 항목만 가져오기
            const lastThreeParts = parts.slice(-3).join(' / ');
            
            let loginEmpNo = $('#docWriterNo').val(); // 현재 로그인한 사원번호
            
            if (selectedApproverId == loginEmpNo) {
                alert("본인은 결재자로 지정할 수 없습니다.");
                closeModal();
                return;
            }
            
         	// 기존 값과 비교하여 유효성 검사
            if (currentInput.is($midApproverInput) && (lastThreeParts === $initApproverInput.val())) {
                alert("중간 결재자는 초기 결재자와 달라야 합니다.");
                closeModal();
                return;
            }

            if (currentInput.is($finalApproverInput) && 
                (lastThreeParts === $initApproverInput.val() || lastThreeParts === $midApproverInput.val())) {
                alert("최종 결재자는 초기 및 중간 결재자와 달라야 합니다.");
                closeModal();
                return;
            }

            // 히든 입력 필드에 사원번호만 설정
            if (currentInput.is($initApproverInput)) {
                $('#initApproverNo').val(selectedApproverId); // 사원번호만 설정
                console.log('초기 결재자 emp-no:', selectedApproverId);
            } else if (currentInput.is($midApproverInput)) {
                $('#midApproverNo').val(selectedApproverId); // 사원번호만 설정
                console.log('중간 결재자 emp-no:', selectedApproverId);
            } else if (currentInput.is($finalApproverInput)) {
                $('#finalApproverNo').val(selectedApproverId); // 사원번호만 설정
                console.log('최종 결재자 emp-no:', selectedApproverId);
            }

            // 입력 필드에는 "사원번호 / 이름" 형식으로 설정
            currentInput.val(lastThreeParts); // 사원번호와 이름 설정
            console.log('입력 필드 값:', currentInput.val(lastThreeParts));

            closeModal(); // 선택 후 모달 닫기
        });

        function openModal() {
            $approverModal.removeClass('hidden').css('pointer-events', 'auto');
        }

        function closeModal() {
            $approverModal.addClass('hidden').css('pointer-events', 'none'); // 모달 숨기기
            currentInput = null; // 모달이 닫힐 때 currentInput 초기화
        }
        
        var contextPath = $('#contextPath').data('context-path');
        
        $('#searchButton').on('click', function() {
            var searchEmp = $('#approverSearch').val(); // 검색어 가져오기
            console.log(searchEmp);

            // 부서 목록을 가져오는 AJAX 요청
            $.ajax({
                method: "get",
                url: contextPath + "/getEmpSearchByDocument/" + encodeURIComponent(searchEmp),
            }).done(function(result) {
                $('#division').empty();
                $('#division').append('<option value="">부서 선택</option>');
                $('#dept').empty();
    	        $('#dept').append('<option value="">팀 선택</option>');
                $('#approverList').empty();
                
                if (result && result.length > 0) {
                    $(result).each(function(index, item) {
                        $('#approverList').append('<li class="approver-item cursor-pointer p-2 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
                    });
                } else {
                    $('#approverList').append('<li class="p-2 text-gray-500">검색 결과가 없습니다.</li>'); // 결과가 없을 때 메시지 추가
                }
                
             // 부서 목록을 가져오는 AJAX 요청
            	$.ajax({
            	    method: "get",
            	    url: contextPath + "/divisionListByDocument",
            	}).done(function(result) {
            	    // JQuery foreach 반복문
            		$('#division').empty();
            		$('#division').append('<option value="">부서 선택</option>');
            	    $(result).each(function(index, item) {
            	        $('#division').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>')
            	    });
            	})
            	.fail(function() {
            	    alert('부서 조회 실패');
            	});
             
            })
            .fail(function() {
                alert('직원 검색 실패');
            });
        });
    	
    	// 부서 목록을 가져오는 AJAX 요청
    	$.ajax({
    	    method: "get",
    	    url: contextPath + "/divisionListByDocument",
    	}).done(function(result) {
    	    // JQuery foreach 반복문
    		$('#division').empty();
    		$('#division').append('<option value="">부서 선택</option>');
    	    $(result).each(function(index, item) {
    	        $('#division').append('<option value="' + item.divisionCode + '">' + item.divisionName + '</option>')
    	    });
    	})
    	.fail(function() {
    	    alert('부서 조회 실패');
    	});
    	
    	// division값이 변경되면 팀 목록 갱신
    	$('#division').change(function() {
    	    console.log('division값이 변경되었습니다: ', $('#division').val());  // 값 확인
    	    $.ajax({
    	        method: "get",
    	        url: contextPath + "/deptListByDocument/" + $('#division').val(),
    	    })
    	    .done(function(result) {
    	        console.log('팀 조회 결과: ', result);  // 응답 확인
    	        $('#dept').empty();
    	        $('#dept').append('<option value="">팀 선택</option>');
    	
    	        $(result).each(function(index, item) {
    	            $('#dept').append('<option value="' + item.deptCode + '">' + item.deptName + '</option>');
    	        });
    	    })
    	    .fail(function() {
    	        alert('팀 조회 실패');
    	    });
    	});
    	
    	// dept값이 변경되면 직원 목록 갱신
    	$('#dept').change(function() {
    	    console.log('dept값이 변경되었습니다: ', $('#dept').val());  // 값 확인
    	    $.ajax({
    	        method: "get",
    	        url: contextPath + "/empListByDocument/" + $('#dept').val(),
    	    })
    	    .done(function(result) {
    	        console.log('직원 조회 결과: ', result);  // 응답 확인
    	        $('#approverList').empty();
    	
    	        $(result).each(function(index, item) {
    	            $('#approverList').append('<li class="approver-item cursor-pointer p-2 hover:bg-gray-100" data-emp-no="' + item.empNo + '">' + item.divisionName + ' / ' + item.deptName + ' / ' + item.rankName + ' / ' + item.empNo + ' / ' + item.empName + '</li>');
    	        });
    	    })
    	    .fail(function() {
    	        alert('직원 조회 실패');
    	    });
    	});
        
	});
</script>


</body>

</html>