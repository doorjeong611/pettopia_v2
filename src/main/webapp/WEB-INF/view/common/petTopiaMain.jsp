<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>PetTopia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- Simplebar CSS -->
	<link href="https://cdn.jsdelivr.net/npm/simplebar@5.0.0/dist/simplebar.min.css" rel="stylesheet" />
	<!-- Simplebar JS -->
	<script src="https://cdn.jsdelivr.net/npm/simplebar@5.0.0/dist/simplebar.min.js"></script>
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    
    <style>
    .last-div-class {
	    border-left: none; /* 선 제거 */
	}
	
	@font-face {
	    font-family: 'PTBandocheB';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
	}
	
	.custom-font {
		font-family: 'PTBandocheB';
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
                <!-- Main content -->
                <div class="grid grid-cols-12 2xl:grid-cols-12 gap-x-5 py-5">
                
                	<!-- 출/퇴근 조회 및 버튼 -->
                	<div class="relative col-span-12 overflow-hidden card 2xl:col-span-4">
					    <div class="relative card-body" style="min-height: 180px;">
					        <div class="grid items-center grid-cols-12">
					            <div class="col-span-12 lg:col-span-12 2xl:col-span-12">
					            	<div class="flex items-center">
					                    <h3 class="card-title text-custom-600 mb-3 custom-font">
					                        <i class="ri-calendar-line"></i> <span>오늘의 근무</span>
					                    </h3>
									</div>
									<p class="mb-4 relative before:absolute before:border-b before:border-slate-200 before:bottom-2 before:right-0 before:left-0"><span class="relative pr-2 bg-white dark:bg-zink-700 dark:text-zink-200 text-slate-500">Welcome PetTopia</span></p>
					                <div class="flex justify-between items-end">
					                    <div>
					                    	<c:if test="${not empty attendanceList}">
					                    		<c:forEach var="attendance" items="${attendanceList}">
						                            <div class="text-slate-900 custom-font" id="attendanceClockInTime" style="font-size: large;">
						                                <c:if test="${attendance.clockInTime != null}">
						                                    <p style="display: flex; align-items: center;">
															    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dog"><path d="M11.25 16.25h1.5L12 17z"/><path d="M16 14v.5"/><path d="M4.42 11.247A13.152 13.152 0 0 0 4 14.556C4 18.728 7.582 21 12 21s8-2.272 8-6.444a11.702 11.702 0 0 0-.493-3.309"/><path d="M8 14v.5"/><path d="M8.5 8.5c-.384 1.05-1.083 2.028-2.344 2.5-1.931.722-3.576-.297-3.656-1-.113-.994 1.177-6.53 4-7 1.923-.321 3.651.845 3.651 2.235A7.497 7.497 0 0 1 14 5.277c0-1.39 1.844-2.598 3.767-2.277 2.823.47 4.113 6.006 4 7-.08.703-1.725 1.722-3.656 1-1.261-.472-1.855-1.45-2.239-2.5"/></svg>
															    <c:set var="clockInTime" value="${attendance.clockInTime}" />
																<c:set var="hour" value="${fn:substring(clockInTime, 0, 2)}" />
																<c:set var="minute" value="${fn:substring(clockInTime, 3, 5)}" />
															    <span class="custom-font">&nbsp;출근 시간 : ${hour}시 ${minute}분</span>
															</p>
						                                </c:if>
						                                <c:if test="${attendance.clockInTime == null}">
						                                	<p style="display: flex; align-items: center;">
						                                		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dog"><path d="M11.25 16.25h1.5L12 17z"/><path d="M16 14v.5"/><path d="M4.42 11.247A13.152 13.152 0 0 0 4 14.556C4 18.728 7.582 21 12 21s8-2.272 8-6.444a11.702 11.702 0 0 0-.493-3.309"/><path d="M8 14v.5"/><path d="M8.5 8.5c-.384 1.05-1.083 2.028-2.344 2.5-1.931.722-3.576-.297-3.656-1-.113-.994 1.177-6.53 4-7 1.923-.321 3.651.845 3.651 2.235A7.497 7.497 0 0 1 14 5.277c0-1.39 1.844-2.598 3.767-2.277 2.823.47 4.113 6.006 4 7-.08.703-1.725 1.722-3.656 1-1.261-.472-1.855-1.45-2.239-2.5"/></svg>
						                                    	&nbsp;출근 시간 : 
						                                    </p>
						                                </c:if>
						                            </div>
						                            <div class="text-slate-900 custom-font" id="attendanceClockOutTime" style="font-size: large;">
						                                <c:if test="${attendance.clockOutTime != null}">
							                                <p style="display: flex; align-items: center;">
							                                	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dog"><path d="M11.25 16.25h1.5L12 17z"/><path d="M16 14v.5"/><path d="M4.42 11.247A13.152 13.152 0 0 0 4 14.556C4 18.728 7.582 21 12 21s8-2.272 8-6.444a11.702 11.702 0 0 0-.493-3.309"/><path d="M8 14v.5"/><path d="M8.5 8.5c-.384 1.05-1.083 2.028-2.344 2.5-1.931.722-3.576-.297-3.656-1-.113-.994 1.177-6.53 4-7 1.923-.321 3.651.845 3.651 2.235A7.497 7.497 0 0 1 14 5.277c0-1.39 1.844-2.598 3.767-2.277 2.823.47 4.113 6.006 4 7-.08.703-1.725 1.722-3.656 1-1.261-.472-1.855-1.45-2.239-2.5"/></svg>
							                                    <c:set var="clockOutTime" value="${attendance.clockOutTime}" />
																<c:set var="hour" value="${fn:substring(clockOutTime, 0, 2)}" />
																<c:set var="minute" value="${fn:substring(clockOutTime, 3, 5)}" />
															    &nbsp;퇴근 시간 : ${hour}시 ${minute}분
						                                    </p>
						                                </c:if>
						                                <c:if test="${attendance.clockOutTime == null}">
						                                    <p style="display: flex; align-items: center;">
						                                    	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dog"><path d="M11.25 16.25h1.5L12 17z"/><path d="M16 14v.5"/><path d="M4.42 11.247A13.152 13.152 0 0 0 4 14.556C4 18.728 7.582 21 12 21s8-2.272 8-6.444a11.702 11.702 0 0 0-.493-3.309"/><path d="M8 14v.5"/><path d="M8.5 8.5c-.384 1.05-1.083 2.028-2.344 2.5-1.931.722-3.576-.297-3.656-1-.113-.994 1.177-6.53 4-7 1.923-.321 3.651.845 3.651 2.235A7.497 7.497 0 0 1 14 5.277c0-1.39 1.844-2.598 3.767-2.277 2.823.47 4.113 6.006 4 7-.08.703-1.725 1.722-3.656 1-1.261-.472-1.855-1.45-2.239-2.5"/></svg>
							                                    &nbsp;퇴근 시간 : 
						                                    </p>
						                                </c:if>
						                            </div>
						                        </c:forEach>
					                    	</c:if>
					                    	<c:if test="${empty attendanceList }">
					                    		<div class="text-slate-600 font-bold" id="attendanceClockInTime" style="font-size: large;">
					                    			<p style="visibility: hidden;">출근버튼</p>
        											<p style="visibility: hidden;">퇴근버튼</p>
					                    		</div>
					                    	</c:if>
					                    </div>
					                    
					                    <div class="flex justify-between items-end">
										    <form id="attendanceOnForm" action="${pageContext.request.contextPath}/employee/attendanceOn" method="post" onsubmit="return checkAttendance(event, 'in');">
										        <input type="hidden" name="empNo" value="${employee.empNo}">
										        <input type="hidden" name="attendanceDate" value="${currentDate}">
										        <input type="hidden" name="clockInTime" value="${clockInTime}">
										        <input type="submit" class="text-white border-0 btn bg-gradient-to-r from-custom-500 to-purple-500 hover:text-white hover:from-purple-500 hover:to-custom-500" style="margin-right: 7px;" value="출근">
										    </form>
										    
										    <form id="attendanceOffForm" action="${pageContext.request.contextPath}/employee/attendanceOff" method="post" onsubmit="return checkAttendance(event, 'out');">
										        <input type="hidden" name="empNo" value="${employee.empNo}">
										        <input type="hidden" name="attendanceDate" value="${currentDate}">
										        <input type="hidden" name="clockInTime" value="${clockInTime}">
										        <input type="submit" class="text-white border-0 btn bg-gradient-to-r from-custom-500 to-purple-500 hover:text-white hover:from-purple-500 hover:to-custom-500" value="퇴근">
										    </form>
										</div>

					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<!-- 오늘 일정 리스트 -->
                    <div class="col-span-12 card 2xl:col-span-3 2xl:row-span-2" style="height: 450px;">
                        <div class="card-body h-full flex flex-col" style="height: 100%; display: flex; flex-direction: column;">
                            <div class="flex items-center mb-3">
                                <h6 class="grow text-16 text-green-600" id="scheduleTitle"></h6>
                                <div class="relative">
                                    <a href="${pageContext.request.contextPath}/schedule/scheduleCalendar" class="transition-all duration-200 ease-linear text-custom-500 hover:text-custom-600">View Schedule<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="move-right" class="lucide lucide-move-right inline-block align-middle size-4 ltr:ml-1 rtl:mr-1"><path d="M18 8L22 12L18 16"></path><path d="M2 12H22"></path></svg></a>
                                </div>
                            </div>
                            <hr class="mb-2">
				    		<c:if test="${not empty todayScheduleByAllDay}">
	                            <div class="flex flex-col justify-start simplebar-scrollable-y" style="mix-height: 380px; max-height: 380px;" data-simplebar="init" data-simplebar-track="custom">
							    	<c:forEach var="ts" items="${todayScheduleByAllDay}" varStatus="status">
									    <div class="relative ltr:pl-6 before:absolute ltr:before:border-l ltr:before:left-[.22rem] before:border-slate-200 before:top-1.5 before:-bottom-1.5 after:absolute after:w-2 after:h-2 after:bg-custom-500 after:rounded-full ltr:after:left-0 after:top-1.5 pb-2">
											<!-- 개인 -->
											<c:if test="${ts.scheduleType == 'I'}">
											    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-green-100 border-green-200 text-green-500">개인</span>
											</c:if>
											<c:if test="${ts.scheduleType == 'T'}">
											    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-yellow-100 border-yellow-200 text-yellow-500">팀</span>
											</c:if>
											<c:if test="${ts.scheduleType == 'V'}">
											    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-sky-100 border-sky-200 text-sky-500">휴가</span>
											</c:if>
											<c:if test="${ts.scheduleType == 'C'}">
											    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-purple-100 border-purple-200 text-purple-500">회의</span>
											</c:if>
											
									        <!-- 내용 부분 -->
										    <h6 class="mb-1 ml-2 text-15 inline-block">
											    <c:choose>
											        <c:when test="${fn:length(ts.scheduleTitle) > 14}">
											            ${fn:substring(ts.scheduleTitle, 0, 14)}&nbsp;...
											        </c:when>
											        <c:otherwise>
											            ${ts.scheduleTitle}
											        </c:otherwise>
											    </c:choose>
											</h6>
									        <p class="text-sm text-slate-400">${ts.startDatetime}</p>
								    	</div>
									</c:forEach>
								</div>
						    </c:if>
						    <c:if test="${empty todayScheduleByAllDay}">
						    	<div class="flex flex-col justify-start" style="mix-height: 380px; max-height: 380px;">
							    	<div class="relative ltr:pl-6 before:absolute ltr:before:border-l ltr:before:left-[.22rem] before:border-slate-200 before:top-1.5 before:-bottom-1.5 after:absolute after:w-2 after:h-2 after:bg-custom-500 after:rounded-full ltr:after:left-0 after:top-1.5 pb-2">
										<!-- 내용 부분 -->
								        <h6 class="mb-1 text-15">일정이 없습니다.</h6>
								        <p class="text-sm text-slate-400" id="noSchedule"></p>
								    </div>
								</div>
						    </c:if>
                        </div>
                    </div>
                    
                    <!-- 결재 할 문서 -->
                    <div class="col-span-12 card 2xl:col-span-5 2xl:row-span-2" style="height: 450px;">
                        <div class="card-body h-full flex flex-col" style="height: 100%; display: flex; flex-direction: column;">
                            <div class="flex items-center mb-3">
                                <h6 class="grow text-16 text-green-600"><i class="ri-file-text-line mr-1"></i>결재 대기 문서</h6>
                                <div class="relative">
                                    <a href="${pageContext.request.contextPath}/document/documentList" class="transition-all duration-200 ease-linear text-custom-500 hover:text-custom-600">All Document<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="move-right" class="lucide lucide-move-right inline-block align-middle size-4 ltr:ml-1 rtl:mr-1"><path d="M18 8L22 12L18 16"></path><path d="M2 12H22"></path></svg></a>
                                </div>
                            </div>
                            <c:if test="${not empty documentListByMain}">
					           	<div class="simplebar-scrollable-y" style="flex-grow: 1; max-height: 360px;" data-simplebar="init" data-simplebar-track="custom">
					                <table class="w-full whitespace-nowrap" style="table-layout: fixed; border-radius: 2px; overflow: hidden;">
					                    <thead class="bg-slate-100">
					                        <tr>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 60px;">번호</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 250px;">제목</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 100px;">작성자</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 90px;">결재 상태</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 90px;">등록일</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        <c:forEach var="dl" items="${documentListByMain}">
					                            <tr onclick="window.location='${pageContext.request.contextPath}/document/documentOne?docNo=${dl.docNo}&docType=${dl.docType}'" style="cursor: pointer; "class="bg-transparent hover:bg-slate-100 rounded-md transition duration-500">
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 60px;">
					                                	<span style="font-size: 0.85em;">${dl.docNo}</span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200" style="width: 250px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					                                	<span class="text-gray-500" style="font-size: 0.85em;">[${dl.docType == 'D' ? '기안 문서' : dl.docType == 'V' ? '연차 신청서' : dl.docType == 'M' ? '비품 신청서' : dl.docType == 'R' ? '사직서' : d.docType}]</span>
					                                 	<span>${dl.docTitle}</span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 100px;">
						                                <div>
													        <div>${dl.docWriterName} <span style="font-size: 0.85em; color: gray;">[${dl.docWriterRank}]</span></div>
													        <div style="font-size: 0.85em; color: gray;">${dl.writerDeptName}</div>
													    </div>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 90px;">
					                                    <span>
													        <c:if test="${empty dl.initApprovalStatus}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#101ee5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-dashed" style="display: inline;">
																    <path d="M10.1 2.182a10 10 0 0 1 3.8 0"/>
																    <path d="M13.9 21.818a10 10 0 0 1-3.8 0"/>
																    <path d="M17.609 3.721a10 10 0 0 1 2.69 2.7"/>
																    <path d="M2.182 13.9a10 10 0 0 1 0-3.8"/>
																    <path d="M20.279 17.609a10 10 0 0 1-2.7 2.69"/>
																    <path d="M21.818 10.1a10 10 0 0 1 0 3.8"/>
																    <path d="M3.721 6.391a10 10 0 0 1 2.7-2.69"/>
																    <path d="M6.391 20.279a10 10 0 0 1-2.69-2.7"/>
																</svg>
												            </c:if>
												            <c:if test="${dl.initApprovalStatus == 'A'}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
													                <circle cx="12" cy="12" r="10"/>
													                <path d="m9 12 2 2 4-4"/>
												                </svg>
												            </c:if>
												            <c:if test="${dl.initApprovalStatus == 'R'}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
													                <circle cx="12" cy="12" r="10"/>
													                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
												                </svg>
												            </c:if>
													    </span>
													    
													    <span>
													        <c:if test="${empty dl.midApprovalStatus}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#101ee5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-dashed" style="display: inline;">
															    <path d="M10.1 2.182a10 10 0 0 1 3.8 0"/>
															    <path d="M13.9 21.818a10 10 0 0 1-3.8 0"/>
															    <path d="M17.609 3.721a10 10 0 0 1 2.69 2.7"/>
															    <path d="M2.182 13.9a10 10 0 0 1 0-3.8"/>
															    <path d="M20.279 17.609a10 10 0 0 1-2.7 2.69"/>
															    <path d="M21.818 10.1a10 10 0 0 1 0 3.8"/>
															    <path d="M3.721 6.391a10 10 0 0 1 2.7-2.69"/>
															    <path d="M6.391 20.279a10 10 0 0 1-2.69-2.7"/>
															</svg>
											            </c:if>
											            <c:if test="${dl.midApprovalStatus == 'A'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m9 12 2 2 4-4"/>
											                </svg>
											            </c:if>
											            <c:if test="${dl.midApprovalStatus == 'R'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
											                </svg>
											            </c:if>
													    </span>
													    
													    <span>
													        <c:if test="${empty dl.finalApprovalStatus}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#101ee5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-dashed" style="display: inline;">
																    <path d="M10.1 2.182a10 10 0 0 1 3.8 0"/>
																    <path d="M13.9 21.818a10 10 0 0 1-3.8 0"/>
																    <path d="M17.609 3.721a10 10 0 0 1 2.69 2.7"/>
																    <path d="M2.182 13.9a10 10 0 0 1 0-3.8"/>
																    <path d="M20.279 17.609a10 10 0 0 1-2.7 2.69"/>
																    <path d="M21.818 10.1a10 10 0 0 1 0 3.8"/>
																    <path d="M3.721 6.391a10 10 0 0 1 2.7-2.69"/>
																    <path d="M6.391 20.279a10 10 0 0 1-2.69-2.7"/>
																</svg>
												            </c:if>
												            <c:if test="${dl.finalApprovalStatus == 'A'}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
													                <circle cx="12" cy="12" r="10"/>
													                <path d="m9 12 2 2 4-4"/>
												                </svg>
												            </c:if>
												            <c:if test="${dl.finalApprovalStatus == 'R'}">
												                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
													                <circle cx="12" cy="12" r="10"/>
													                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
												                </svg>
												            </c:if>
														    </span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 100px;">
					                                	<span class="text-gray-500" style="font-size: 0.85em;">${fn:substringBefore(dl.updateDatetime, 'T')}</span>
					                                </td>
					                            </tr>
					                        </c:forEach>
					                    </tbody>
					                </table>
					            </div>
					        </c:if>
							
                            <c:if test="${empty documentListByMain}">
					            <table class="w-full whitespace-nowrap">
					                <thead class="bg-slate-100">
					                    <tr>
	                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 60px;">번호</th>
	                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 250px;">제목</th>
	                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 100px;">작성자</th>
	                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 90px;">결재 상태</th>
	                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 90px;">등록일</th>
	                                    </tr>
					                </thead>
					            </table>
						        <div class="noresult text-center p-7">
						            <h5 class="mb-3">문서가 없습니다.</h5>
						            <p class="mb-0 text-slate-500">결재 할 문서가 없습니다.</p>	
					            </div>
						    </c:if>
                        </div>
                    </div>
                    
                    <!-- 안 읽은 쪽지 조회 -->
                    <div class="col-span-12 card 2xl:col-span-4 2xl:row-span-2" style="height: 250px;">
                        <div class="card-body h-full flex flex-col" style="height: 100%; display: flex; flex-direction: column;">
                            <div class="flex items-center mb-3">
                                <h6 class="grow text-16 text-green-600"><i class="ri-mail-check-line mr-1"></i>최근 메세지</h6>
                                <div class="relative">
                                    <a href="${pageContext.request.contextPath}/message/messageList" class="transition-all duration-200 ease-linear text-custom-500 hover:text-custom-600">All Message<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="move-right" class="lucide lucide-move-right inline-block align-middle size-4 ltr:ml-1 rtl:mr-1"><path d="M18 8L22 12L18 16"></path><path d="M2 12H22"></path></svg></a>
                                </div>
                            </div>
                            <hr class="mb-1" style="margin-right: 12px;">
                            
                            <c:if test="${not empty messageList}">
                            	<div class="flex flex-col justify-start simplebar-scrollable-y" style="mix-height: 170px; max-height: 170px;" data-simplebar="init" data-simplebar-track="custom">
                            	
		                            <c:forEach var="ml" items="${messageList}">
		                            	<button onclick="window.location.href='${pageContext.request.contextPath}/message/messageOne?messageNo=${ml.messageNo}'" class="flex items-center space-x-2 w-full h-12 p-2 text-left bg-transparent hover:bg-slate-100 rounded-md transition duration-500" style="padding-right: 15px;">
										    <div class="w-10 h-10 rounded-md shrink-0 bg-slate-100">
										        <img src="${pageContext.request.contextPath}/employeeFile/${ml.fileName != null ? ml.fileName : 'placeholder.png'}" alt="" class="rounded-md">
										    </div>
										    <div class="flex items-center justify-between w-full h-12"> <!-- h-20: 원하는 높이 설정 -->
										    	<div>
												    <h6 class="mb-1 font-medium flex items-center"><b>${ml.senderEmpName}</b></h6>
												    <p class="mb-0 text-sm text-slate-500 dark:text-zink-300">${ml.messageTitle}</p>
											    </div>
											    <div class="flex flex-col space-y-2">
												    <div class="flex justify-end">
												        <div class="flex justify-end items-center gap-2 text-xs text-slate-500 shrink-0 dark:text-zink-300">
							                                <div class="w-1.5 h-1.5 bg-custom-500 rounded-full"></div>${ml.arrivalAlert}
							                            </div>
												    </div>
												    <div>
						                                <p class="flex justify-end mb-0 text-sm text-slate-500 dark:text-zink-300">
						                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="clock" class="lucide lucide-clock inline-block w-3.5 h-3.5 mr-1 mt-1">
						                                        <circle cx="12" cy="12" r="10"></circle>
						                                        <polyline points="12 6 12 12 16 14"></polyline>
						                                    </svg>
						                                    <span class="align-middle date-output" data-date=${ml.createDateTime} style="margin-top : 1.5px;">${ml.createDateTime}</span>
						                                </p>
		                            				</div>
												</div>
											</div>
									     </button>
									     <hr class="my-1" style="margin-right: 12px;">
		                            </c:forEach>
	                            </div>
                            </c:if>
                            
                            <c:if test="${empty messageList}">
                            	<div class="noresult text-center p-7">
						            <h5 class="mb-3">쪽지가 없습니다.</h5>
						            <p class="mb-0 text-slate-500">읽지 않은 쪽지가 없습니다.</p>	
					            </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="col-span-12 2xl:col-span-8"></div>
                    
                    <!-- 고정 공지사항 및 오늘의 공지사항 -->
                    <div class="col-span-12 card 2xl:col-span-8 2xl:row-span-2"style="height: 450px;">
                        <div class="card-body h-full flex flex-col" style="height: 100%; display: flex; flex-direction: column;">
                            <div class="flex items-center mb-3">
                                <h6 class="grow text-16 text-green-600"><i class="ri-notification-2-line mr-1"></i>Today’s 공지사항</h6>
                                <div class="relative">
                                    <a href="${pageContext.request.contextPath}/notice/getNoticeList" class="transition-all duration-200 ease-linear text-custom-500 hover:text-custom-600">All Notice<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="move-right" class="lucide lucide-move-right inline-block align-middle size-4 ltr:ml-1 rtl:mr-1"><path d="M18 8L22 12L18 16"></path><path d="M2 12H22"></path></svg></a>
                                </div>
                            </div>
                            <c:if test="${not empty noticeListByMain}">
					           	<div class="simplebar-scrollable-y" style="flex-grow: 1; max-height: 390px;" data-simplebar="init" data-simplebar-track="green">
					                <table class="w-full whitespace-nowrap" style="table-layout: fixed; border-radius: 2px; overflow: hidden;">
					                    <thead class="bg-green-100">
					                        <tr>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 70px;">번호</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 500px;">제목</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 70px;">조회수</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 190px;">작성자</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 170px;">등록일</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        <c:forEach var="nl" items="${noticeListByMain}">
					                            <tr onclick="window.location='${pageContext.request.contextPath}/notice/getNoticeOne?noticeNo=${nl.noticeNo}'" style="cursor: pointer; <c:if test="${nl.isPinned == 'Y'}">background-color: rgba(160, 232, 219, 0.2);</c:if>"class="bg-transparent hover:bg-slate-100 rounded-md transition duration-500">
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 70px;">
					                                	<span style="font-size: 0.85em;">${nl.noticeNo}</span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 500px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					                                    <span class="text-gray-500" style="font-size: 0.85em;">[${nl.divisionName}]&nbsp;</span>
					                                    <span>${nl.noticeTitle}</span>
					                                    
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 70px;">
					                                	<span class="text-gray-500" style="font-size: 0.85em;">${nl.noticeView}</span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 190px;">
					                                	<span class="text-gray-500" style="font-size: 0.85em;">&nbsp;${nl.deptName}</span>
					                                    <span>${nl.writerEmpName}</span>
					                                </td>
					                                <td class="px-3.5 py-1.5 border-y border-slate-200 text-center" style="width: 170px;">
					                                	<span class="text-gray-500" style="font-size: 0.85em;">${fn:substringBefore(nl.createDatetime, 'T')}</span>
					                                </td>
					                            </tr>
					                        </c:forEach>
					                    </tbody>
					                </table>
					            </div>
					        </c:if>
							
                            <c:if test="${empty noticeListByMain}">
					            <table class="w-full whitespace-nowrap">
					                <thead class="bg-green-100">
					                        <tr>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 70px;">번호</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 500px;">제목</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 70px;">조회수</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 190px;">작성자</th>
					                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 text-center" style="width: 170px;">등록일</th>
					                        </tr>
					                    </thead>
					            </table>
						        <div class="noresult text-center p-7">
						            <h5 class="mb-3">공지사항이 없습니다.</h5>
						            <p class="mb-0 text-slate-500">최근에 등록된 공지사항이 없습니다.</p>	
					            </div>
						    </c:if>
                        </div>
                    </div>
                    
                    <!-- 월 별 객실 예약 현황 -->
                    <div class="col-span-12 card 2xl:col-span-4 2xl:row-span-2" style="height: 450px;">
                    	<div class="card-body">
                            <div class="flex items-center mb-3">
                                <h6 class="grow text-16 text-custom-600"><i class="ri-line-chart-line"></i>&nbsp;월 별 객실 예약 현황</h6>
                            </div>
                            <div id="monthlyReservationStatistics" class="apex-charts" data-chart-colors="[&quot;bg-purple-500&quot;, &quot;bg-sky-500&quot;]" dir="ltr" style="min-height:380px; max-height: 455px;"></div>
                        </div>
                    </div>
                    
                    <!-- 연간 성별 가입 추이 및 오늘의 객실 점유율 -->
                    <div class="col-span-12 2xl:col-span-4 2xl:row-span-2">
                    	<!-- 연간 성별 가입 추이 -->
                    	<div class="col-span-12 card 2xl:col-span-12" style="height: 350px;">
	                        <div class="card-body">
	                            <div class="flex justify-between items-center mb-1">
								    <h6 id="yearTitle" class="text-16 text-custom-600">
								        <i class="ri-line-chart-line"></i>&nbsp;연간 성별 가입 추이 (<span id="selectedYear" class="text-green-600">2024</span>년)
								    </h6>
								    <div class="relative">
								        <select id="yearSelect" class="ml-4 border border-custom-200 text-custom-600" style="border-radius: 5px;">
										    <option value="2023">2023년</option>
										    <option value="2024" selected="selected">2024년</option>
										    <option value="2025">2025년</option>
										</select>
								    </div>
								</div>
	                            <div id="genderSignupStatistics" class="apex-charts" data-chart-colors="[&quot;bg-custom-500&quot;, &quot;bg-green-500&quot;]" dir="ltr" style="min-height: 280px;"></div>
	                        </div>
                        </div>
                        
                        <!-- 오늘의 객실 점유율 -->
                        <div class="col-span-12 card 2xl:col-span-12" style="height: 180px;">
	                        <div class="card-body">
	                            <div class="flex items-center mb-5">
	                            	<h6 class="grow text-16 text-custom-600" id="reservationStatsTitle"></h6>
	                            </div>
	                            <div class="flex items-center mb-3">
	                            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-paw-print"><circle cx="11" cy="4" r="2"/><circle cx="18" cy="8" r="2"/><circle cx="20" cy="16" r="2"/><path d="M9 10a5 5 0 0 1 5 5v3.5a3.5 3.5 0 0 1-6.84 1.045Q6.52 17.48 4.46 16.84A3.5 3.5 0 0 1 5.5 10Z"/></svg>
                                    <h6 class="grow"> 오늘 총 <span class="counter-value text-custom-600" data-target="${reservationStats.totalRooms}"></span>객실 중 <span class="counter-value text-custom-600" data-target="${reservationStats.todayReservedRooms}"></span>객실이 예약되었습니다.</h6>
                                	<c:if test="${reservationStats.changeStatus == '증가'}">
									    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-white border-green-100 text-green-500">
									        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="trending-up" class="lucide lucide-trending-up inline-block size-3 ltr:mr-1 rtl:ml-1">
									            <polyline points="2 7 8.5 13.5 13.5 8.5 22 17"></polyline>
									            <polyline points="8 17 2 17 2 11"></polyline>
									        </svg> 
									        ${reservationStats.changePercentage}%
									    </span>
									</c:if>
									
									<c:if test="${reservationStats.changeStatus == '감소'}">
									    <span class="px-2.5 py-0.5 text-xs inline-block font-medium rounded border bg-white border-red-100 text-red-500">
									        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="trending-down" class="lucide lucide-trending-down inline-block size-3 ltr:mr-1 rtl:ml-1">
									            <polyline points="22 17 13.5 8.5 8.5 13.5 2 7"></polyline>
									            <polyline points="16 17 22 17 22 11"></polyline>
									        </svg> 
									        ${reservationStats.changePercentage}%
									    </span>
									</c:if>
                                </div>
                                <div class="mt-2 mb-5">
                                    <div class="flex items-center justify-between mt-2 mb-2">
                                        <p class="text-slate-500 dark:text-zink-200">Today Reservation</p>
                                        <h6 class="mb-0 text-custom-500">${reservationStats.occupancyRate}%</h6>
                                    </div>
                                    <div class="w-full bg-slate-200 rounded-full h-2.54 dark:bg-zink-600">
                                        <div class="bg-custom-500 h-2.5 rounded-full" style="width: ${reservationStats.occupancyRate}%"></div>
                                    </div>
                                </div>
	                        </div>
                        </div>
                    </div>
                    
                    <!-- 월 별 펫 서비스 매출 현황 -->
                    <div class="col-span-12 card 2xl:col-span-8 2xl:row-span-2"style="height: 550px;">
                        <div class="card-body">
                            <div class="flex flex-col gap-4 mb-4 md:mb-3 md:items-center md:flex-row">
                            	<h6 class="grow text-16 text-custom-600"><i class="ri-bar-chart-line"></i>&nbsp;월 별 펫 서비스 매출 현황</h6>
                                <div class="relative">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="calendar-range" class="lucide lucide-calendar-range absolute size-4 ltr:left-3 rtl:right-3 top-3 text-slate-500 dark:text-zink-200"><rect width="18" height="18" x="3" y="4" rx="2" ry="2"></rect><line x1="16" x2="16" y1="2" y2="6"></line><line x1="8" x2="8" y1="2" y2="6"></line><line x1="3" x2="21" y1="10" y2="10"></line><path d="M17 14h-6"></path><path d="M13 18H7"></path><path d="M7 14h.01"></path><path d="M17 18h.01"></path></svg>
                                    <input type="text" class="ltr:pl-10 rtl:pr-10 form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200 flatpickr-input" data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true" readonly="readonly" placeholder="Select Date">
                                </div>
                            </div>
                            <div class="grid grid-cols-12 gap-4 mb-3">
                                <div class="col-span-12 md:col-span-6 lg:col-span-3">
                                    <div class="flex items-center gap-3">
                                        <div class="flex items-center justify-center rounded-md size-12 text-sky-500 bg-sky-50 shrink-0 dark:bg-sky-500/10">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="bar-chart" class="lucide lucide-bar-chart"><line x1="12" x2="12" y1="20" y2="10"></line><line x1="18" x2="18" y1="20" y2="4"></line><line x1="6" x2="6" y1="20" y2="16"></line></svg>
                                        </div>
                                        <div class="grow">
                                            <p class="mb-1 text-slate-500 dark:text-zink-200">서비스 총 매출</p>
                                            <h5 class="text-15"><span class="counter-value" data-target="45123000.">1,517,000</span>&nbsp;원</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-span-12 md:col-span-6 lg:col-span-3">
                                    <div class="flex items-center gap-3">
                                        <div class="flex items-center justify-center text-green-500 rounded-md size-12 bg-green-50 shrink-0 dark:bg-green-500/10">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="trending-up" class="lucide lucide-trending-up"><polyline points="22 7 13.5 15.5 8.5 10.5 2 17"></polyline><polyline points="16 7 22 7 22 13"></polyline></svg>
                                        </div>
                                        <div class="grow">
                                            <p class="mb-1 text-slate-500 dark:text-zink-200">서비스 순 이익</p>
                                            <h5 class="text-15"><span class="counter-value" data-target="37429000.">3,517,000</span>&nbsp;원</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id=petServiceSalesStatistics class="apex-charts" data-chart-colors="[&quot;bg-custom-500&quot;, &quot;bg-custom-400&quot;, &quot;bg-custom-300&quot;]" dir="ltr" style="min-height: 315px;"></div>
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

<script src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
<!--apexchart js-->
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/apexcharts-petTopiaMain.init.js"></script>
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script>
	//출퇴근 체크
	function checkAttendance(event, action) {
	    event.preventDefault(); // 기본 동작 방지
	
	    const clockInTime = "${attendanceList[0] != null ? attendanceList[0].clockInTime : ''}";
	    const clockOutTime = "${attendanceList[0] != null ? attendanceList[0].clockOutTime : ''}";
	
	    if (action === 'in') {
	        if (clockInTime) {
	            alert("이미 출근하셨습니다 😊");
	            return false; 
	        }
	    } else if (action === 'out') {
	        if (clockOutTime) {
	            alert("이미 퇴근하셨습니다 😊");
	            return false; 
	        } else if (!clockInTime) {
	            alert("출근시간을 입력해주세요 ⏰");
	            return false; 
	        }
	    }
	
	    event.target.submit(); // 유효성 통과 시 폼 제출
	    return true; 
	}
	
	// 출퇴근 체크 함수 연결 (예시)
	// 예를 들어, 출근 버튼을 클릭할 때 checkAttendance 호출
	$('#clockInButton').click(function(event) {
	    checkAttendance(event, 'in');
	});
	
	$('#clockOutButton').click(function(event) {
	    checkAttendance(event, 'out');
	});


    $(document).ready(function() {
        // 날짜 형식화
        var date = new Date();
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        const formattedDate = year + '-' + month + '-' + day;
        console.log('Formatted Date:', formattedDate); // debug

        $('#scheduleTitle').html('<i class="ri-calendar-check-line mr-1"></i> ' + month + '월  ' + day +'일 일정');
        $('#reservationStatsTitle').html('<i class="ri-pie-chart-line"></i> ' + month + '월  ' + day +'일 객실 점유율');
        $('#noSchedule').html(formattedDate);

        document.querySelectorAll('.date-output').forEach(function (element) {
            const dateStr = element.getAttribute('data-date');  // data-date 속성에서 날짜를 읽음
            const formattedCreateDate = dayjs(dateStr).locale('ko').format('dddd hh:mm A');  // '수요일 03:42 PM' 형식으로
            element.textContent = formattedCreateDate;  // 포맷된 날짜를 요소에 삽입
        });

        // 비밀번호 변경 알림
        var empStatus = "${empStatus}";
        console.log(empStatus);
        if (empStatus === 'T') {
            alert("비밀번호를 변경해주세요 😊");
        }

        // 연도 선택 시 텍스트 변경
        $('#yearSelect').change(function() {
            var selectedValue = $(this).val();
            $('#selectedYear').text(selectedValue);
        });
    });
        
</script>



</body>

</html>