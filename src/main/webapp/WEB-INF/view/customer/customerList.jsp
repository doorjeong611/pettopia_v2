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
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    
<style type="text/css">
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
                        <h5 class="title-font">고객 조회</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
					    <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
					        <a href="${pageContext.request.contextPath}/customer/getCustomerList" class="text-slate-400">고객 조회</a>
					    </li>
					    <li class="text-slate-700">
					        고객 목록
						</li>
					</ul>
                </div>
                
                <form action="${pageContext.request.contextPath}/customer/getCustomerList" method="get" class="mb-4 flex" style="justify-content: flex-start;">
	                <div class="flex items-center gap-2 2xl:col-span-4 2xl:col-start-9">
	                    <div class="relative grow" style="width: 230px;">
	                        <input type="text" name="searchWord" value="${searchWord}" class="ltr:pl-2 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="이름 / 정보를 입력하세요">
	                         <button type="submit" class="absolute right-0 top-0 h-full px-4 text-slate-500">
	                        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
	                        </button>
	                    </div>
	                </div>
                </form>
    
                <!-- Main content -->
                  <div class="card">
                        <div class="card-body">
                            <div class="overflow-x-auto">
                                <table class="w-full">
                                    <thead class="ltr:text-left rtl:text-right ">
                                        <tr>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">고객 번호</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">고객 이름</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">우편 번호</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">기본 주소</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">기본 주소</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">전화번호</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">가입일</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center">정보 수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
		                                <c:forEach var="c" items="${customerList}">
		                                    <tr class="even:bg-slate-50 hover:bg-slate-50 even:hover:bg-slate-100 dark:even:bg-zink-600/50 dark:hover:bg-zink-600 dark:even:hover:bg-zink-600">
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">
		                                            <a href="#" class="transition-all duration-150 ease-linear text-custom-500 hover:text-custom-600">${c.customerNo}</a>
		                                        </td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.customerName}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.postalCode}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.basicAddress}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.detailAddress}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.customerPhone}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${fn:substring(c.createDatetime, 0, 10)}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${c.updateDatetime}</td>
		                                        
		                                        
		                                    </tr>
		                                </c:forEach> 
                            		</tbody>
                                </table>
                            </div>
                            <!-- 페이징 시작 -->
						<div class="flex justify-end mt-4">
						    <div class="flex gap-2 pagination-wrap">
						        <!-- 이전 그룹 버튼 -->
						        <c:if test="${currentPage > 10}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500"
						               href="?currentPage=${currentPage - 10}&pageSize=${pageSize}">
						                이전
						            </a>
						        </c:if>
						        <c:if test="${currentPage <= 10}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 disabled:cursor-auto disabled:text-slate-400">
						                이전
						            </a>
						        </c:if>
						
						        <!-- 페이지 번호 -->
						        <ul class="flex gap-2 mb-0">
						            <c:forEach var="num" begin="1" end="${totalPages}" varStatus="status">
						                <c:if test="${status.index <= 10}">
						                    <c:choose>
						                        <c:when test="${num == currentPage}">
						                            <li class="active">
						                                <span class="inline-flex items-center justify-center bg-custom-500 border border-custom-500 text-white h-8 px-3 rounded">
						                                    ${num}
						                                </span>
						                            </li>
						                        </c:when>
						                        <c:otherwise>
						                            <li>
						                                <a class="inline-flex items-center justify-center bg-white border border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 h-8 px-3 rounded"
						                                   href="?currentPage=${num}&pageSize=${pageSize}">
						                                    ${num}
						                                </a>
						                            </li>
						                        </c:otherwise>
						                    </c:choose>
						                </c:if>
						            </c:forEach>
						        </ul>
						
						        <!-- 다음 그룹 버튼 -->
						        <c:if test="${totalPages > 10}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500"
						               href="?currentPage=${currentPage + 10}&pageSize=${pageSize}">
						                다음
						            </a>
						        </c:if>
						        <c:if test="${totalPages <= 10}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 disabled:cursor-auto disabled:text-slate-400">
						                다음
						            </a>
						        </c:if>
						    </div>
						</div>
						<!-- 페이징 끝 -->
                        </div>
                    </div>
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
<!-- list js-->
<script src="${pageContext.request.contextPath}/assets/libs/list.js/list.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/list.pagination.js/list.pagination.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
<!-- Sweet Alerts js -->
<script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>

<!-- listjs init -->
<script src="${pageContext.request.contextPath}/assets/js/pages/listjs.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>

</html>