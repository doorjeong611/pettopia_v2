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
                        <h5 class="title-font">쪽지보관함</h5>
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
                                                </div>
                                                <a href="#!" class="flex items-center justify-center transition-all duration-200 ease-linear size-6 text-slate-500 dark:text-zink-200 hover:text-slate-600 dark:hover:text-zink-50"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="refresh-cw" class="lucide lucide-refresh-cw size-4"><path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8"></path><path d="M21 3v5h-5"></path><path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16"></path><path d="M8 16H3v5"></path></svg></a>
                                            <div class="hidden px-4 py-3 text-sm text-yellow-500 border border-transparent rounded-md unreadConversations-alert bg-yellow-50 dark:bg-yellow-400/20" id="unreadConversations">
                                            </div>
                                        </div>
                                    </div><!--end col-->
                                    <br>
                                    <form action="${pageContext.request.contextPath}/message/messageList">
                                    <div class="flex items-center gap-2 2xl:col-span-4 2xl:col-start-9">
                                        <div class="relative grow">
                                            <input type="text" name="searchKeyword" value="${searchKeyword}" id="searchKeyword" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="이름 / 제목을 입력하세요.">
                                             <button type="submit" class="absolute right-0 top-0 h-full px-4 text-slate-500">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
                                            </button>
                                        </div></form>
                                    </div><!--end col-->
                                </div><!--end grid-->
                            </div>
             				<div>
                                <!-- 보낸 사람 시작하는 부분 -->
                                    <div>
                                    	<br>
                                        <!-- 테이블 시작 부분 -->
                                       <form action="${pageContext.request.contextPath}/message/messageBin" method="post">
                                       <table class="w-full whitespace-nowrap">
							    		<tr>
								        	<td style="padding: 10px;">
                                                    <input id="checkboxAll" class="form-check-input size-4 cursor-pointer bg-white border border-slate-200 checked:bg-none dark:bg-zink-700 dark:border-zink-500 rounded-sm appearance-none arrow-none relative after:absolute after:content-['\eb7b'] after:top-0 after:left-0 after:font-remix after:leading-none after:opacity-0 checked:after:opacity-100 after:text-custom-500 checked:border-custom-500 dark:after:text-custom-500 dark:checked:border-custom-800" style="margin-left: 7px;" type="checkbox" onclick="toggleCheckboxes(this)">
									            <span class="text-slate-500 dark:text-zink-200" style="margin-left: 28px; text-align: center;">읽음</span>
									            <span class="text-slate-500 dark:text-zink-200" style="margin-left: 20px; text-align: center;">보낸사람</span>
									            <span class="mx-2 border-l border-slate-300 dark:border-zink-500 h-5" style="margin-right: 11px; text-align: center;"></span>
							                <button type="submit" id="deleteButton" class="text-slate-500 dark:text-zink-200" style="margin-right: 27px; cursor: pointer; text-align: center;">
							                    삭제
							                </button>
									            <span class="text-slate-500 dark:text-zink-200" style="margin-left: 307px; text-align: center;">제목</span>
							           	 		<span class="text-slate-500 dark:text-zink-200" style="margin-left: 514px; text-align: center;">날짜</span>
								        	</td>
								    	</tr>
							   		    <tbody class="elmLoader" id="mail-list">
								        <!-- 메일리스트 시작부분 -->
								        <c:forEach var="message" items="${messageList}">
								        <c:if test="${message.messageBin == 0}">
								            <tr>
								                <td class="px-3.5 py-2.5 border-y text-slate-500" style="width: 600px;">
								                    <input type="hidden" class="messageNo" value="${message.messageNo}" style="text-align: center;" />
								                	<input style="margin-left: 4px; text-align: center;" type="checkbox" class="moveToBin" name="messageNo" value="${message.messageNo}" /> 
								                    <span style="margin-left: 37px; display: inline-block; text-align: center;">${message.messageState}</span>
								                    <span style="margin-left: -23px; display: inline-block; width: 150px; text-align: center;">${message.senderName}</span> <!-- 보낸 사람 -->
								                  	<a href="${pageContext.request.contextPath}/message/messageOne?messageNo=${message.messageNo}" style="margin-left: 202px; text-align: center; display: inline-block; width: 300px;">${message.messageTitle}</a> <!-- 제목 -->
								                   <span style="margin-left: 312px; display: inline-block; width: 150px; text-align: center;">${message.createDatetime}</span> <!-- 날짜 -->
								                </td>
								            </tr>
								            </c:if>
								        </c:forEach>
								    </tbody>
								</table>
								</form>
                             </div>
                          </div>
                          <!-- 페이지네이션 넘버링 -->
						<div class="flex justify-end mt-4">
						    <div class="flex gap-2 pagination-wrap">
						        <!-- 이전 페이지 -->
						        <c:if test="${currentPage > 1}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500 page-item pagination-prev" 
						               href="${pageContext.request.contextPath}/message/messageList?currentPage=${currentPage - 1}&searchKeyword=${noticeList.searchKeyword}">
						                이전
						            </a>
						        </c:if>
						        <c:if test="${currentPage == 1}">
						            <span class="inline-flex items-center justify-center bg-white h-8 px-3 border rounded border-slate-200 text-slate-400 cursor-not-allowed">
						                이전
						            </span>
						        </c:if>
						
						        <!-- 페이지 번호 링크 -->
						        <ul class="flex gap-2 mb-0">
						            <c:forEach var="num" begin="1" end="${totalPages}">
						                <c:if test="${num == currentPage}">
						                    <li class="active"><a class="inline-flex items-center justify-center bg-custom-50 border border-custom-50 text-custom-500 h-8 px-3 rounded" href="#">${num}</a></li>
						                </c:if>
						                <c:if test="${num != currentPage}">
						                    <li><a class="inline-flex items-center justify-center bg-white border border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 h-8 px-3 rounded" href="${pageContext.request.contextPath}/message/messageList?currentPage=${num}">${num}</a></li>
						                </c:if>
						            </c:forEach>
						        </ul>
						
						        <!-- 다음 페이지 -->
						        <c:if test="${currentPage < totalPages}">
						            <a class="inline-flex items-center justify-center bg-white h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 text-slate-500 hover:text-custom-500 hover:bg-custom-50 focus:bg-custom-50 focus:text-custom-500 page-item pagination-next" 
						                href="${pageContext.request.contextPath}/message/messageList?currentPage=${currentPage + 1}&searchKeyword=${noticeList.searchKeyword}">
						                다음
						            </a>
						        </c:if>
						        <c:if test="${currentPage >= totalPages}">
						            <span class="inline-flex items-center justify-center bg-white h-8 px-3 border rounded border-slate-200 text-slate-400 cursor-not-allowed">
						                다음
						            </span>
						        </c:if>
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

<!-- 공통 스크립트 -->
<script src='${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
<script src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>

<!-- list js -->
<script src="${pageContext.request.contextPath}/assets/libs/list.js/list.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/list.pagination.js/list.pagination.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/apps-hr-employee.init.js"></script>

<!-- apexchart js -->
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- dashboard ecommerce init js -->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 삭제 버튼 클릭 이벤트 리스너 등록
    document.querySelector('#deleteButton').addEventListener('click', function(event) {
        const checkboxes = document.querySelectorAll('.moveToBin:checked'); // 체크된 체크박스 가져오기
        
        // 체크된 체크박스가 없으면 사용자에게 알림
        if (checkboxes.length === 0) {
            alert('삭제할 쪽지를 선택하세요.'); // 선택된 메시지가 없을 경우 알림 메시지
            event.preventDefault(); // 폼 제출 방지
            return;
        }
        
        // 삭제 확인 대화상자
        if (confirm('선택한 쪽지를 삭제하시겠습니까?')) {
            document.querySelector('form').submit();
        } else {
            // 취소한 경우 메시지 로그
            console.log("사용자가 삭제를 취소했습니다.");
        }
    });

    // 휴지통으로 이동하는 경우
    document.querySelector('form').addEventListener('submit', function(event) {
        // 액션이 메시지 휴지통으로 이동하는 경우 확인
        const action = this.action;

        // 메시지 휴지통으로 이동하는 경우 알림 표시
        if (action.includes('/message/messageBin')) {
            alert('쪽지가 휴지통으로 이동되었습니다.'); // 메시지가 휴지통으로 이동되었다고 알림
        }
    });
});

// 모든 체크박스를 선택/해제하는 함수
function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('.moveToBin');
    checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked; // "모두 선택" 체크박스에 따라 모두 체크 또는 체크 해제
    });
}

</script>
</html>