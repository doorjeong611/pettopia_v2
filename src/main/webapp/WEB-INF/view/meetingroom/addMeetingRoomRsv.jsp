<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 시큐리티 세션 사용을 위한 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 시큐리티 세션정보 접근 -->
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="loginEmp"/></sec:authorize>



<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>Room List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    
    <!-- Flatpickr CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	
	<!-- Flatpickr JS -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>	
 
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
                        <h5 class="text-16">회의실 예약</h5>
                    </div>
                </div>
                <!-- Main content -->
               <div class="card">
                    <div class="card-body">
                        <form id="formAddMeetingRoomRsv" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/meetingroom/addMeetingRoomRsv">
                            <div>
                                <div class="mb-4" style="width: 15%">
                                    <label class="inline-block mb-2 text-base font-medium"> 회의실 선택 <span class="text-red-500">*</span></label>
                                    <select name="roomNo" id="roomSelect" onchange="getRoomInfo()" class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
								         <option value="">회의실 선택</option>
										    <c:forEach var="room" items="${roomList}">
										        <option value="${room.roomNo}">${room.roomName} ( 수용인원 : ${room.roomCapacity} )</option>
										    </c:forEach>
   									 </select>
                                </div>
                                <!-- 객실 정보 뿌려질 div -->
                                <table id="roomInfoTable" class="w-full mb-4">
                                    <thead class="ltr:text-left rtl:text-right">
                                        <tr>
                                        	<th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">이미지</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">회의실 이름</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">위치</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">수용 인원</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                       	<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"><img id="roomImg" src="" alt="방 이미지" width="100"></td>
                                           <td id="roomName" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="roomLocation" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="roomCapacity" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                               
                                       </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="grid grid-cols-1 gap-x-5 md:grid-cols-2 xl:grid-cols-4">
	                            <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium"> 예약자 사번<span class="text-red-500">*</span></label>
                                    <input type="text" id="" name="empNo" readonly class="form-input border-slate-200 focus:outline-none disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="예약자 성명을 입력하세요." value="${loginEmp.username}">
                                </div>
	                            <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium"> 참여 인원<span class="text-red-500">*</span></label>
                                    <input type="number" id="" name="conferenceUsers" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="참석 인원을 입력하세요." >
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">예약 날짜<span class="text-red-500">*</span></label>
                                    <input type="text" id="rsvDate" name="rsvDate" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="에약날짜를 선택해주세요" data-provider="flatpickr" data-date-format="Y-m-d">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">예약 시간<span class="text-red-500">*</span></label>
                                    <select name="timePeriod" id="timeSelect"  class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
								         <option value="">예약 가능 시간 </option> 
   									 </select>
                                </div>
                                
                             </div>
                             <div class="lg:col-span-2 xl:col-span-12 mb-4">
                                 <label class="inline-block mb-2 text-base font-medium">회의명 <span class="text-red-500">*</span></label>
                                <input type="text" id="conference_title" name="conferenceTitle" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="회의명을 입력하세요.">
                             </div>
                             <div class="lg:col-span-2 xl:col-span-12 mb-4">
                                 <label class="inline-block mb-2 text-base font-medium">회의 내용 <span class="text-red-500">*</span></label>
                                <textarea id="conferenceDesc" name="conferenceDesc" rows="10" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="메모를 작성하세요."></textarea>
                             </div>
                           
                        <div class="flex justify-end gap-2">
                            <button type="reset" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="x" class="lucide lucide-x inline-block size-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg> <span class="align-middle">Cancel</span></button>
                            <button type="submit" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">등록</button>
                        	<a href="${pageContext.request.contextPath}/meetingroom/meetingroomRsvList"><button type="button" class="mr-1 bg-white text-green-500 border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button></a>
                        </div>
                    </form>
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
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/form-file-upload.init.js"></script>
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script>
	$('#roomInfoTable').hide();
	
    // 객실 정보를 가져오는 함수
    function getRoomInfo() {
    	$('#roomInfoTable').show();
    	var roomNo = document.getElementById('roomSelect').value;

        if (roomNo) {
            // 서버에서 객실 정보 조회
    		fetch('/pettopia/rest/getMeetingRoomOne?roomNo=' + roomNo)
                .then(response => response.json())
                .then(data => {
                    // 데이터를 화면에 출력
            		console.log("회의실 정보:", data);
                    document.getElementById('roomName').textContent = data.roomName;  
	                document.getElementById('roomCapacity').textContent = data.roomCapacity; 
	                document.getElementById('roomLocation').textContent = data.roomLocation; 
	                document.getElementById('roomImg').src = "${pageContext.request.contextPath}/meetingRoomFile/" + data.fileName; // 객실 이미지
                })
                .catch(error => {
                    console.error("오류 발생. 에러 메시지: ", error);
                });
        }
    }
    
    /* 회의실 선택 및 날짜 선택 시 */
    $('#roomSelect, #rsvDate').change(function() {
        const rsvDate = $('#rsvDate').val();
        const roomNo = $('#roomSelect').val();

        // 둘 다 값이 입력되었을 때만 실행
        if (rsvDate && roomNo) {
            $.ajax({
                url: '/pettopia/rest/getReserveTime',
                method: 'GET',
                data: {
                    rsvDate: rsvDate,
                    roomNo: roomNo
                }
            }).done(function(result) {
                // 시간대 리셋
                $('#timeSelect').empty();
                $('#timeSelect').append('<option value="">예약 가능 시간 선택</option>');

                $(result).each(function(index, item) {
                    $('#timeSelect').append('<option value="' + item.timePeriod + '">' + item.timeRange + '</option>');
                });

            }).fail(function() {
                alert('예약시간 호출 실패');
            });
        }
    });
    
    
    
    

</script>



</body>

</html>