<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>공지사항</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    
  
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	    
    
    <!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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
                        <h5 class="text-16">공지사항</h5>
  
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">공지사항</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            공지사항
                        </li>
                    </ul>
                </div>
                
                
                <!-- Main content -->
                 <div class="card" id="ordersTable">
                    <div class="card-body">
                              <div class="relative" style="margin-bottom:20px"> <!-- 카테고리 선택 + 검색 -->
								  <form action="${pageContext.request.contextPath}/notice/getNoticeList" method="get" id="searchCategoryForm" style="display: flex; justify-content: space-between; align-items: center;">
								    <div style="display: flex; align-items: center;">
								      <select name="divisionCode" id="division" class="mr-2">
								        <option value="" style="text-align: center;">전체</option>
								        <c:forEach var="dvs" items="${noticeList.divisionList}">
								          <option value="${dvs.divisionCode}" ${dvs.divisionCode == CurrentdivisionCode ? 'selected' : ''} style="text-align: center">${dvs.divisionName}</option>
								        </c:forEach>
								      </select>
									<!-- 게시글 검색 버튼 -->
										<div class="relative grow">
                                            <input type="text" name="searchKeyword" value="" id="searchKeyword" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" style="text-align:left;" placeholder="검색어를 입력하세요.">
                                             <button type="submit" class="absolute right-0 top-0 h-full px-4 text-slate-500">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
                                            </button>
                                        </div>
								    </div>
								
								    <!-- Right part: 게시글 작성 and 삭제 buttons -->
								    <div style="display: flex; align-items: center;">
								      <a href="${pageContext.request.contextPath}/notice/addNotice" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100" method="get"> 
								        게시글 작성
								      </a>
								      <form id="binForm" action="${pageContext.request.contextPath}/admin/deleteNotice" method="post" class="inline">
								        <button type="button" id="binBtn" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">
								         삭제
								        </button>
								      </form>
								    </div> 
								  </form>
								</div>
                                
                        <div class="overflow-x-auto">
                            <div class="overflow-x-auto">
                                <table class="w-full whitespace-nowrap">
                                    <thead class="ltr:text-left rtl:text-right bg-slate-100 text-slate-500 dark:bg-zink-600 dark:text-zink-200">
                                        <tr style="background-color: #8ca2d557">
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">번호</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">부서</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">제목</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">조회수</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">작성자</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" style="text-align: center;">등록일</th>
                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="no" items="${noticeList.noticeList}" varStatus="status">
                                    		<c:if test="${no.isPinned == 'Y' }">
	                                    		<tr style="background-color: #f0f4ff">
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${status.count}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.divisionName == 'ALL' ? '전체' : no.divisionName}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;"><a href="${pageContext.request.contextPath}/notice/getNoticeOne?noticeNo=${no.noticeNo}">${no.noticeTitle}</a></td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.noticeView}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.empName}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${fn:substring(no.createDate,0,10)}</td>                                		
	                                    		</tr>
                                    		</c:if>
                                    		<c:if test="${no.isPinned == 'N' }">
	                                    		<tr>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${status.count}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.divisionName == 'ALL' ? '전체' : no.divisionName}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;"><a href="${pageContext.request.contextPath}/notice/getNoticeOne?noticeNo=${no.noticeNo}">${no.noticeTitle}</a></td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.noticeView}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${no.empName}</td>
		                                    		<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500" style="text-align: center;">${fn:substring(no.createDate,0,10)}</td>                                		
	                                    		</tr>
                                    		</c:if>
                                    		
                                    	</c:forEach>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- 페이지네이션 -->
                        <div id="pagination" class="flex justify-end mt-4">
						    <ul class="flex flex-wrap items-center gap-2 shrink-0">
						        <!-- 이전 버튼 -->
						        <li>
						            <a href="javascript:void(0);" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 disabled">
						                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-left" class="lucide lucide-chevron-left mr-1 size-4 rtl:rotate-180"><path d="m15 18-6-6 6-6"></path></svg> 이전
						            </a>
						        </li>
						
						        <!-- 페이지 번호 생성 -->
						            <li>
						                <a href="?page=1" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 active">
						                    1
						                </a>
						            </li>
						        <!-- 다음 버튼 -->
						        <li>
						            <a href="javascript:void(0);" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 disabled">
						                다음 
						                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-right" class="lucide lucide-chevron-right ml-1 size-4 rtl:rotate-180"><path d="m9 18 6-6-6-6"></path></svg>
						            </a>
						        </li>
						    </ul>
						</div>	
						
                    </div>
                </div>   <!--  id="ordersTable" div 끝 -->
                
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
<%-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>
 --%>
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>

    <script>
		/* $(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행. */
			console.log("jQuery 실행중");
			$('#division').change(function() {// 부서별 공지 확인
				
				$('#searchCategoryForm').submit();
			})
			
			
		/* }) */
	</script>


</html>