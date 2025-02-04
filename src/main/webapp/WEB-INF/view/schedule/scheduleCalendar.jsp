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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    .fc-daygrid-more-link {
        color: black;
    }
    .fc-day-sun{
        color: red;
    }
    .fc-day-sat{
        color: blue;
    }
    :root {
    	--fc-event-text-color: inherit; /* 초기값으로 설정 */
    	--fc-list-event-hover-bg-color: inherit;
	}
	
	.fc-timegrid-axis-frame {
	    display: flex; /* Flexbox를 사용 */
	    justify-content: normal; /* 기본 정렬로 설정하여 justify-content를 해제 */
	    align-items: center; /* 수직 중앙 정렬 */
	}
	
	.fc-event.text-green-500 {
	    --fc-event-border-color: #4CAF50; /* 초록색 */
	}
	
	.fc-event.text-yellow-500 {
	    --fc-event-border-color: #FFC300; /* 노란색 */
	}
	
	.fc-event.text-sky-500 {
	    --fc-event-border-color: #1E90FF; /* 하늘색 */
	}
	
	.fc-event.text-purple-500 {
	    --fc-event-border-color: #9B59B6; /* 보라색 */
	}
	
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
                        <h5 class="title-font">일정 관리</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="${pageContext.request.contextPath}/schedule/scheduleCalendar" class="text-slate-400">일정 관리</a>
                        </li>
                        <li class="text-slate-700">
                            일정 (캘린더)
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                
                <div class="grid grid-cols-1 gap-x-5 xl:grid-cols-12">
                    <div class="xl:col-span-9">
                        <div class="card" style="min-height: 800px;">
                            <div class="card-body">
                                <div class="form-group">
								    <div id='calendar-container'>
								        <div id="calendar"></div>
								    </div>
								</div>
                            </div>
                        </div>
                    </div><!--end col-->
                    
                    <div class="xl:col-span-3">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="mb-4 text-15">일정 카테고리</h6>
                                <div class="flex flex-col gap-3 mb-4">
                                    <button type="button" data-schedule-type="" class='categoryBtn text-custom-500 btn bg-custom-100 hover:text-white hover:bg-custom-600 focus:text-white focus:bg-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:ring active:ring-custom-100'>
                                        전체 일정
                                    </button>
                                    <button type="button" data-schedule-type="I" class='categoryBtn text-green-500 bg-green-100 btn hover:text-white hover:bg-green-600 focus:text-white focus:bg-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:ring active:ring-green-100'>
                                        개인 일정
                                    </button>
                                    <button type="button" data-schedule-type="T" class='categoryBtn text-yellow-500 bg-yellow-100 btn hover:text-white hover:bg-yellow-500 focus:text-white focus:bg-yellow-500 focus:ring focus:ring-yellow-100 active:text-white active:bg-yellow-600 active:ring active:ring-yellow-100'>
                                        팀 일정
                                    </button>
                                    <button type="button" data-schedule-type="V" class='categoryBtn text-sky-500 btn bg-sky-100 hover:text-white hover:bg-sky-500 focus:text-white focus:bg-sky-500 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:ring active:ring-sky-100'>
                                        휴가 계획
                                    </button>
                                    <button type="button" data-schedule-type="C" class='categoryBtn text-purple-500 bg-purple-100 btn hover:text-white hover:bg-purple-600 focus:text-white focus:bg-purple-600 focus:ring focus:ring-purple-100 active:text-white active:bg-purple-600 active:ring active:ring-purple-100'>
                                        회의 일정
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end grid-->
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
        
		<!-- schedule Modal -->
		<div id="scheduleModal" class="modal" style="display: none; position: fixed; z-index: 3; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0, 0, 0, 0.5); ">
		    <div class="modal-content" style="background-color: #fefefe; margin: 15% auto; border: 1px solid #888; width: 30%; border-radius: 5px;">
		    	<!-- Modal Header -->
		        <div class="modal-header flex items-center justify-between p-4 bg-slate-100 border-b" style="border-top-left-radius: 5px; border-top-right-radius: 5px;">
		            <h4 class="text-16 mr-auto">일정 추가</h4>
		        </div>
		        
		        <!-- Modal Content -->
		        <div class="modal-body max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            
		            <div class="xl:col-span-12 mb-4">
                        <label class="inline-block mb-2 text-base font-medium" style="font-weight: bold;">카테고리 선택</label>
                        <select required="" id="scheduleType" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" style="width: 40%">
                            <option>유형을 선택하세요</option>
		                    <option value="I">* 개인 일정</option>
		                    <option value="T">* 팀 일정</option>
		                    <option value="V">* 휴가 계획</option>
		                    <option value="C">* 회의 일정</option>
                        </select>
                    </div>
		            
		            
		            <div class="xl:col-span-12">
                        <label class="inline-block mb-2 text-base font-medium" style="font-weight: bold;">내용 입력</label>
                        <input type="text" id="scheduleTitle" class="form-input border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400" placeholder="내용을 입력하세요" required="">
		            </div>
		        </div>
		        
		        <!-- Modal Footer -->
		        <div class="modal-footer flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id="cancelBtn" type="button" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                취소<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        	<button id="addScheduleBtn" type="button" class="text-custom-500 bg-white btn hover:text-custom-500 hover:bg-custom-100 focus:text-custom-500 focus:bg-custom-100 active:text-custom-500 active:bg-custom-100">
		                저장
		            </button>
		        </div>
		    </div>
		</div>

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

<!-- calendar min js -->
<script src="${pageContext.request.contextPath}/assets/libs/fullcalendar/index.global.min.js"></script>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/pages/schedule-calendar.init.js"></script>  -->

<script>
$(document).ready(function () {
	
	var contextPath = '${pageContext.request.contextPath}';
	
	function openModal() {
	    document.getElementById('scheduleModal').style.display = 'block';
	}

	function closeModal() {
	    document.getElementById('scheduleModal').style.display = 'none';
	}
	
	$('#cancelBtn').on('click', function() {
        closeModal(); // 모달 닫기
    });
	
    // ESC 키로 모달 닫기
    $(document).on('keydown', function (e) {
        if (e.key === "Escape") { // ESC 키가 눌리면
            closeModal();
        }
    });
    
    $(document).on('keydown', function (e) {
        if (e.key === "Enter") {
            // 모달이 열려있는 상태에서만
            if ($('#scheduleModal').is(':visible')) {
                // 현재 포커스가 addScheduleBtn 버튼이 아닐 경우에만 클릭 이벤트 실행
                if (document.activeElement !== document.getElementById('addScheduleBtn')) {
                    document.getElementById('addScheduleBtn').click(); // 버튼 클릭 이벤트 실행
                }
            }
        }
    });

	var empNo = "${empNo}";
	
    let calendarTag = $('#calendar')[0];                    // full-calendar 생성하기
    let calendar = new FullCalendar.Calendar(calendarTag, {
        height: '750px',                        // calendar 높이 설정
        expandRows: true,                       // 화면에 맞게 높이 재설정
        slotMinTime: '00:00',                   // Day 캘린더에서 시작 시간
        slotMaxTime: '23:59',                   // Day 캘린더에서 종료 시간

        customButtons: {                        // 사용자가 만드는 버튼
            testButton: {
                text: "테스트버튼"
            }
        },
        // 해더에 표시할 툴바
        headerToolbar: {                                // customButton 은 left 또는 right 안에 넣으면 적용 된다
            left: 'prevYear,prev,next,nextYear today',  // today는 , 와 띄어쓰기에 따라서 위치가 바뀐다
            // left: 'prev,next,today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        buttonText: {
        	today : 'Today',
        	dayGridMonth : 'Month',
        	timeGridWeek : 'Week',
        	timeGridDay : 'Day',
        	listWeek : 'List'
        },
        initialView: 'dayGridMonth',    // 로드 될때 캘린더 화면 기본 설정
        // initialDate: '2025-01-26',   // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true,                 // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true,                 // default : false 이벤트 드래그 등의 편집여부를 설정함
        selectable: true,               // 일자 드래그 설정
        nowIndicator: true,             // 현재 시간 마크
        dayMaxEvents: true,             // 이벤트가 많아지면 + 로 이벤트 표시
        locale: 'ko',                   // 한국어 설정
        eventAdd: function (obj) {      // 이벤트 추가 시 발생
            console.log("eventAdd : " + obj);
        },
        eventChange: function (obj) {    // 이벤트 수정 시 발생
            console.log("eventChange : " + obj);
        },
        eventRemove: function (obj) {     // 이벤트 삭제 시 발생
            console.log("eventRemove : " + obj);
        },
        select: function (arg) { // 일자를 드래그하면 실행됨
            openModal(); // 모달 열기

            // 저장 버튼 클릭 시
            document.getElementById('addScheduleBtn').onclick = function() {
                let scheduleTitle = document.getElementById('scheduleTitle').value;
                let scheduleType = document.getElementById('scheduleType').value;
                
                if (scheduleTitle) {
                    let newData = {
                        empNo: empNo, // empNo를 적절히 설정
                        scheduleTitle: scheduleTitle,
                        scheduleType: scheduleType,
                        startDatetime: arg.start.toISOString(),
                        endDatetime: arg.end ? arg.end.toISOString() : null,
                        allDay: arg.allDay
                    };

                    $.ajax({
                        url: "/pettopia/addSchedule",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify(newData),
                        contentType: 'application/json',
                        success: function (data) {
                            if (data) {
                                // 캘린더에 새 이벤트 추가
                                calendar.addEvent({
                                    empNo: data.empNo,
                                    scheduleTitle: data.scheduleTitle,
                                    start: data.startDatetime,
                                    end: data.endDatetime,
                                    allDay: data.allDay,
                                    editable: true
                                });

                                // 모달 닫기 및 입력 필드 초기화
                                closeModal();
                                document.getElementById('scheduleTitle').value = '';
                                document.getElementById('scheduleType').value = '';
                                
                             	// 페이지 리로드
                                location.reload(); // 페이지 새로고침
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("Error:", xhr.responseText); // 에러 응답 확인
                            alert("일정 추가 중 오류가 발생했습니다.");
                        }
                    });
                }
                
                calendar.unselect(); // 선택 상태 해제
            };
        },
        eventClick: function (arg) {
            // 일정 클릭 시
            if (confirm("선택한 일정을 삭제하시겠습니까?")) {
                $.ajax({
                    type: "DELETE",
                    url: contextPath + "/removeSchedule",
                    data: {"scheduleNo" : arg.event.id},
                    success: function (data) {
                        if (data == "success") {
                            alert("삭제하였습니다.");
                            arg.event.remove();
                        }else{
                            alert("오류가 발생하였습니다");
                        }
                    }
                })
            }
        },
        eventDrop: function(arg) {              // 일정을 이동시킬때, 드래그하여 시작일과 종료일이 변경되는 경우 동작
            let event = {
                id: arg.event.scheduleNo,
                title: arg.event.title,
                start: arg.event._instance.range.start,
                end: arg.event._instance.range.end ? arg.event._instance.range.end : null,
             	allDay: arg.event.allDay ? "Y" : "N" // boolean 값을 "Y" 또는 "N"으로 변환
            };
            $.ajax({
                url: contextPath + '/modifySchedule/' + arg.event.id,
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(event)
            });
        },
        eventResize: function(arg) {            // 일정의 크기를 변경시킬때 동작(일정을 늘릴때)
            let event = {
                id: arg.event.scheduleNo,
                title: arg.event.title,
                start: arg.event._instance.range.start,
                end: arg.event._instance.range.end ? arg.event._instance.range.end : null,
                allDay: arg.event.allDay ? "Y" : "N" // boolean 값을 "Y" 또는 "N"으로 변환
            };
            $.ajax({
                url: contextPath + '/modifySchedule/' + arg.event.id,
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(event)
            });
        },
        // 이벤트
        events: function(fetchInfo, successCallback, failureCallback) {
            $.ajax({
                type: "get",
                url: "/pettopia/scheduleList/" + empNo,
                success: function (data) {
                    const events = data.map(item => {
                        let classNames = '';

                        // 일정 유형에 따라 클래스 추가
                        switch (item.scheduleType) {
		                    case 'I':
		                        classNames = 'text-green-500 bg-green-100 border border-green-100 hover:text-white hover:bg-green-600 hover:border-green-600';
		                        break;
		                    case 'T':
		                        classNames = 'text-yellow-500 bg-yellow-100 border border-yellow-100 hover:text-white hover:bg-yellow-500 hover:border-yellow-500';
		                        break;
		                    case 'V':
		                        classNames = 'text-sky-500 bg-sky-100 border border-sky-100 hover:text-white hover:bg-sky-500 hover:border-sky-500';
		                        break;
		                    case 'C':
		                        classNames = 'text-purple-500 bg-purple-100 border border-purple-100 hover:text-white hover:bg-purple-500 hover:border-purple-500';
		                        break;
		                    default:
		                        classNames = ''; // 기본 클래스
		                }

                        return {
                            id: item.scheduleNo,
                            title: item.scheduleTitle,
                            start: item.startDatetime,
                            end: item.endDatetime,
                            allDay: item.allDay === "Y", // "Y"일 경우 true
                            classNames: classNames // CSS 클래스 추가
                        };
                    });
                    successCallback(events); // 성공적으로 가져온 이벤트를 캘린더에 추가
                },
                error: function() {
                    failureCallback(); // 에러 발생 시 호출
                }
            });
        }
    });
    

 	// 버튼 클릭 이벤트
    $('.categoryBtn').on('click', function() {
	    const typeCode = $(this).data('schedule-type'); // data-schedule-type 속성에서 값 가져오기
	    fetchEvents(typeCode); // typeCode를 fetchEvents에 전달
	});
 	
    function fetchEvents(scheduleType) {
        $.ajax({
            type: "get",
            url: "/pettopia/scheduleList/" + empNo + (scheduleType ? "?scheduleType=" + scheduleType : ""),
            success: function (data) {
                const events = data.map(item => {
                    let classNames = '';

                    // 일정 유형에 따라 클래스 추가
                    switch (item.scheduleType) {
                        case 'I':
                            classNames = 'text-green-500 bg-green-100 border border-green-100 hover:text-white hover:bg-green-600 hover:border-green-600';
                            break;
                        case 'T':
                            classNames = 'text-yellow-500 bg-yellow-100 border border-yellow-100 hover:text-white hover:bg-yellow-500 hover:border-yellow-500';
                            break;
                        case 'V':
                            classNames = 'text-sky-500 bg-sky-100 border border-sky-100 hover:text-white hover:bg-sky-500 hover:border-sky-500';
                            break;
                        case 'C':
                            classNames = 'text-purple-500 bg-purple-100 border border-purple-100 hover:text-white hover:bg-purple-500 hover:border-purple-500';
                            break;
                        default:
                            classNames = ''; // 기본 클래스
                    }

                    return {
                        id: item.scheduleNo,
                        title: item.scheduleTitle,
                        start: item.startDatetime,
                        end: item.endDatetime,
                        allDay: item.allDay === "Y", // "Y"일 경우 true
                        classNames: classNames // CSS 클래스 추가
                    };
                });
                calendar.removeAllEvents(); // 이전 이벤트 제거
                calendar.addEventSource(events); // 필터링된 이벤트 추가
            },
            error: function() {
                console.error("일정 데이터를 가져오는 데 실패했습니다.");
            }
        });
    }
 
    // 캘린더 랜더링
    calendar.render();
    
});
</script>

</body>

</html>