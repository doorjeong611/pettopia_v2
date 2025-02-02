<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!-- 시큐리티 세션 사용을 위한 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 시큐리티 세션정보 접근 -->
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="loginEmp"/></sec:authorize>


<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>Meeting Room One</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

    <style>
    textarea {
	    resize: none;
	    overflow: auto; 
	}
    </style>
<script type="text/javascript">
    // 메시지가 있을 경우 경고창을 띄움
    window.onload = function() {
        var message = "${errorMessage}";
        if (message) {
            alert(message);
        }
    }
</script>
<script>
$(document).ready(function() {
    
    // ${loginEmp.roleName} == 'ROLE_ADMIN' 수정하도록 readonly 제거
    $('#modify').on('click', function() {
        $('input, textarea').removeAttr('readonly');
        $('#file').removeClass('hidden');
        $('input, textarea').removeClass('border-none focus:outline-none');
        $('input, textarea').addClass('border-slate-200 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 disabled:border-slate-300 disabled:text-slate-500 placeholder:text-slate-400 dark:placeholder:text-zink-200');
        
        
    });
    
    /* 이미지 확인 모달 */
    console.log($('#roomImg img').length);
    
    const modal = $('#modal');
    const modalImage = $('#modalImage');
    const closeModalBtn = $("#closeModal");
    const modalBackground = $("#modalBackground");
    
    // 이미지 클릭 시 모달 열기
    $('#roomImg').on('click', function() {
        console.log('이미지 클릭');
        modal.removeClass('hidden');
    });

    // 모달 닫기
    function closeModal() {
        modal.addClass("hidden");
        $('body').removeClass('overflow-hidden');
    }

    // 닫기 버튼
    closeModalBtn.click(closeModal);
    modalBackground.click(closeModal);
    
    // Cancel 버튼 클릭 시
    $('#cancel').on('click', function() {
        console.log('취소취소');
        
        // 서버에서 값을 받아올 때 따옴표로 감싸주는 방법
        const originalRoomName = "${roomInfo.roomName}";
        const originalRoomCapacity = "${roomInfo.roomCapacity}";
        const originalRoomLocation = "${roomInfo.roomLocation}";
        const originalRoomInfo = `${fn:escapeXml(roomInfo.roomInfo)}`; // 개행문자가 포함되어 있으므로 `백틱`,  escapeXml사용

        
        // input, textarea 값을 원래 값으로 되돌리기
        $('#roomName').val(originalRoomName);
        $('#roomCapacity').val(originalRoomCapacity);
        $('#pricePerNight').val(originalRoomLocation);
        $('#roomInfo').val(originalRoomInfo);

        // 파일 입력 초기화 (파일 첨부 초기화)
        $('input[type="file"]').val('');
    });    
});
</script>

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
                        <h5 class="text-16">${roomInfo.roomName} 호</h5>
                    </div>
                </div>
                <!-- Main content -->
               <div class="card">
                    <div class="card-body">
                        <form id="formUpdateMeetingRoom" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/meetingroom/modifyMeetingRoom" onsubmit="return validateForm(event);">
                        <!-- 수정 시 필요한 roomNo  -->
                        <input type="hidden" name="roomNo" value="${roomInfo.roomNo}">
                        <input type="hidden" name="roomImgNo" value="${roomInfo.roomImgNo}">
                            <div class="grid grid-cols-1 gap-x-5 md:grid-cols-4 xl:grid-cols-4">
                                
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">회의실 이름<span class="text-red-500">*</span></label>
                                    <input type="text" id="roomName" name="roomName" readonly class="form-input border-none focus:outline-none  placeholder:text-slate-400" placeholder="회의실 이름을 입력하세요." value="${roomInfo.roomName}">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">수용 인원<span class="text-red-500">*</span></label>
                                    <input type="text" id="roomCapacity" name="roomCapacity" readonly class="form-input border-none focus:outline-none  placeholder:text-slate-400" placeholder="최대 수용인원을 입력하세요" value="${roomInfo.roomCapacity}">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">위치<span class="text-red-500"> *</span></label>
                                    <input type="text" id="roomLocation" name="roomLocation" readonly class="form-input border-none focus:outline-none  placeholder:text-slate-400" placeholder="1박 당 가격을 입력하세요" value="${roomInfo.roomLocation}">
                                </div>
                                <div class="mb-4">
                                    <label class="inline-block mb-2 text-base font-medium">회의실 이미지 </label>
                                    <div>
                                    	<button type="button" id="roomImg" class="mr-1 bg-white text-slate-500 btn border-slate-500 hover:text-white hover:bg-slate-600 hover:border-slate-600 focus:text-white focus:bg-slate-600 focus:border-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:border-slate-600 active:ring active:ring-slate-100" >회의실 이미지 확인</button>
                                		
                                	</div>
                                </div>
                            </div>
                           
                            <div class="lg:col-span-2 xl:col-span-12 mb-4">
                                  <label class="inline-block mb-2 text-base font-medium">회의실 정보 <span class="text-red-500">*</span></label>
                                  <textarea readonly rows="10" id="roomInfo" name="roomInfo" class="form-input border-none focus:outline-none  placeholder:text-slate-400">${roomInfo.roomInfo}</textarea>
                            </div>
                            
                            
                      
                            <div class="lg:col-span-2 xl:col-span-12 mb-4 hidden" id="file">
								<label class="inline-block mb-2 text-base font-medium">파일 첨부<span class="text-red-500">*</span></label>
								<input readonly name="roomImg" type="file" class="cursor-pointer form-file border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500">	
							</div>
                            
					  <c:if test="${loginEmp.roleName == 'ROLE_ADMIN' }">  	
	                        <div class="flex justify-end gap-2">
	                            <button type="button" id="cancel" class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="x" class="lucide lucide-x inline-block size-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg> <span class="align-middle">되돌리기</span></button>
	                            <button type="button" id="modify" class="mr-1 bg-white text-slate-500 btn border-slate-500 hover:text-white hover:bg-slate-600 hover:border-slate-600 focus:text-white focus:bg-slate-600 focus:border-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:border-slate-600 active:ring active:ring-slate-100">수정</button>
	                            <button type="submit" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">저장</button>
	                        </div>
                       </c:if>   
                        
                        
                        
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


  
        <!-- 이미지 상세보기 모달  -->
		<div id="modal" class="hidden">
		    <!-- 모달 배경 : 바깥 부분 클릭해서 모달창 닫기 -->
		    <div id="modalBackground" class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;"></div>
		
		    <div class="fixed inset-0 flex items-center justify-center z-[1000] p-4">
		    	<div class="w-screen md:w-[40rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col ">
		    		<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">
				         <div class="">${roomInfo.roomName}</div>
				         <button type="button" id="closeModal" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
				         	&#10060;
				         </button>
				  	</div>
		    	
			         <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
			            <img id="modalImage" src="${pageContext.request.contextPath}/meetingRoomFile/${roomInfo.fileName}" alt="확대 이미지" >
			           
			        </div>
		        </div>
		    </div>
		</div>
        




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
// 등록 버튼 클릭 시 모든 값이 다 있는지 확인
function validateForm(event) {
    event.preventDefault(); // 기본 폼 제출 방지

    
    const roomName = document.getElementById('roomName')?.value.trim() || null;
    const roomCapacity = document.getElementById('roomCapacity')?.value.trim() || null;
    const roomLocation = document.getElementById('roomLocation')?.value.trim() || null;
    const roomInfo = document.getElementById('roomInfo')?.value.trim() || null;
   

    // 필수 입력값 검사

    if (!roomName) {
        alert('회의실 이름을 입력하세요.');
        return false;
    }

    if (!roomCapacity) {
        alert('수용 인원을 입력하세요.');
        return false;
    }
    if (!roomLocation) {
        alert('회의실 위치를 입력하세요.');
        return false;
    }

    if (!roomInfo) {
        alert('회의실 정보를 입력하세요.');
        return false;
    }


    // 모든 필드가 정상적으로 입력된 경우 폼 제출
    document.getElementById('formUpdateMeetingRoom').submit();
    return true;
}


</script>

</body>

</html>