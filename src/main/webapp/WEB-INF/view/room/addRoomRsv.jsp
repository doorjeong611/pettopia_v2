<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <h5 class="text-16">객실 예약 등록</h5>
                    </div>
                </div>
                <!-- Main content -->
               <div class="card">
                    <div class="card-body">
                        <form id="formAddRoom" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/room/addRoomRsv">
                            <div>
                                <div class="mb-4" style="width: 15%">
                                    <label class="inline-block mb-2 text-base font-medium"> 룸 선택 <span class="text-red-500">*</span></label>
                                    <select name="roomNo" id="roomSelect" onchange="getRoomInfo()" class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
								         <option value="">-- 객실 선택 --</option>
										    <c:forEach var="room" items="${roomList}">
										        <option value="${room.roomNo}">${room.roomName}(${room.roomType})</option>
										    </c:forEach>
   									 </select>
                                </div>
                                <!-- 객실 정보 뿌려질 div -->
                                <table id="roomInfoTable" class="w-full mb-4">
                                    <thead class="ltr:text-left rtl:text-right">
                                        <tr>
                                        	<th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">이미지</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">방 이름</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">방 타입</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">수용 인원</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">1박 가격</th>
                                            <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500">방 설명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                       	<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"><img id="roomImg" src="" alt="방 이미지" width="100"></td>
                                           <td id="roomName" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="roomType" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="roomCapacity" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="pricePerNight"class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                           <td id="roomDesc" class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500"></td>
                                       </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="grid grid-cols-1 gap-x-5 md:grid-cols-2 xl:grid-cols-4">
	                            <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium"> 예약자 <span class="text-red-500">*</span></label>
                                    <input type="text" id="RsvCustomerName" name="RsvCustomerName" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="예약자 성명을 입력하세요.">
                                	<input type="hidden" name="customerNo" value="${customerNo}">
                                	
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">예약자 H.P<span class="text-red-500">*</span></label>
                                    <input type="text" id="RsvCustomerHP" name="RsvCustomerHP" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="에약자 H.P를 입력하세요.">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">체크인<span class="text-red-500">*</span></label>
                                    <input type="datetime-local" id="checkIn" name="checkInDatetime" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">체크아웃<span class="text-red-500">*</span></label>
                                    <input type="datetime-local" id="checkOut" name="checkOutDatetime" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                </div>
                             </div>
                             <div class="lg:col-span-2 xl:col-span-12 mb-4">
                                 <label class="inline-block mb-2 text-base font-medium">메모 <span class="text-red-500">*</span></label>
                                <textarea id="memo" name="customerMemo" rows="10" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="메모를 작성하세요."></textarea>
                             </div>
                           
                        <div class="flex justify-end gap-2">
                            <button type="button" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="x" class="lucide lucide-x inline-block size-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg> <span class="align-middle">Cancel</span></button>
                            <button type="submit" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">등록</button>
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
    		fetch('${pageContext.request.contextPath}/room/getRoomInfo?roomNo=' + roomNo)
                .then(response => response.json())
                .then(data => {
                    // 데이터를 화면에 출력
            		console.log("객실 정보:", data);
                    document.getElementById('roomName').textContent = data.roomName;   // 객실 이름
                    document.getElementById('roomType').textContent = data.roomType;   // 객실 이름
	                document.getElementById('roomCapacity').textContent = data.roomCapacity; // 최대 수용 인원
	                document.getElementById('pricePerNight').textContent = data.pricePerNight; // 1박당 가격
	                document.getElementById('roomDesc').textContent = data.roomDesc; // 객실 설명
	                document.getElementById('roomImg').src = "${pageContext.request.contextPath}/upload/" + data.fileName; // 객실 이미지
                })
                .catch(error => {
                    console.error("오류 발생. 에러 메시지: ", error);
                });
        }
    }
    
    document.getElementById("RsvCustomerName").addEventListener("change", function() {
        let customerName = this.value;
        let encodedCustomerName = encodeURIComponent(customerName); // 한글을 URL 인코딩

        fetch('/pettopia/customer/getCustomerNo/' + encodedCustomerName) // 인코딩된 값으로 요청
            .then(response => {
                if (!response.ok) {
                    throw new Error('서버 오류: ' + response.statusText);
                }
                return response.json(); // 응답을 JSON으로 변환
            })
            .then(data => {
                if (data.success) {
                    console.log('고객 번호:', data.customerNo);
                    // customerNo 값을 hidden input 필드에 삽입
                    document.querySelector('input[name="customerNo"]').value = data.customerNo;
                } else {
                    console.error('오류:', data.message);
                }
            })
            .catch(error => {
                console.error('서버 오류:', error); // 오류 메시지 출력
            });
    });

</script>

<script>
    // 기본값 설정
    document.addEventListener("DOMContentLoaded", function() {
        const today = new Date();

        // 한국 시간대(UTC+09:00)로 변환
        const koreaOffset = 9 * 60; // UTC+9 시간대 차이 (분 단위)

        // checkIn: 오늘 날짜 오후 3시로 설정
        today.setHours(15, 0, 0, 0); // 오후 3시로 설정
        const checkInValue = new Date(today.getTime() + koreaOffset * 60 * 1000).toISOString().slice(0, 16); // 한국 시간으로 변환 후 yyyy-mm-ddThh:mm 형식으로 변환
        document.getElementById("checkIn").value = checkInValue;

        // checkOut: 오늘 날짜 오전 11시로 설정
        today.setHours(11, 0, 0, 0); // 오전 11시로 설정
        const checkOutValue = new Date(today.getTime() + koreaOffset * 60 * 1000).toISOString().slice(0, 16); // 한국 시간으로 변환 후 yyyy-mm-ddThh:mm 형식으로 변환
        document.getElementById("checkOut").value = checkOutValue;
    });
</script>




</body>

</html>