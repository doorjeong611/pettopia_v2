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
									
									<!-- 문서 작성 -->
									<div id="documentDiv" class="lg:col-span-2 xl:col-span-12" style="display:block;">
	                                    <div>
	                                        <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
	                                        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="문서 유형을 먼저 선택하세요" rows="10" readonly></textarea>
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
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <button type="button" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button>
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
									
									
									        
							        <!-- 문서 작성 -->
									<div id="documentDiv" class="lg:col-span-2 xl:col-span-12" style="display:block;">
	                                    <div>
	                                        <label for="docContent" class="inline-block mb-2 text-base font-medium">문서 내용</label>
	                                        <textarea name="docContent" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" id="docContent" placeholder="기안 내용을 입력하세요" rows="10"></textarea>
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
                                    <button type="submit" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 작성</button>
								    <button type="button" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button>
                            	</div>
                       	    </form>
                        </div>
                   </div>
	           </div>
	           
	           <!-- Vacation 문서 -->
	           <div id="V" class="vacation-form">
	               <!-- 연차 신청서 관련 필드 추가 -->
	               <div class="card">
                   		<div class="card-body">
                       		<form id="formAddDocument" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/document/addDocument">
                           		<div class="grid grid-cols-1 gap-4 lg:grid-cols-1 xl:grid-cols-12">
                           			<div class="xl:col-span-2">
                                   		<label for="docType" class="inline-block mb-2 text-base font-medium">문서 유형</label>
                                   		<select id="docType" name="docType" class="form-select border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 dark:text-zink-100 placeholder:text-slate-400 dark:placeholder:text-zink-200">
			                            	<option value="F">유형을 선택하세요</option>
			                            	<option value="D">* 기안서</option>
		                            		<option value="V" selected>* 연차 신청서</option>
			                            	<option value="M">* 비품 구매 신청서</option>
			                            	<option value="R">* 사직서</option>
	                                	</select>
                              		</div>
                              		연차 신청서
                            	</div>
                       	    </form>
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
                              		비품구매서
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
                              		사직서
                            	</div>
                       	    </form>
                        </div>
                   </div>
	            </div>
            <!-- container-fluid -->
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

<div class="fixed inset-0 bg-slate-900/40 dark:bg-zink-800/70 z-[1049] backdrop-overlay hidden" id="backDropDiv"></div>
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/form-file-upload.init.js"></script>
<input type="file" multiple="multiple" class="dz-hidden-input" tabindex="-1" style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">



<script>
$(document).ready(function() {
    // 페이지 로드 시 폼 내용들을 저장
    const documentTitle = $('h5.text-16');
    
    // 각 폼의 HTML 내용 저장
    var defualtFormHTML = $('#F').html();  // 기본 양식 HTML 추출
    var draftFormHTML = $('#D').html();    // 기안서 HTML 추출
    var vacationFormHTML = $('#V').html(); // 연차 신청서 HTML 추출
    var materialFormHTML = $('#M').html(); // 비품 구매 신청서 HTML 추출
    var resignationFormHTML = $('#R').html(); // 사직서 HTML 추출

    // 페이지 로드 시, 모든 div 제거하고 기본 양식만 띄움
    $('#F, #D, #V, #M ,#R').remove();  // #D div를 완전히 삭제
    $('#containerForm').append(defualtFormHTML);
    
    // 첫 번째 select 값 변경 시 div 요소를 append하고 나머지 div는 삭제
    $(document).on('change', '#docType', function() {
        // 선택된 value 값
        var selectedValue = $(this).val();
        
        var selectedDocType = $('#selectedDocType').val(selectedValue);

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
        } else if (selectedValue === "M") {
            console.log("Appending material form HTML...");
            documentTitle.text('비품 구매서 작성');
            $('#containerForm').append(materialFormHTML); // 비품 구매 신청서
        } else if (selectedValue === "R") {
            console.log("Appending resignation form HTML...");
            documentTitle.text('사직서 작성');
            $('#containerForm').append(resignationFormHTML); // 사직서
        }
        
        /// 모달창 관리
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
	    
	  	/// 모달창 관리
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

</body>

</html>