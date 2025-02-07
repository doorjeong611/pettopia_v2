<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h5 class="title-font">펫 서비스 예약내역</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="${pageContext.request.contextPath}/service/getServiceRsvList" class="text-slate-400 dark:text-zink-200">예약 내역</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            펫 서비스 예약 내역
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                  <div class="card" id="">
                    <div class="card-body">
                        <div class="grid grid-cols-1 gap-5 mb-5 xl:grid-cols-2">
                            <form action="${pageContext.request.contextPath}/service/getServiceRsvList" method="get" style="justify-content: flex-end;">
				                <div class="relative xl:w-3/6">
			                        <input type="text" name="searchWord" value="${searchWord}" class="ltr:pl-3 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="예약자 / 서비스 정보를 입력하세요">
			                         <button type="submit" class="absolute right-0 top-0 h-full px-4 text-slate-500">
			                        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
			                        </button>
			                	</div>
			                </form>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="w-full whitespace-nowrap" id="serviceTable">
                                <thead class="bg-slate-100 dark:bg-zink-600">
                                    <tr>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="customer_name">예약 번호</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="email">예약자</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="phone">예약 날짜</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="phone">예약 상태</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="phone">노쇼 여부</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="phone">서비스 이름</th>
                                        <th class="sort px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 ltr:text-center" data-sort="phone">서비스 설명</th>
                                        
                                    </tr>
                                </thead>
                                 <tbody>
		                                <c:forEach var="serviceRsvList" items="${serviceRsvList}">
		                                    <tr class="even:bg-slate-50 hover:bg-slate-50 even:hover:bg-slate-100 dark:even:bg-zink-600/50 dark:hover:bg-zink-600 dark:even:hover:bg-zink-600">
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">
		                                            <a href="#" class="transition-all duration-150 ease-linear text-custom-500 hover:text-custom-600">${serviceRsvList.rsvNo}</a>
		                                        </td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${serviceRsvList.customerName}</td>
												<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">
												    <c:set var="rsvDatetime" value="${fn:replace(serviceRsvList.rsvDatetime, 'T', ' ')}"/>
												    ${rsvDatetime}
												</td>
												
												<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">
									                <select class="rsv-status border rounded px-2 py-1"
									                        onchange="updateRsvStatus(this, '${serviceRsvList.rsvNo}', '${serviceRsvList.rsvDatetime}')">
									                    <option value="CF" ${serviceRsvList.rsvStatus == 'CF' ? 'selected' : ''}>예약완료</option>
									                    <option value="CC" ${serviceRsvList.rsvStatus == 'CC' ? 'selected' : ''}>취소</option>
									                    <option value="IP" ${serviceRsvList.rsvStatus == 'IP' ? 'selected' : ''}>진행중</option>
									                    <option value="CM" ${serviceRsvList.rsvStatus == 'CM' ? 'selected' : ''}>이용완료</option>
									                </select>
									            </td>
									             <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center" id="noShow_${serviceRsvList.rsvNo}">
									             	 <span class="text-red-500">${serviceRsvList.rsvNoShow == '1' ? 'No Show' : ''}</span>
									            </td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${serviceRsvList.serviceName}</td>
		                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${serviceRsvList.serviceDesc}</td>
		                                        
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
						               href="?currentPage=${currentPage - 10}&searchWord=${searchWord}">
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
						                                   href="?currentPage=${num}&searchWord=${searchWord}">
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
						               href="?currentPage=${currentPage + 10}&searchWord=${searchWord}">
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
        </div>
        <!-- End Footer -->
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
<script>
//예약 상태 변경 시 호출
function updateRsvStatus(selectElement, rsvNo, rsvDatetime) {
    // querySelector를 사용하여 더 유연하게 요소 찾기
    const row = selectElement.closest('tr');
    const noShowElement = row.querySelector('td[id^="noShow_"]');
    
    if (!noShowElement) {
        console.error('노쇼 상태를 표시할 요소를 찾을 수 없습니다.');
        return;
    }

    const selectedStatus = selectElement.value;
    const isoDatetime = rsvDatetime.replace(' ', 'T');

    fetch('${pageContext.request.contextPath}/service/updateRsvStatus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            rsvNo: rsvNo,
            rsvStatus: selectedStatus,
            rsvDatetime: isoDatetime
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            noShowElement.textContent = data.rsvNoShow === 1 ? '노쇼' : '';
            console.log('예약 상태가 성공적으로 업데이트되었습니다.');
        } else {
            alert('예약 상태 업데이트 실패: ' + data.message);
        }
    })
    .catch(error => {
        console.error('서버 오류:', error);
        alert('예약 상태 업데이트 중 오류가 발생했습니다.');
    });
}




	// 삭제
	function deleteMultiple() {
	    var selectedServices = [];
	    
	    // 체크된 서비스 목록 가져오기
	    document.querySelectorAll('input[type="checkbox"]:checked').forEach(function(checkbox) {
	        // 체크박스가 체크된 서비스의 serviceNo 값 모음
	        selectedServices.push(checkbox.closest('tr').querySelector('td a').textContent);
	    });
	    
	    if (selectedServices.length === 0) {
	        alert('삭제할 서비스를 선택하세요.');
	        return;
	    }
	
	    // 확인 메시지
	    if (confirm("선택한 서비스를 삭제하시겠습니까?")) {
	        // 삭제할 서비스들을 서버로 전송
	        var form = document.createElement('form');
	        form.method = 'POST';
	        form.action = '${pageContext.request.contextPath}/service/deleteService';  // 서버의 삭제 처리 URL
	        
	        var input = document.createElement('input');
	        input.type = 'hidden';
	        input.name = 'serviceNos';
	        input.value = selectedServices.join(',');
	        form.appendChild(input);
	        
	        document.body.appendChild(form);
	        form.submit(); // 폼 전송
	        
	        confirm("삭제되었습니다.")
	    }
	}
</script>

</body>

</html>