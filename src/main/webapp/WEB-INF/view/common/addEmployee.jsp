<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- kakaoMap -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
			<div
				class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
				<div
					class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">
					<div
						class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
						<div class="grow">
							<h5 class="text-16">메인 화면</h5>
						</div>
						<ul class="flex items-center gap-2 text-sm font-normal shrink-0">
							<li
								class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
								<a href="#!" class="text-slate-400 dark:text-zink-200">메인 화면</a>
							</li>
							<li class="text-slate-700 dark:text-zink-100">템플릿</li>
						</ul>
					</div>
					<!-- Main content -->
					<form action="${pageContext.request.contextPath}/addEmployee" class="create-form" method="post" enctype="multipart/form-data">
						<div class="xl:col-span-9">
							<div class="card">
								<div class="card-body">
									<div
										class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">


						<!-- 이 부분은 뭔지.. 확인하기 -->
										<input type="hidden" value="" name="id" id="id"> <input
											type="hidden" value="add" name="action" id="action">
										<input type="hidden" id="id-field">

										<div id="alert-error-msg"
											class="hidden px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-500/20"></div>
										<!-- border 스타일 지우기! -->
										<div class="grid grid-cols-1 gap-4 xl:grid-cols-12"
											style="border: 1px solid red;">

											<!-- 직원 사진 등록 -->
											<!-- <div class="xl:col-span-12" style="border: 1px solid green;"> -->
											<div
												class="relative mx-auto mb-4 rounded-full shadow-md size-24 bg-slate-100 profile-user dark:bg-zink-500">
												<img
													src="data:image/jpeg;base64,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"
													alt=""
													class="object-cover w-full h-full rounded-full user-profile-image">
												<div
													class="absolute bottom-0 flex items-center justify-center rounded-full size-8 ltr:right-0 rtl:left-0 profile-photo-edit">
													<input id="profile-img-file-input"
														name="employeeFile" type="file"
														class="hidden profile-img-file-input"> 
														<label for="profile-img-file-input"
														class="flex items-center justify-center bg-white rounded-full shadow-lg cursor-pointer size-8 dark:bg-zink-600 profile-photo-edit">
														<i data-lucide="image-plus"
														class="size-4 text-slate-500 fill-slate-200 dark:text-zink-200 dark:fill-zink-500"></i>
													</label>
												</div>
											</div>
										</div>
										<!-- 직원 정보 입력 -->
										<div class="xl:col-span-4" id="divEmpNo" style="border: 1px solid skyblue;">
											<label for="employeeId"
												class="inline-block mb-2 text-base font-medium">직원 번호</label> 
												<input type="number" name="empNo" id="employeeId"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												value="">
												<button type="button" id="btnExistEmp" class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-600 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">중복검사</button>
										</div>

										<div class="xl:col-span-4" style="border: 1px solid skyblue;">
											<label for="employeeInput"
												class="inline-block mb-2 text-base font-medium">이름</label> <input
												type="text" name="empName" id="employeeInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Employee name">
										</div>

										<div class="xl:col-span-4" style="border: 1px solid skyblue;">
											<label for="employeeId"
												class="inline-block mb-2 text-base font-medium">비밀번호</label>
											<input type="text" name="empPw" id="employeePw"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												value="">
										</div>

										<!-- 날짜 선택시 Flatpickr 한국어 로컬 설정하기 -->
										<div class="xl:col-span-4" style="border: 1px solid bule;">
											<label for="joiningDateInput"
												class="inline-block mb-2 text-base font-medium">생년월일</label>
											<input type="text" name="empBirth" id="joiningDateInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Select date" data-provider="flatpickr"
												data-date-format="Y-m-d">
										</div>
										<div class="xl:col-span-4" style="border: 1px solid bule;">
											<label for="emailInput"
												class="inline-block mb-2 text-base font-medium">이메일</label>
											<input type="text" name="empEmail" id="emailInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="example@tailwick.com" required>
										</div>
										<div class="xl:col-span-4" style="border: 1px solid bule;">
											<label for="phoneNumberInput"
												class="inline-block mb-2 text-base font-medium">연락처</label>
											<select type="text" name="empPhoneF" id="phoneNumberInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												required>
												<option value="010">010</option>
												<option value="011">011</option>
											</select> - <input type="text" name="empPhoneM" id="phoneNumberInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Enter phone number" required> - <input
												type="text" name="empPhoneL" id="phoneNumberInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Enter phone number" required>
										</div>
										<div class="xl:col-span-4" style="border: 1px solid bule;">
											<label for="phoneNumberInput"
												class="inline-block mb-2 text-base font-medium">성별</label> <label>
												<input type="radio" name="empGender"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Enter phone number" value="M" required>
												남성
											</label> <label> <input type="radio" name="empGender"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Enter phone number" value="F" required>
												여성
											</label>
										</div>
										<!-- 카카오맵 API를 이용하여 주소 입력하기 -->
										<div class="xl:col-span-12" style="border: 1px solid green;">
											<label for="locationInput"
												class="inline-block mb-2 text-base font-medium">주소</label>
										</div>
										<div style="border: 1px solid green;">
											<input type="text" name="postalCode" id="sample6_postcode"
												placeholder="우편번호"> <input type="button"
												onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" name="basicAddress" id="sample6_address"
												placeholder="주소"><br> <input type="text"
												name="detailAddress" id="sample6_detailAddress"
												placeholder="상세주소"> <input type="text" name="dong"
												id="sample6_extraAddress" placeholder="참고항목">
										</div>

										<!-- 끝 : 카카오맵 API를 이용하여 주소 입력하기 -->

										<!-- 날짜 선택시 Flatpickr 한국어 로컬 설정 -->
										<div class="xl:col-span-6" style="border: 1px solid green;">
											<label for="joiningDateInput"
												class="inline-block mb-2 text-base font-medium">입사일</label>
											<input type="text" name="hireDate" id="joiningDateInput"
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												placeholder="Select date" data-provider="flatpickr"
												data-date-format="Y-m-d">
										</div>

										<div class="xl:col-span-12" style="border: 1px solid green;">
											<label for="designationSelect"
												class="inline-block mb-2 text-base font-medium">부서</label> <select
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												name="divisionCode" id="divisionSelect">
												<option value="divisionCode">부서 선택</option>
											</select> <select
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												name="deptCode" id="departSelect">
												<option value="">팀 선택</option>
											</select> <select
												class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
												name="rankNo" id="rankSelect">
												<option value="rankNo">직급 선택</option>
											</select>
										</div>
									</div>
									<div class="flex justify-end gap-2 mt-4">
										<button type="reset" id="btnReset"
											data-modal-close="addEmployeeModal"
											class="text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-600 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10">Cancel</button>
										<button type="submit" id="addNew"
											class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20 ">직원
											등록</button>
									</div>

								</div>
							</div>
						</div>
				</div>
				</form>
				<!--end add Employee-->

			</div>
			<!-- container-fluid -->
		</div>
		<!-- End Page-content -->

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
	<script
		src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

	<!--dashboard ecommerce init js-->
	<script
		src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

	<!-- App js -->
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>
<script>
$(document).ready(function() {

	console.log("목록 스크립트 실행")

	/* 상위부부서를 <select >선택하면 하위 팀 선택하는 <select>rest 사용하기 */
	$
			.ajax({
				url : '/pettopia/common/divisionList',
				method : 'GET'
			})
			.done(
					function(result) {
						console.log($('#divisionSelect')
								.css('display'));
						console.log($('#departSelect').css(
								'visibility'));
						console.log($('#rankSelect').css(
								'opacity'));
						console.log("응답받은 결과:", result);
						$(result)
								.each(
										function(index,
												item) {
											$('#divisionSelect').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
										});
						console.log("typeSelect 내용:", $(
								'#divisionSelect').html()); // 드롭다운 내용 확인
					}).fail(function() {
				alert('부서 호출 실패');
			});

	/* 부서 선택 시 */
	$('#divisionSelect')
			.change(
					function() {

						$.ajax(
								{
								url : '/pettopia/common/departmentList/'+ $('#divisionSelect').val(),
								method : 'GET'
										})
								.done(
										function(result) {
											// 팀 리셋
											$('#departSelect').empty();
											$('#departSelect').append(
															'<option value="">팀 선택</option>');

											$(result)
													.each(
															function(
																	index,
																	item) {
																$(
																		'#departSelect')
																		.append(
																				'<option value="' + item.deptCode + '">'
																						+ item.deptName
																						+ '</option>');
															});

										}).fail(function() {
									alert('팀 호출 실패');
								});
					});

	/* 팀 선택 시 */
	$('#departSelect').change(function() {

			$.ajax({
						url : '/pettopia/common/rankList',
						method : 'GET'
					})
					.done(
							function(result) {
								// 직급 리셋
								$('#rankSelect')
										.empty();
								$('#rankSelect')
										.append(
												'<option value="">직급 선택</option>');

								$(result).each(
										function(
												index,
												item) {
											$(
													'#rankSelect')
													.append(
															'<option value="' + item.rankNo + '">'
																	+ item.rankName
																	+ '</option>');
												});
							}).fail(function() {
						alert('팀 호출 실패');
				});
		});


	/* 직원번호 중복 검사 */
	$('#btnExistEmp').click(function(){
		console.log('/pettopia/common/existEmp/' + $('#employeeId').val());
		$.ajax({
			url: '/pettopia/common/existEmp/' + $('#employeeId').val()
			, method:'GET'
		})
		.done(function(result){
			
			/* 유효성 검사 */
			var empNo = $('#employeeId').val();			
			
		    /* 직원번호가 공백이 아니고 9자리 이상인지 확인 */
		    if(empNo.trim() == "" || empNo.length != 9) {
		        alert("직원 번호는 9자리로 통일해주세요.");
		        return; 
		    }

			
			if(result){ /* true == 등록 가능한 사번 */
				$('#employeeId').attr('readonly', true); /* readOnly로 설정하기 */
				$('#warnExistEmp').remove();
				$('#divEmpNo').append('<div id="warnExistEmp" class="px-4 py-3 text-sm border border-transparent rounded-md text-custom-500 bg-custom-50 dark:bg-custom-400/20"><span class="font-bold">등록 가능</span> 등록 가능한 직원 번호입니다.</div>');
				$('#btnExistEmp').prop('disabled', true); /* 버튼 비활성화 */
				
			}else{      /* false == 이미 등록된 사번 */
				$('#employeeId').val(''); /* input 비우기 */
				$('#divEmpNo').append('<div id="warnExistEmp" class="px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-400/20"><span class="font-bold">사용 불가</span> 이미 등록된 직원 번호입니다.</div>');
				$('#employeeId').focus();
			}
			
			/* cancel 버튼 클릭시 중복검사 안내 alert 부분 지우기 */
			$('#btnReset').click(function() { 
			    $('#warnExistEmp').remove();
			    return;
			});
	
		})
		.fail(function(){
			alert('중복 검사 실패');
		});
	});


});
</script>


</html>