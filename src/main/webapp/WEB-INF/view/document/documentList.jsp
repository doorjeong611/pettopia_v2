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
                        <h5 class="text-16">문서 보관함</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="${pageContext.request.contextPath}/document/documentList" class="text-slate-400 dark:text-zink-200">결재 문서</a>
                        </li>
                        <li class="text-slate-700">
                            문서 보관함
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                
                <div class="card" id="documentList">
                    <div class="card-body">
	                    <div class="mb-5">
						    <ul class="flex">
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentList" method="POST">
						            	<input type="hidden" name="highlight" value="all">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "all"}'>text-custom-500 font-semibold</c:if>">
							                전체 보관함
							            </button>
						            </form>
						        </li>
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentList" method="POST">
						            	<input type="hidden" name="highlight" value="received">
						                <input type="hidden" name="initApproverNo" value="${empNo}">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "received"}'>text-custom-500 font-semibold</c:if>">
							                수신 보관함
							            </button>
						            </form>
						        </li>
						        <li class="mr-4">
						            <form action="${pageContext.request.contextPath}/document/documentList" method="POST">
						             	<input type="hidden" name="highlight" value="sent">
						                <input type="hidden" name="docWriterNo" value="${empNo}">
						                <button type="submit" class="py-2 px-4 text-gray-600 hover:text-custom-500 focus:outline-none 
							            <c:if test='${highlight == "sent"}'>text-custom-500 font-semibold</c:if>">
							                발신 보관함
							            </button>
						            </form>
						        </li>
						        <li>
						            <form action="${pageContext.request.contextPath}/document/documentList" method="POST">
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
                                <div class="relative xl:w-3/6">
                                    <input type="text" class="ltr:pl-8 search form-input border-slate-200 focus:outline-none focus:border-custom-500 placeholder:text-slate-400" placeholder="검색어를 입력하세요" autocomplete="off">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 top-2.5 text-slate-500 fill-slate-100"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
                                </div>
                            </div>
                            <div class="ltr:md:text-end">
                            	<a href="${pageContext.request.contextPath}/document/addDocument" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100"><i class="align-bottom ri-add-line me-1"></i> 문서 작성</a>
                                <button type="button" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100" ><i class="ri-delete-bin-2-line"></i> 삭제</button>
                            </div>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="w-full whitespace-nowrap" id="documentTable">
                                <thead class="bg-slate-100">
                                    <tr>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 checkBox" style="width: 50px;">
                                            <input type="checkbox" class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500 checked:disabled:bg-custom-400 checked:disabled:border-custom-400">
                                        </th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="docNo" style="width: 95px;">문서 번호</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="docTitle" style="width: 450px;">제목</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="docWriterName" style="width: 250px;">작성자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="approvalStatus" style="width: 70px;">결재 상태</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="initApproversName" style="width: 250px;">수신자</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 ltr:text-center" data-sort="updateDatetime" style="width: 150px;">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="d" items="${documentList}">
	                                	 <tr onclick="window.location='${pageContext.request.contextPath}/document/documentOne?docNo=${d.docNo}'" style="cursor: pointer;">
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
	                                        	<input type="checkbox" class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 checked:bg-custom-500 checked:border-custom-500 checked:disabled:bg-custom-400 checked:disabled:border-custom-400">
	                                        </td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">${d.docNo}</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center"><span class="text-gray-500">[${d.docType == 'D' ? '기안 문서' : d.docType == 'V' ? '연차 신청서' : d.docType == 'M' ? '비품 신청서' : d.docType == 'R' ? '사직서' : d.docType}]</span> ${d.docTitle}</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    <div>
											        <div>${d.docWriterName}</div>
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
											        <div>${d.initApproversName}</div>
											        <div style="font-size: 0.85em; color: gray;">${d.approversDeptName}</div>
											    </div>
											</td>
	                                        <td class="px-3.5 py-1.5 border-y border-slate-200 text-center">
											    ${fn:substringBefore(d.updateDatetime, 'T')}
											</td>
	                                    </tr>
                                	</c:forEach>
                               	</tbody>
                            </table>
                            <div class="noresult" style="display: none">
                                <div class="text-center p-7">
                                    <h5 class="mb-2">결재 문서가 없습니다.</h5>
                                    <p class="mb-0 text-slate-500 dark:text-zink-200">We've searched more than 150+ Orders We did not find any orders for you search.</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-end mt-4">
                            <div class="flex gap-2 pagination-wrap">
                                <a class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200  text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-500 dark:[&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 dark:[&amp;.active]:bg-custom-500/10 [&amp;.active]:border-custom-50 dark:[&amp;.active]:border-custom-500/10 [&amp;.active]:hover:text-custom-700 dark:[&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto page-item pagination-prev disabled pagination-prev disabled" href="#">
                                    이전
                                </a>
                                <ul class="flex gap-2 mb-0 pagination listjs-pagination"><li class="active"><a class="page" href="#" data-i="1" data-page="5">1</a></li></ul>
                                <a class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200  text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-500 dark:[&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 dark:[&amp;.active]:bg-custom-500/10 [&amp;.active]:border-custom-50 dark:[&amp;.active]:border-custom-500/10 [&amp;.active]:hover:text-custom-700 dark:[&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto page-item pagination-prev disabled pagination-next" href="#">
                                    다음
                                </a>
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

</body>

</html>