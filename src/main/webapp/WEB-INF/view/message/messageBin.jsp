<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <h5 class="text-16">휴지통</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">메인 화면</a>
                            
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            템플릿
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="col-span-12 lg:col-span-9 2xl:col-span-10 grow card">
                        <div id="emailList" class="block">
                            <div class="card-body flex flex-col" style="overflow: visible;">
                               <p class="mb-2 text-slate-500 dark:text-zink-200">
								    <a href="${pageContext.request.contextPath}/message/messageNote" class="text-blue-500 hover:underline">쪽지쓰기</a>
								</p>
	                             <div class="grid items-center grid-cols-1 gap-4 2xl:grid-cols-12">
                                    <div class="2xl:col-span-5">
                                        <div class="flex flex-wrap items-center gap-3 divide-x rtl:divide-x-reverse divide-slate-200 dark:divide-zink-500">
                                            <div class="flex items-center gap-3">
                                                <div class="flex items-center gap-2" id="email-topbar-actions">
                                                    <input id="checkboxAll" class="form-check-input size-4 cursor-pointer bg-white border border-slate-200 checked:bg-none dark:bg-zink-700 dark:border-zink-500 rounded-sm appearance-none arrow-none relative after:absolute after:content-['\eb7b'] after:top-0 after:left-0 after:font-remix after:leading-none after:opacity-0 checked:after:opacity-100 after:text-custom-500 checked:border-custom-500 dark:after:text-custom-500 dark:checked:border-custom-800" type="checkbox">
                                                </div>
                                                <a href="#!" class="flex items-center justify-center transition-all duration-200 ease-linear size-6 text-slate-500 dark:text-zink-200 hover:text-slate-600 dark:hover:text-zink-50"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="refresh-cw" class="lucide lucide-refresh-cw size-4"><path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8"></path><path d="M21 3v5h-5"></path><path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16"></path><path d="M8 16H3v5"></path></svg></a>
                                            <div class="hidden px-4 py-3 text-sm text-yellow-500 border border-transparent rounded-md unreadConversations-alert bg-yellow-50 dark:bg-yellow-400/20" id="unreadConversations">
                                            </div>
                                        </div>
                                    </div><!--end col-->
                                    <br>
                                    <div class="flex items-center gap-2 2xl:col-span-4 2xl:col-start-9">
                                        <div class="relative grow">
                                            <input type="text" id="searchResultList" value="" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="메일 검색" autocomplete="off">
                                            
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end grid-->
                            </div>
                <div class="!pt-0 card-body flex-grow overflow-y-auto">
                                <!-- 보낸 사람 시작하는 부분 -->
                                    <div class="overflow-x-auto">
                                    	<br>
                                        <!-- 테이블 시작 부분 -->
                                       <form action="${pageContext.request.contextPath}/message/messageBin" method="post">
                                       <table class="w-full whitespace-nowrap">
							    		<tr>
								        	<td style="padding: 10px;">
									            <span class="text-slate-500 dark:text-zink-200 deleteMessages" style="margin-right: 20px; cursor: pointer;">영구삭제</span>
									            <span class="text-slate-500 dark:text-zink-200" style="margin-right: 24px;">읽음</span>
									            <span class="text-slate-500 dark:text-zink-200" style="margin-right: 50px;">보낸사람</span>
									            <span class="text-slate-500 dark:text-zink-200" style="margin-right: 0px;"></span>
							           	 		<span class="text-slate-500 dark:text-zink-200" style="margin-left: 1000px;">날짜</span>
								        	</td>
								    	</tr>
							   		    <tbody class="elmLoader" id="mail-list">
								        <!-- 메일리스트 시작부분 -->
								        <c:forEach var="message" items="${messageList}">
								        <c:if test="${message.messageBin == 0}">
								            <tr>
								                <td class="px-3.5 py-2.5 border-y text-slate-500" style="padding: 10px;">
								                    <input type="hidden" class="messageNo" value="${message.messageNo}" />
								                	<input style="margin-left: 8px;" type="checkbox" class="moveToBin" name="messageNo" value="${message.messageNo}" /> 
								                    <span style="margin-left: 37px; display: inline-block;">${message.messageState}</span>
								                    <span style="margin-left: 37px; display: inline-block; width: 300px;">${message.senderName}</span> <!-- 보낸 사람 -->
								                    <span style="margin-left: 50px; display: inline-block; width: 300px;">${message.messageTitle}</span> <!-- 제목 -->
								                   <span style="margin-left: 395px; display: inline-block; width: 150px;">${message.createDatetime}</span> <!-- 날짜 -->
								                </td>
								            </tr>
								            </c:if>
								        </c:forEach>
								    </tbody>
								</table>
								</form>
                             </div>
                          </div>
                          <div class="flex flex-col items-center gap-4 px-4 mt-4 md:flex-row" id="pagination-element">
                        <div class="grow">
                            <p> Results</p>
                        </div>

                        <div class="col-sm-auto mt-sm-0">
                            <div class="flex flex-col items-center gap-5 mb-5 md:flex-row" id="paginationItems">
                    <div class="grow">
                        <p class="text-slate-500 dark:text-zink-200">Showing <b>8</b> of <b>44</b> Results</p>
                    </div>
                    <ul class="flex flex-wrap items-center gap-2">
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-left" class="lucide lucide-chevron-left size-4 rtl:rotate-180"><path d="m15 18-6-6 6-6"></path></svg></a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto">1</a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto">2</a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto active">3</a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto">4</a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto">5</a>
                        </li>
                        <li>
                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 size-8 transition-all duration-150 ease-linear border border-slate-200 dark:border-zink-500 rounded text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-50 dark:[&amp;.active]:text-custom-50 [&amp;.active]:bg-custom-500 dark:[&amp;.active]:bg-custom-500 [&amp;.active]:border-custom-500 dark:[&amp;.active]:border-custom-500 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-right" class="lucide lucide-chevron-right size-4 rtl:rotate-180"><path d="m9 18 6-6-6-6"></path></svg></a>
                        </li>
                    </ul>
                </div>

                        </div>
                    </div>
                      </div><div class="simplebar-placeholder" style="width: 1176px; height: 93px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="width: 0px; display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="height: 0px; display: none;"></div></div></div>
                  
                
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
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}assets/libs/sweetalert2/sweetalert2.min.js"></script>

<!-- list js -->
<script src="${pageContext.request.contextPath}/assets/libs/list.js/list.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/list.pagination.js/list.pagination.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/apps-hr-employee.init.js"></script>

<!--apexchart js-->
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.deleteMessages').addEventListener('click', function() {
        const checkboxes = document.querySelectorAll('.moveToBin:checked'); // 체크된 체크박스 선택

        if (checkboxes.length === 0) {
            alert('삭제할 메시지를 선택하세요.'); // 선택된 메시지가 없을 경우 사용자에게 알림
            return;
        }

        // 확인 대화상자
        if (confirm('선택한 메시지를 삭제하시겠습니까?')) {
            document.querySelector('form').submit(); // 폼 제출
        }
    });
});
</script>
</html>