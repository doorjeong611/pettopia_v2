<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>document Form</title>
</head>
<body>

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

</body>
</html>