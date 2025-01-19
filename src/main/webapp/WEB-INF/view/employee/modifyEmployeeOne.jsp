<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 시큐리티 세션 사용을 위한 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 시큐리티 세션정보 접근 -->
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="loginEmp"/></sec:authorize>




<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical"
	data-sidebar="light" data-sidebar-size="lg" data-mode="light"
	data-topbar="light" data-skin="default" data-navbar="sticky"
	data-content="fluid" dir="ltr">

<head>
<meta charset="utf-8">
<title>PetTopia</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta content="Minimal Admin & Dashboard Template" name="description">
<meta content="Themesdesign" name="author">
<!-- App favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
<!-- Layout config Js -->
<script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
<!-- Tailwind CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/tailwind2.css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- kakaoMap -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>	
	

<script>
	/* 카카오맵 주소 api  */
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	
	
	
</script>

 

</head>

<body
	class="text-base bg-body-bg text-body font-public dark:text-zink-100 dark:bg-zink-800 group-data-[skin=bordered]:bg-body-bordered group-data-[skin=bordered]:dark:bg-zink-700">
	<div
		class="group-data-[sidebar-size=sm]:min-h-sm group-data-[sidebar-size=sm]:relative">

		<!-- Left Sidebar Start -->
		<div
			class="app-menu w-vertical-menu bg-vertical-menu ltr:border-r rtl:border-l border-vertical-menu-border fixed bottom-0 top-0 z-[1003] transition-all duration-75 ease-linear group-data-[sidebar-size=md]:w-vertical-menu-md group-data-[sidebar-size=sm]:w-vertical-menu-sm group-data-[sidebar-size=sm]:pt-header group-data-[sidebar=dark]:bg-vertical-menu-dark group-data-[sidebar=dark]:border-vertical-menu-dark group-data-[sidebar=brand]:bg-vertical-menu-brand group-data-[sidebar=brand]:border-vertical-menu-brand group-data-[sidebar=modern]:bg-gradient-to-tr group-data-[sidebar=modern]:to-vertical-menu-to-modern group-data-[sidebar=modern]:from-vertical-menu-form-modern group-data-[layout=horizontal]:w-full group-data-[layout=horizontal]:bottom-auto group-data-[layout=horizontal]:top-header hidden md:block print:hidden group-data-[sidebar-size=sm]:absolute group-data-[sidebar=modern]:border-vertical-menu-border-modern group-data-[layout=horizontal]:dark:bg-zink-700 group-data-[layout=horizontal]:border-t group-data-[layout=horizontal]:dark:border-zink-500 group-data-[layout=horizontal]:border-r-0 group-data-[sidebar=dark]:dark:bg-zink-700 group-data-[sidebar=dark]:dark:border-zink-600 group-data-[layout=horizontal]:group-data-[]:absolute group-data-[layout=horizontal]:group-data-[navbar=bordered]:top-[calc(theme('spacing.header')_+_theme('spacing.4'))] group-data-[layout=horizontal]:group-data-[navbar=bordered]:inset-x-4 group-data-[layout=horizontal]:group-data-[navbar=hidden]:top-0 group-data-[layout=horizontal]:group-data-[navbar=hidden]:h-16 group-data-[layout=horizontal]:group-data-[navbar=bordered]:w-[calc(100%_-_2rem)] group-data-[layout=horizontal]:group-data-[navbar=bordered]:[&.sticky]:top-header group-data-[layout=horizontal]:group-data-[navbar=bordered]:rounded-b-md group-data-[layout=horizontal]:shadow-md group-data-[layout=horizontal]:shadow-slate-500/10 group-data-[layout=horizontal]:dark:shadow-zink-500/10 group-data-[layout=horizontal]:opacity-0">
			<c:import url="/WEB-INF/view/inc/leftSidebar.jsp"></c:import>
		</div>
		<!-- Left Sidebar End -->

		<div id="sidebar-overlay"
			class="absolute inset-0 z-[1002] bg-slate-500/30 hidden"></div>
		<header id="page-topbar"
			class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm group-data-[layout=horizontal]:ltr:left-0 group-data-[layout=horizontal]:rtl:right-0 fixed right-0 z-[1000] left-0 print:hidden group-data-[navbar=bordered]:m-4 group-data-[navbar=bordered]:[&.is-sticky]:mt-0 transition-all ease-linear duration-300 group-data-[navbar=hidden]:hidden group-data-[navbar=scroll]:absolute group/topbar group-data-[layout=horizontal]:z-[1004]">
			<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		</header>

		<div
			class="relative min-h-screen group-data-[sidebar-size=sm]:min-h-sm">
			<div class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
				
				<!--  -->
<div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">
  <!-- Header -->
  <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
    <div class="grow">
      <h5 class="text-16">메인 화면</h5>
    </div>
    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
      <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1 before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
        <a href="#!" class="text-slate-400 dark:text-zink-200">메인 화면</a>
      </li>
      <li class="text-slate-700 dark:text-zink-100">템플릿</li>
    </ul>
  </div>

  <!-- Main Form -->
  <form action="${pageContext.request.contextPath}/employee/modifyEmployeeOne" class="create-form" method="post" enctype="multipart/form-data" id="modifyEmployeeForm">
    <div class="xl:col-span-9">
      <div class="card">
        <div class="card-body">
          <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">

            <!-- Hidden Fields -->
            <input type="hidden" value="" name="id" id="id">
            <input type="hidden" value="add" name="action" id="action">
            <input type="hidden" id="id-field">

            <!-- 에러메세지 -->
            <div id="alert-error-msg" class="hidden px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-500/20"></div>

            <!-- 직원 프로필 사진  -->
            <div class="relative mx-auto mb-4 rounded-full shadow-md size-24 bg-slate-100 profile-user dark:bg-zink-500">
              <img id="profileImg" src="${pageContext.request.contextPath }/employeeFile/${fileName}" alt="" class="object-cover w-15 h-15 rounded-full user-profile-image">
              <div class="absolute bottom-0 flex items-center justify-center rounded-full size-8 ltr:right-0 rtl:left-0 profile-photo-edit">
                <input id="profile-img-file-input" name="employeeFile" type="file" class="hidden profile-img-file-input" accept="image/*">
                <input type="hidden" name="empFileNo" value="${empFileNo}">
                <label for="profile-img-file-input" class="flex items-center justify-center bg-white rounded-full shadow-lg cursor-pointer size-8 dark:bg-zink-600 profile-photo-edit">
                  <i data-lucide="image-plus" class="size-4 text-slate-500 fill-slate-200 dark:text-zink-200 dark:fill-zink-500"></i>
                </label>
              </div>
            </div>

            <!-- 직원 정보 입력 -->
            <div class="grid grid-cols-1 gap-4 xl:grid-cols-12">
              <!-- 사번 : 자동입력 -->
              <div class="xl:col-span-4">
                <label for="employeeId" class="inline-block mb-2 text-base font-medium">직원 번호</label>
                <input type="number" name="empNo" id="employeeId" class="form-input border-slate-200 dark:border-zink-500" value="${loginEmp.username}" readOnly>
             	<input type="hidden" name="empStatus" value="${empStatus}">
              </div>

              <!-- 이름 -->
              <div class="xl:col-span-4">
                <label for="employeeInput" class="inline-block mb-2 text-base font-medium">이름</label>
                <input type="text" name="empName" id="employeeInput" class="form-input border-slate-200 dark:border-zink-500" value="${empForm.empName }" required>
              </div>

              <!-- 생년월일 -->
              <div class="xl:col-span-4">
                <label for="joiningDateInput1" class="inline-block mb-2 text-base font-medium">생년월일</label>
                <input type="text" name="empBirth" id="joiningDateInput1" class="form-input border-slate-200 dark:border-zink-500" value="${empForm.empBirth }" data-provider="flatpickr" data-date-format="Y-m-d">
              </div>

              <!-- 이메일 -->
              <div class="xl:col-span-4">
                <label for="emailInput" class="inline-block mb-2 text-base font-medium">이메일</label>
                <input type="text" name="empEmail" id="emailInput" class="form-input border-slate-200 dark:border-zink-500" value="${empForm.empEmail}" required>
              </div>

              <!-- 연락처 -->
              <div class="xl:col-span-4">
                <label for="phoneNumberInput" class="inline-block mb-2 text-base font-medium">연락처</label>
                <div class="flex gap-2">
                  <select name="empPhoneF" class="form-input border-slate-200 dark:border-zink-500">
                    <option value="010" ${empForm.empPhoneF == '010' ?  'selected' : '' } >010</option>
                    <option value="011" ${empForm.empPhoneF == '011' ?  'selected' : '' } >011</option>
                  </select>
                  <input type="text" name="empPhoneM" id="phoneNumberInput1" class="form-input border-slate-200 dark:border-zink-500" value="${empForm.empPhoneM}" required>
                  <input type="text" name="empPhoneL" id="phoneNumberInput2" class="form-input border-slate-200 dark:border-zink-500" value="${empForm.empPhoneL}" required>
                </div>
              </div>

              <!-- 성별 -->
				<div class="xl:col-span-4">
				  <label class="block text-base font-medium mb-2" style=" margin-bottom: 15px;">성별</label>
				  <div class="flex items-center space-x-4">
				    <label class="flex items-center space-x-2" style="margin-right: 30px;">
				      <input type="radio" name="empGender" value="M"  ${empForm.empGender == 'M' ? 'checked' : ''} class="h-5 w-5 text-blue-600 border-gray-300 focus:ring-blue-500" style="margin-left: 10px;">
				      <span>남성</span>
				    </label>
				    <label class="flex items-center space-x-2">
				      <input type="radio" name="empGender" value="F"  ${empForm.empGender == 'F' ? 'checked' : ''} class="h-5 w-5 text-pink-600 border-gray-300 focus:ring-pink-500"> 
				    	
				      <span>여성</span>
				    </label>
				  </div>
				</div>

              <!-- 주소 -->          
				<div class="xl:col-span-4">
				  <label for="locationInput" class="inline-block mb-2 text-base font-medium">
				    주소
				  </label>
				  <div class="grid gap-2">
				    <!-- 우편번호와 버튼 -->
				    <div class="flex items-center space-x-2">
				      <input type="text" name="postalCode" id="sample6_postcode" value="${empForm.postalCode }" readonly class="flex-grow border border gray-300 rounded-md px-2 py-1">
				      <!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: #3B82F6; color: white;" >  -->
				      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: #3B82F6; color: white; padding: 5px 10px; font-size: 13px; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease;">
				    </div>
				
				    <!-- 주소 입력 -->
				    <input type="text" name="basicAddress" id="sample6_address" value="${empForm.basicAddress }" required class="border border-gray-300 rounded-md px-2 py-1">
				    <input type="text"  name="detailAddress"  id="sample6_detailAddress" value="${empForm.detailAddress}" required class="border border-gray-300 rounded-md px-2 py-1">
				    <input type="text" name="dong" id="sample6_extraAddress" value="${empForm.dong }" required class="border border-gray-300 rounded-md px-2 py-1">
				  </div>
				</div> 
				
				<!-- 공백 -->
              	<div class="xl:col-span-4">
	                
              	</div>
				
				
				<!-- 비밀번호 -->
              	<div class="xl:col-span-4 mt-6" style="margin-top: 70px;">
	                <label for="employeeInput" class="inline-block mb-2 mt-10 text-base font-medium">비밀번호</label>
	                <input type="text" name="empPw" id="empPw" class="form-input border-slate-200 dark:border-zink-500" value="" required>
              	</div>
              
				             


            </div>

            <!-- 등록 버튼 -->
            <div class="flex justify-end gap-2 mt-4">
              <button type="submit" id="modifyBtn" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button>
            </div>

          </div>
        </div>
      </div>
    </div>
  </form>
</div>
				
				
				
				<!--end add Employee-->
			</div>
			<!-- container-fluid -->
		</div>
		<!-- End Page-content -->

		<!-- loading overlay -->
 		<div id="loading-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 9999; align-items: center; justify-content: center;">
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 0s; margin-right: 10px;"></div>
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 1.5s; margin-right: 10px;"></div> 
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 2s; margin-right: 10px;"></div> 
		</div>




		<!-- Start Footer -->
		<footer
			class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm absolute right-0 bottom-0 px-4 h-14 group-data-[layout=horizontal]:ltr:left-0  group-data-[layout=horizontal]:rtl:right-0 left-0 border-t py-3 flex items-center dark:border-zink-600">
			<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
		</footer>
		<!-- End Footer -->
	</div>

	</div>
	<!-- End Main Content -->
	<c:import url="/WEB-INF/view/inc/customizerButton.jsp"></c:import>

	<script
		src='${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
	<!--apexchart js-->
	<%-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script> --%>
	<!--dashboard ecommerce init js-->
	<%-- <script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script> --%>

	<!-- App js -->
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>
<script>
$(document).ready(function() {

	console.log("목록 스크립트 실행")

	flatpickr("#joiningDateInput1", {
	    dateFormat: "Y-m-d", /*  날짜 형식  */
	    maxDate: new Date(), /*  오늘 날짜까지만 선택 가능 */
	});
	
	
	
	
	/*  제출 전 유효성 검사 */
	$('#modifyBtn').click(function(event) {
		
		/* 프로필 사진 첨부 여부 */
	   /*  
	   if ($('#profile-img-file-input')[0].files.length === 0) {
	        alert('프로필 이미지를 첨부해 주세요.');
	        event.preventDefault(); 
	        return;
	    } 
		*/

	    
	    /*  이름 유효성 검사 */
	   const nameTest = /^[a-zA-Z가-힣]+$/;
	   if($('#employeeInput').val() == null || $('#employeeInput').val() == ''){
			alert('직원 이름을 입력하세요.');
			$('#employeeInput').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
			
		}else if(nameTest.test($('#employeeInput').val()) == false){ /* 이름 정규식 검사 */
			alert('이름에 숫자, 특수문자는 입력할 수 없습니다.');
			$('#employeeInput').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
		}
	   
		/*  생년월일 */
	   const empBirth = document.querySelector("#joiningDateInput1").value;
       
	   /*  오늘 날짜 이상은 선택하지 못하도록 하기 */
	   const today = new Date();
	   const selectedDate = new Date(empBirth);
	   
       if (!empBirth.trim()) {
           alert("날짜를 선택해주세요.");
           document.querySelector("#joiningDateInput1").focus();
           event.preventDefault(); /*  폼 제출 막기 */
           return;
       }
       
       if(selectedDate > today){
    	   alert("잘못된 생년월일입니다. 다시 선택해주세요.");
           document.querySelector("#joiningDateInput1").focus();
           event.preventDefault(); /*  폼 제출 막기 */
           return;
       }

	    
       /*  이메일 유효성 검사 */
	   const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
	    
	   if($('#emailInput').val() == null || $('#emailInput').val() == '' ){
			alert('이메일을 입력하세요.');
			$('#emailInput').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
			
		}else if(emailTest.test($('#emailInput').val()) == false){ /* 이메일 정규식 검사 */
			alert('이메일형식이 올바르지 않습니다.');
			$('#emailInput').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
		}
	   
		/*  연락처 유효성 검사  */
	   if(($('#phoneNumberInput1').val() == '' || $('#phoneNumberInput1').val().length != 4) || ($('#phoneNumberInput2').val() == '' || $('#phoneNumberInput2').val().length != 4)){
		   alert('연락처를 입력해주세요.');
		   $('#phoneNumberInput1').focus();
		   event.preventDefault(); /*  폼 제출 막기 */
		   return;
	   }
	   
		const numTest = /^[0-9]*$/;
		
	   if(numTest.test($('#phoneNumberInput1').val()) == false || numTest.test($('#phoneNumberInput2').val()) == false){ /* 연락처 숫자 정규식 */
		   alert('잘못된 연락처 입니다. 다시 입력해주세요.');
			$('#phoneNumberInput1').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
	   }
	   
	   /* 성별 */
	   if($("input[name=empGender]:radio:checked").length < 1){
		   alert('성별을 선택해주세요.');
			event.preventDefault(); /*  폼 제출 막기 */
			return;
	   }
	   
		
	   /* 주소 유효성 검사 */
	   if( $('#sample6_address').val() == '' || $('#sample6_detailAddress').val() == ''  || $('#sample6_extraAddress').val() == '' ){
		   alert('주소를 입력해주세요.');
			$('#sample6_postcode').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
	   }
	   
	   if(numTest.test($('#sample6_postcode').val()) == false){
		   alert('잘못된 주소 입니다. 다시 입력해주세요.');
			$('#sample6_postcode').focus();
			event.preventDefault(); /*  폼 제출 막기 */
	    	return;
	   }
	       
	       
	    
	    /* 비밀번호 */
	    const passwordTest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; /* 비밀번호 정규식 */
	    
	    if($('#empPw').val() == ""){
	    	alert('비밀번호를 입력하세요.');
	        $('#empPw').focus();
	        event.preventDefault(); /*  폼 제출 막기 */
	        return;
	    }
	    
	    if(passwordTest.test($('#empPw').val()) == false){
	    	alert('비밀번호는 영어,숫자,특수문자를 포함하여 8~16자리로 작성해주세요.');
	    	$('#empPw').focus();
	        event.preventDefault(); /*  폼 제출 막기 */
	        return;
	    }

		console.log('overlay 시작');

	    $('#loading-overlay').css('display', 'flex');   /* 로딩 화면 표시 */
		
		$('#modifyEmployeeForm').submit()    /* 모두 통과시 제출 */ 
		
	});
	
	
	/* 파일 선택 시 프로필 이미지 변경 */
    document.getElementById('profile-img-file-input').addEventListener('change', function(event) {
        const file = event.target.files[0]; 
        
        /* 파일이 선택되면 */
        if (file) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                
                document.getElementById('profileImg').src = e.target.result; /* 첨부한 파일로 이미지 바꾸기 */
            };
            
            reader.readAsDataURL(file);
        }
    });


});
</script>


</html>