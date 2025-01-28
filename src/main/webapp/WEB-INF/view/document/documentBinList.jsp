<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
	
		.custom-gray {
		    background-color: #d3d3d3;
		}
		
		.custom-blue {
	    	background-color: #e0f7fa; 
	    	color: #007bff; 
		}
	    .highlight {
        	color: blue; /* 파란색 글씨 */
        	font-weight: bolder;
    	}
	</style>
</head>

<body class="text-base bg-body-bg text-body font-public dark:text-zink-100 dark:bg-zink-800 group-data-[skin=bordered]:bg-body-bordered group-data-[skin=bordered]:dark:bg-zink-700">
<div class="group-data-[sidebar-size=sm]:min-h-sm group-data-[sidebar-size=sm]:relative">
    
	<!-- Left Sidebar Start -->
    <div class="app-menu w-vertical-menu bg-vertical-menu ltr:border-r rtl:border-l border-vertical-menu-border fixed bottom-0 top-0 z-[1003] transition-all duration-75 ease-linear group-data-[sidebar-size=md]:w-vertical-menu-md group-data-[sidebar-size=sm]:w-vertical-menu-sm group-data-[sidebar-size=sm]:pt-header group-data-[sidebar=dark]:bg-vertical-menu-dark group-data-[sidebar=dark]:border-vertical-menu-dark group-data-[sidebar=brand]:bg-vertical-menu-brand group-data-[sidebar=brand]:border-vertical-menu-brand group-data-[sidebar=modern]:bg-gradient-to-tr group-data-[sidebar=modern]:to-vertical-menu-to-modern group-data-[sidebar=modern]:from-vertical-menu-form-modern group-data-[layout=horizontal]:w-full group-data-[layout=horizontal]:bottom-auto group-data-[layout=horizontal]:top-header hidden md:block print:hidden group-data-[sidebar-size=sm]:absolute group-data-[sidebar=modern]:border-vertical-menu-border-modern group-data-[layout=horizontal]:dark:bg-zink-700 group-data-[layout=horizontal]:border-t group-data-[layout=horizontal]: group-data-[layout=horizontal]:border-r-0 group-data-[sidebar=dark]:dark:bg-zink-700 group-data-[sidebar=dark]:dark:border-zink-600 group-data-[layout=horizontal]:group-data-[navbar=scroll]:absolute group-data-[layout=horizontal]:group-data-[navbar=bordered]:top-[calc(theme('spacing.header')_+_theme('spacing.4'))] group-data-[layout=horizontal]:group-data-[navbar=bordered]:inset-x-4 group-data-[layout=horizontal]:group-data-[navbar=hidden]:top-0 group-data-[layout=horizontal]:group-data-[navbar=hidden]:h-16 group-data-[layout=horizontal]:group-data-[navbar=bordered]:w-[calc(100%_-_2rem)] group-data-[layout=horizontal]:group-data-[navbar=bordered]:[&.sticky]:top-header group-data-[layout=horizontal]:group-data-[navbar=bordered]:rounded-b-md group-data-[layout=horizontal]:shadow-md group-data-[layout=horizontal]:shadow-slate-500/10 group-data-[layout=horizontal]:dark:shadow-zink-500/10 group-data-[layout=horizontal]:opacity-0">
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
                        <h5 class="text-16">휴지통</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="${pageContext.request.contextPath}/document/documentList" class="text-slate-400 dark:text-zink-200">결재 문서</a>
                        </li>
                        <li class="text-slate-700">
                            문서 휴지통	
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                
                <div class="card" id="documentList">
                    <div class="card-body">
	                    <div class="mb-2">
						    <ul class="flex">
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentBinList" method="POST">
						            	<input type="hidden" name="highlight" value="all">
						            	<input type="hidden" name="empNo" value="${empNo}">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "all"}'>text-custom-500 font-semibold</c:if>">
							                전체 보관함	
							            </button>
						            </form>
						        </li>
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentBinList" method="POST">
						            	<input type="hidden" name="highlight" value="received">
						                <input type="hidden" name="initApproverNo" value="${empNo}">
						                <input type="hidden" name="midApproverNo" value="${empNo}">
						                <input type="hidden" name="finalApproverNo" value="${empNo}">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "received"}'>text-custom-500 font-semibold</c:if>">
							                수신 보관함
							            </button>
						            </form>
						        </li>
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentBinList" method="POST">
						             	<input type="hidden" name="highlight" value="sent">
						                <input type="hidden" name="docWriterNo" value="${empNo}">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "sent"}'>text-custom-500 font-semibold</c:if>">
							                발신 보관함
							            </button>
						            </form>
						        </li>
						        <li>
						            <form action="${pageContext.request.contextPath}/document/documentBinList" method="POST">
						            	<input type="hidden" name="highlight" value="temporary">
						                <input type="hidden" name="approvalStatus" value="T">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "temporary"}'>text-custom-500 font-semibold</c:if>">
							                임시 보관함
							            </button>
						            </form>
						        </li>
						    </ul>
						</div>
                        <div class="grid grid-cols-1 gap-5 mb-5 xl:grid-cols-2">
                            <div>
                               	<form id="searchForm" method="post" action="${pageContext.request.contextPath}/document/documentBinList">
	                                <div class="relative xl:w-3/6">
	                                	<input type="hidden" name="highlight" value="${highlight}">
	                                	        <c:if test="${highlight == 'received'}">
												    <input type="hidden" name="initApproverNo" value="${empNo}">
									                <input type="hidden" name="midApproverNo" value="${empNo}">
									                <input type="hidden" name="finalApproverNo" value="${empNo}">
												</c:if>
												<c:if test="${highlight == 'sent'}">
												    <input type="hidden" name="docWriterNo" value="${empNo}">
												</c:if>
												<c:if test="${highlight == 'temporary'}">
												    <input type="hidden" name="approvalStatus" value="T">
												</c:if>
												<c:if test="${highlight == 'all'}">
												    <input type="hidden" name="empNo" value="${empNo}">
												</c:if>
	                                    <input type="text" id="searchWord" name="searchWord" value="${searchWord}" class="ltr:pl-8 search form-input border-slate-200 focus:outline-none focus:border-custom-500 placeholder:text-slate-400" placeholder="검색어를 입력하세요" autocomplete="off">
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 top-2.5 text-slate-500 fill-slate-100"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
	                                </div>
                                </form>
                            </div>
                            <div class="ltr:md:text-end">
                            	<form id="restoreForm" action="${pageContext.request.contextPath}/document/documentRestore" method="POST" class="inline">
								    <button type="button" id="restoreBtn" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100"><i class="ri-archive-line"></i> 복원</button>
								</form>
								<form id="removeForm" action="${pageContext.request.contextPath}/document/documentRemove" method="POST" class="inline">
								    <button type="button" id="removeBtn" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100"><i class="ri-delete-bin-2-line"></i> 영구 삭제</button>
								</form>
                            </div>
                        </div>

                        <div class="overflow-x-auto">
                        	<c:if test="${not empty documentBin}">
                            <table class="w-full whitespace-nowrap" id="documentTable">
                                <thead class="bg-slate-100">
                                    <tr>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200" style="width: 50px;">
                                            <input id="selectAll" type="checkbox" class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500">
                                        </th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 95px;">문서 번호</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 500px;">제목</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">작성자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 70px;">결재 상태</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">초기 결재자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">중간 결재자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">최종 결재자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 150px;">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="d" items="${documentBin}">
	                                	 <tr onclick="window.location='${pageContext.request.contextPath}/document/documentOne?docNo=${d.docNo}&docType=${d.docType}'" style="cursor: pointer;">
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center checkBox">
											    <input type="checkbox" value="${d.docNo}" class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500">
											</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">${d.docNo}</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center"><span class="text-gray-500">[${d.docType == 'D' ? '기안 문서' : d.docType == 'V' ? '연차 신청서' : d.docType == 'M' ? '비품 신청서' : d.docType == 'R' ? '사직서' : d.docType}]</span> ${d.docTitle}</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <div>
											        <div>${d.docWriterName} <span style="font-size: 0.85em; color: gray;">[${d.docWriterRank}]</span></div>
											        <div style="font-size: 0.85em; color: gray;">${d.writerDeptName}</div>
											    </div>
											</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded 
											        ${d.approvalStatus == 'T' ? 'custom-gray text-gray-500' : 
											          d.approvalStatus == 'P' ? 'custom-blue' : 
											          d.approvalStatus == 'A' ? 'bg-green-100 text-green-500' : 
											          d.approvalStatus == 'R' ? 'bg-red-100 text-red-500' : ''} 
											        border-transparent text-uppercase">
											        ${d.approvalStatus == 'T' ? '임시' : 
											          d.approvalStatus == 'P' ? '대기' : 
											          d.approvalStatus == 'A' ? '승인' : 
											          d.approvalStatus == 'R' ? '반려' : ''}
											    </span>
											</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <div>
											        <div>
											        	${d.initApproversName}
											        	<span style="font-size: 0.85em; color: gray;">[${d.initApproverRank}]</span>
											        	<c:if test="${empty d.initApprovalStatus}">
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
											            <c:if test="${d.initApprovalStatus == 'A'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m9 12 2 2 4-4"/>
											                </svg>
											            </c:if>
											            <c:if test="${d.initApprovalStatus == 'R'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
											                </svg>
											            </c:if>
											        </div>
											        <div style="font-size: 0.85em; color: gray;">${d.initApproversDeptName}</div>
											    </div>
											</td>
											<td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <div>
											        <div>
											        	${d.midApproversName} 
											        	<span style="font-size: 0.85em; color: gray;">[${d.midApproverRank}]</span>
											        	<c:if test="${empty d.midApprovalStatus}">
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
											            <c:if test="${d.midApprovalStatus == 'A'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m9 12 2 2 4-4"/>
											                </svg>
											            </c:if>
											            <c:if test="${d.midApprovalStatus == 'R'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
											                </svg>
											            </c:if>
											        </div>
											        <div style="font-size: 0.85em; color: gray;">${d.midApproversDeptName}</div>
											    </div>
											</td>
											<td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <div>
											        <div>
											        	${d.finalApproversName} 
											        	<span style="font-size: 0.85em; color: gray;">[${d.finalApproverRank}]</span>
											        	<c:if test="${empty d.finalApprovalStatus}">
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
											            <c:if test="${d.finalApprovalStatus == 'A'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#2f8331" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m9 12 2 2 4-4"/>
											                </svg>
											            </c:if>
											            <c:if test="${d.finalApprovalStatus == 'R'}">
											                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x" style="display: inline;">
												                <circle cx="12" cy="12" r="10"/>
												                <path d="m15 9-6 6"/><path d="m9 9 6 6"/>
											                </svg>
											            </c:if>
											        </div>
											        <div style="font-size: 0.85em; color: gray;">${d.finalApproversDeptName}</div>
											    </div>
											</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    ${fn:substringBefore(d.updateDatetime, 'T')}
											</td>
	                                    </tr>
                                	</c:forEach>
                               	</tbody>
                            </table>
                            </c:if>
							<c:if test="${empty documentBin}">
						            <table class="w-full whitespace-nowrap" id="documentTable">
						                <thead class="bg-slate-100">
						                    <tr>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200" style="width: 50px;">
		                                            <input id="selectAll" type="checkbox" class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500">
		                                        </th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 95px;">문서 번호</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 500px;">제목</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">작성자</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 70px;">결재 상태</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">중간 결재자</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 170px;">최종 결재자</th>
		                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" style="width: 150px;">작성일</th>
		                                    </tr>
						                </thead>
						            </table>
						        <div class="noresult text-center p-7">
						            <h5 class="mb-3">검색 결과가 없습니다.</h5>
						            <p class="mb-0 text-slate-500">검색어에 맞는 문서가 없습니다.</p>
					            </div>
						    </c:if>
                        </div>
						
						<!-- 페이지 네이션 -->
                        <div class="flex justify-end mt-4">
						    <div class="flex gap-2 pagination-wrap">
						        <!-- 이전 페이지 -->
						        <c:if test="${!(page.currentPage > 1)}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500 [&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 [&amp;.active]:border-custom-50 [&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 [&amp;.disabled]:cursor-auto page-item pagination-prev pagination-prev disabled" href="#">이전</a>
						        </c:if>
						        <c:if test="${page.currentPage > 1}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500 [&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 [&amp;.active]:border-custom-50 [&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 [&amp;.disabled]:cursor-auto page-item pagination-prev pagination-next" href="${pageContext.request.contextPath}/document/documentBinList?currentPage=${page.currentPage - 1}">이전</a>
						        </c:if>
						
						        <!-- 페이지 번호 링크 -->
								<ul class="flex gap-2 mb-0">
							        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
							            <c:if test="${num == page.currentPage}">
							                <li class="active"><a class="inline-flex items-center justify-center bg-custom-50 border border-custom-50 text-custom-500 h-8 px-3 rounded" href="#">${num}</a></li>
							            </c:if>
							            <c:if test="${num != page.currentPage}">
							                <li><a class="inline-flex items-center justify-center bg-white border border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 h-8 px-3 rounded" href="${pageContext.request.contextPath}/document/documentBinList?currentPage=${num}">${num}</a></li>
							            </c:if>
							        </c:forEach>
								</ul>

						
						        <!-- 다음 페이지 -->
						        <c:if test="${page.currentPage < page.lastPage}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 [&amp;.active]:border-custom-50 [&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 [&amp;.disabled]:cursor-auto page-item pagination-prev pagination-next" href="${pageContext.request.contextPath}/document/documentBinList?currentPage=${page.currentPage + 1}">다음</a>
						        </c:if>
						        <c:if test="${page.currentPage >= page.lastPage}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500 [&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 [&amp;.active]:border-custom-50 [&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 [&amp;.disabled]:cursor-auto page-item pagination-prev pagination-prev disabled" href="#">다음</a>
						        </c:if>
						    </div>
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
<!-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>  -->

<!-- Sweet Alerts js -->
<script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<script>
$(document).ready(function() {
    
    // 전체 선택 체크박스 클릭 이벤트
    $('#selectAll').click(function() {
        const isChecked = $(this).prop('checked'); // 전체 선택 체크박스 상태 확인
        $('tbody input[type="checkbox"]').prop('checked', isChecked); // 다른 체크박스 상태 변경
    });

    // 개별 체크박스 클릭 이벤트 (전체 선택 체크박스 상태 업데이트)
    $('tbody input[type="checkbox"]').click(function() {
        const totalCheckboxes = $('tbody input[type="checkbox"]').length;
        const checkedCheckboxes = $('tbody input[type="checkbox"]:checked').length;

        // 전체 선택 체크박스의 상태 업데이트
        $('#selectAll').prop('checked', totalCheckboxes === checkedCheckboxes);
    });
    
    $('.checkBox').click(function(event) {
        // td 클릭 시에만 반전
        if (!$(event.target).is('input[type="checkbox"]')) {
            const checkbox = $(this).find('input[type="checkbox"]');
            checkbox.prop('checked', !checkbox.prop('checked')); // 체크 상태 반전
        }
        event.stopPropagation(); // 이벤트 전파 방지
    });

    // 체크박스 클릭 시 이벤트 전파 방지
    $('input[type="checkbox"]').click(function(event) {
        event.stopPropagation();
    });
    
    // 복원 버튼
    $('#restoreBtn').click(function() {
        const selectedDocs = [];

        // 체크된 체크박스를 찾아서 docNo 값을 배열에 추가
        $('input[type="checkbox"]:checked').each(function() {
            // 전체 선택 체크박스를 제외하고 docNo 값을 추가
            if ($(this).attr('id') !== 'selectAll') {
                selectedDocs.push($(this).val());
            }
        });

        // 선택된 문서가 없을 경우 경고
        if (selectedDocs.length === 0) {
            alert("하나 이상의 문서를 선택해 주세요.");
            return;
        }
        
     	// 확인 대화상자 표시
        const confirmMove = confirm("정말 복원 하시겠습니까?");
        if (!confirmMove) {
            return; // 사용자가 취소하면 폼 제출 중단
        }
        
        alert('복원 성공하였습니다.');

        // 선택된 문서 번호를 hidden input으로 추가
        selectedDocs.forEach(function(docNo) {
            $('#restoreForm').append($('<input>').attr({
                type: 'hidden',
                name: 'docNoList',
                value: docNo
            }));
        });
        console.log(selectedDocs);
        // 폼 제출
        $('#restoreForm').submit();
    });
    
 	// 영구삭제 버튼
    $('#removeBtn').click(function() {
        const selectedDocs = [];

        // 체크된 체크박스를 찾아서 docNo 값을 배열에 추가
        $('input[type="checkbox"]:checked').each(function() {
            // 전체 선택 체크박스를 제외하고 docNo 값을 추가
            if ($(this).attr('id') !== 'selectAll') {
                selectedDocs.push($(this).val());
            }
        });

        // 선택된 문서가 없을 경우 경고
        if (selectedDocs.length === 0) {
            alert("하나 이상의 문서를 선택해 주세요.");
            return;
        }
        
     	// 확인 대화상자 표시
        const confirmMove = confirm("정말 영구 삭제 하시겠습니까? 다시는 복원 할 수 없습니다.");
        if (!confirmMove) {
            return; // 사용자가 취소하면 폼 제출 중단
        }
        
        alert('영구 삭제 성공하였습니다.');

        // 선택된 문서 번호를 hidden input으로 추가
        selectedDocs.forEach(function(docNo) {
            $('#removeForm').append($('<input>').attr({
                type: 'hidden',
                name: 'docNoList',
                value: docNo
            }));
        });
        console.log(selectedDocs);
        // 폼 제출
        $('#removeForm').submit();
    });
    
    
});
</script>

</body>

</html>