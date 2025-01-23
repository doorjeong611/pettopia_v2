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
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/signature_pad/signature_pad.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.production.min.js"></script><!-- gridjs는 jquery 아래에 위치해야함! -->


<style>
    .gridjs-summary {
        display: none;
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
                        <h5 class="text-16">메인 화면</h5>
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
				<div class="xl:col-span-9 flex justify-center">
				  <div class="card w-full max-w-5xl">
				    <div class="card-body">
				      <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
				        <!-- 에러메세지 -->
				        <div id="alert-error-msg" class="hidden px-4 py-3 text-sm text-red-500 border border-transparent rounded-md bg-red-50 dark:bg-red-500/20"></div>
				
								        
						<!-- 서명 관리 -->
						<div class="flex justify-end gap-2 mt-4"s>
							<button type="button" id="signBtn" class="text-green-500 bg-white btn hover:bg-green-100">서명 관리</button>
						</div>
						
				
				        <!-- 직원 프로필 사진  -->
				        <div class="relative mx-auto mb-4 rounded-full shadow-md size-24 bg-slate-100 profile-user dark:bg-zink-500">
				          <img id="profileImg" src="${pageContext.request.contextPath }/employeeFile/${empInfo.empFileName}" alt="" class="object-cover w-15 h-15 rounded-full user-profile-image">
				        </div>

				        <!-- 직원 정보 입력 -->
				        <div class="grid grid-cols-1 gap-4 xl:grid-cols-12 " style="padding-left: 100px;">
				          <!-- 사번 : 자동입력 -->
				          <div class="xl:col-span-4">
				            <label for="employeeId" class="inline-block mb-2 text-base font-medium">직원 번호</label>
				            <input type="number" name="empNo" id="employeeId" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${loginEmp.username}" readOnly>
				          </div>
				
				          <!-- 이름 -->
				          <div class="xl:col-span-4 ">
				            <label for="employeeInput" class="inline-block mb-2 text-base font-medium">이름</label>
				            <input type="text" name="empName" id="employeeInput" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empName}" readonly>
				          </div>
				
				          <!-- 생년월일 -->
				          <div class="xl:col-span-4 ">
				            <label for="joiningDateInput" class="inline-block mb-2 text-base font-medium">생년월일</label>
				            <div class="gap-2">
				              <input type="text" name="empBirth" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.empBirth}" readonly>
				            </div>
				          </div>
				
				          <!-- 이메일 -->
				          <div class="xl:col-span-4">
				            <label for="emailInput" class="inline-block mb-2 text-base font-medium">이메일</label>
				            <input type="text" name="empEmail" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none " value="${empInfo.empEmail}" readonly>
				          </div>
				
				          <!-- 연락처 -->
				          <div class="xl:col-span-4 ">
				            <label for="phoneNumberInput" class="inline-block mb-2 text-base font-medium">연락처</label>
				            <div class="flex items-center space-x-4">
				              <input type="text" name="empPhone" id="phoneNumberInput2" class="form-input border-slate-200 dark:border-zink-500 px-5 focus:outline-none" value="${empInfo.empPhone}" readonly>
				            </div>
				          </div>
				
				          <!-- 성별 -->
				          <div class="xl:col-span-4 ">
				            <label class="block text-base font-medium mb-2" style=" margin-bottom: 8px;">성별</label>
				            <div class="flex items-center space-x-4">
				              <input type="text" name="empGender" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.empGender}" readonly>
				            </div>
				          </div>
				
				          <!-- 주소 -->          
				          <div class="xl:col-span-4 ">
				            <label for="locationInput" class="inline-block mb-2 text-base font-medium">
				              주소
				            </label>
				            <div class="grid gap-2">
				              <!-- 우편번호 -->
				              <div class="flex items-center space-x-2">
				                <input type="text" name="postalCode" id="sample6_postcode" class="flex-grow border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.postalCode}" readonly>
				              </div>
				              
				              <!-- 주소 입력 -->
				              <input type="text" name="basicAddress" id="sample6_address" class="border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.basicAddress}" readonly>
				              <input type="text" name="detailAddress" id="sample6_detailAddress" class="border border-gray-300 rounded-md px-5 py-2 focus:outline-none" value="${empInfo.detailAddress}" readonly>
				              
				            </div>
				          </div>
				
				          <!-- 입사일 -->
				          <div class="xl:col-span-4 ">
				            <label for="joiningDateInput" class="inline-block mb-2 text-base font-medium">입사일</label>
				            <div class="gap-2">
				              <input type="text" name="hireDate" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.hireDate}" readonly>
				            </div>
				          </div>
				
				          <!-- 부서 -->
				          <div class="xl:col-span-4 ">
				            <label for="designationSelect" class="inline-block mb-2 text-base font-medium">소속 부서</label>
				            <div class="gap-2">
				              <input type="text" name="divisionCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.divisionName}" readonly>
				              <input type="text" name="deptCode" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.deptName}" readonly>
				           	</div>
				            <label for="designationSelect" class="inline-block mb-2 text-base font-medium">직급</label>
				            <div class="gap-2">
				              <input type="text" name="rankNo" class="border border-gray-300 rounded-md px-5 py-2 mb-2 focus:outline-none" value="${empInfo.rankName}" readonly>
				            </div>
				          </div>
				        </div>
				
				        <!-- 수정 버튼 -->
				        <div class="flex justify-end gap-2 mt-4">
				         <a href="${pageContext.request.contextPath }/employee/modifyEmployeeOne?empNo=${loginEmp.username}"> <button type="button" id="addNew" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button></a> 
				        </div>
				
				      </div>
				    </div>
				  </div>
				</div>
				<div class="grid grid-cols-1 gap-4 mb-5 xl:grid-cols-2">
					<div class="xl:col-span-12">
						<div>
							<h5 class="text-16"> 근태 기록 </h5>
						</div>
					</div>
				</div>
				<div class="card p-5">
					<div class="grid grid-cols-1 gap-4 mb-5 xl:grid-cols-2">
					<!-- 나의 근태 기록 -->
					<!-- gridjs 출력 -->
					<div class="xl:col-span-12">
						<div class="xl:col-span-4 mb-3" style="width: 150px; margin-left: 250px;">
			                <select name="attendanceStatus" id="attendanceSelect" class="form-input border-slate-200 dark:border-zink-500">
			                    <option value="">전체</option>
			                    <option value="P">출근</option>
			                    <option value="L">지각</option>
			                    <option value="E">조퇴</option>
			                    <option value="A">결근</option>
			                    <option value="V">연차</option>
			                    <option value="H">반차</option>
			                </select>
				        </div>
				        
						 
		                	<div id="myAttendanceTable" style="width: 800px; justify-self: center;"></div>
		                </div>
	                </div>
                </div>
				<script type="text/javascript">
				/* gridjs 시작 */
				// 전역 변수로 선언
				let gridInstance = null; // 초기값 null
				let attendanceStatus = 'null'; // 처음은 null -> 전체 조회
				
				$(document).ready(function () {
				    // 초기 선택된 값 가져오기
				    attendanceStatus = $('#attendanceSelect').val() || 'null'; // 기본 값 설정
				
				    console.log('초기 선택 attendanceStatus:', attendanceStatus);
				
				    // 데이터 조회 및 테이블 렌더링
				    fetchAttendanceStatusData();
				
				    // select 값 변경 이벤트 핸들러 추가
				    $('#attendanceSelect').on('change', function () {
				        attendanceStatus = $(this).val() || 'null'; // 선택된 값 업데이트
				        console.log('선택된 attendanceStatus:', attendanceStatus);
				
				        // 데이터 다시 가져오기 및 테이블 업데이트
				        fetchAttendanceStatusData();
				    });
				});
				
				// 데이터를 가져오는 함수
				function fetchAttendanceStatusData() {
				    var container = $('#myAttendanceTable'); // jQuery로 컨테이너 참조
				
				    console.log('데이터 요청 attendanceStatus:', attendanceStatus);
				
				    // 기존 그리드 인스턴스를 파괴
				    if (gridInstance) {
				        gridInstance.destroy();
				    }
				
				    // 기존 컨테이너 내용을 비움
				    container.empty();
				
				    // 데이터 요청
				    fetch('/pettopia/rest/myAttendanceList/' + attendanceStatus)
				        .then(function (response) {
				            return response.json();
				        })
				        .then(function (data) {
				            console.log('가져온 데이터:', data);
				
				            // 데이터가 없을 경우 "조회 결과 없음" 메시지 표시
				            if (!data || data.length === 0) {
				                container.html(
				                    '<div style="display: flex; justify-content: center; align-items: center; height: 200px; font-size: 18px; color: #6c757d;">' +
				                    '조회 결과 없음' +
				                    '</div>'
				                );
				                return;
				            }
				
				            // 필터링 (attendanceStatus)
				            var filteredData = data.filter(function (atte) {
				                return attendanceStatus === 'null' || atte.attendanceStatus === attendanceStatus;
				                
				            });
				            
				            
					        // 데이터를 수정하여
				            const modifiedData = filteredData.map(atte => {
				            	
				                let statusText = "";
				                switch (atte.attendanceStatus) {
				                    case "P":
				                        statusText = "출근";
				                        break;
				                    case "L":
				                        statusText = "지각";
				                        break;
				                    case "E":
				                        statusText = "조퇴";
				                        break;
				                    case "A":
				                        statusText = "결근";
				                        break;
				                    case "V":
				                        statusText = "연차";
				                        break;
				                    case "H":
				                        statusText = "반차";
				                        break;
				                    default:
				                        statusText = "알 수 없음";
				                }
				
				                return {
				                    ...atte,
				                    attendanceDate : atte.attendanceDate,
				                    attendanceStatus : statusText,
				                    clockInTime : atte.clockInTime,
				                   	clockOutTime : atte.clockOutTime,
				
				                };
					          });
				            
				            
				
				            console.log("필터링된 데이터:", filteredData);
				
				            // Grid.js에 데이터를 전달
				            gridInstance = new gridjs.Grid({
				                columns: ["날짜", "상태", "출근 시각", "퇴근 시각"],
				                data: modifiedData.map(function (atte) {
				                    return [
				                        atte.attendanceDate,
				                        atte.attendanceStatus,
				                        atte.clockInTime,
				                        atte.clockOutTime
				                    ];
				                }),
				                pagination: {
				                    limit: 7 // 페이지 당 항목 수
				                },
				                style: {
				                    th: {
				                        background: '#f8f9fa',
				                        color: '#495057',
				                        textAlign: 'center'
				                    },
				                    td: {
				                        padding: '0.75rem',
				                        borderBottom: '1px solid #e0e0e0',
				                        textAlign: 'center'
				                    },
				                    table: {
				                        width: '200px',
				                        maxWidth: '100%',  // 화면 크기에 맞춰 반응형
				                        margin: '0 auto',  // 테이블을 화면 가운데로 정렬
				                        borderCollapse: 'collapse'  // 테이블 경계선이 중복되지 않도록
				                    }
				                }
				            }).render(container[0]);
				
				            console.log('그리드 렌더링 완료');
				        })
				        .catch(function (error) {
				            console.error('데이터 가져오기 실패:', error);
				            container.html(
				                '<div style="display: flex; justify-content: center; align-items: center; height: 200px; font-size: 18px; color: #dc3545;">' +
				                '데이터 가져오기 실패' +
				                '</div>'
				            );
				        });
				}
				/* gridjs 끝 */
				</script>
				
				<!-- 끝 : gridjs -->
				<!-- 끝 : Main content -->
				
				
				
				<!-- 서명관리 모달창 --> 				
				<div id="signModalContainer" class="hidden">
				
					<div id="signModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;"></div>
					               	
					<div id="signFormModal" class="fixed left-1/2 transform -translate-x-1/2 z-[1000]" style="top: 40%; transform: translate(-50%, -40%); z-index: 1000;">
					
						<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
							<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">    
								<button type="button" id="closeSignModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
									&#10060;
								</button>
							</div>
							<div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
								<div id="signView">
									
								</div>
								<!-- 업로드 -->
								<div>
									<div class="relative w-full max-w-sm" id="fileUploadDiv">
										<button type="button" id="removeSignFileBtn" class="text-white btn bg-custom-500 hover:bg-custom-600" >삭제</button>
										<input type="file" id="empSignFile" name="empSignFile" />
									</div>
								</div>
								<!-- signature_pad -->
								<div>
									<button type="button" id="signPadBtn" class="text-green-500 bg-white btn hover:bg-green-100">서명하기</button>
								</div>
								<div id="pad" class="hidden" >
									<canvas style="border:1px solid black; width:250px;"></canvas>        
									       
									<button type="button" id="btnClear" class="text-green-500 bg-white btn hover:bg-green-100">지우기</button>         
									<!-- <button type="button" id="btnAdd" class="text-green-500 bg-white btn hover:bg-green-100">등록</button>  -->       
								</div>
							    
							</div>
							<div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
								<button id="addEmpSignBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600 addFileBtn">등록</button>
							</div>
						</div>
					</div> 
				</div> 
				<!-- 서명관리 모달 끝: modalContainer -->
				
                
                
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
<%-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script> --%>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script> 


<script type="text/javascript">
$(document).ready(function () {
/* 서명 관리 버튼을 클릭 -> 모달창 */
// 재직상태 모달창 관련 id 가져오기 
const signModalContainer = $("#signModalContainer");
const signModalBackground = $("#signModalBackground");
const signFormModal = $("#signFormModal");
const closeSignModalBtn = $("#closeSignModalBtn");
const addEmpSignBtn = $("#addEmpSignBtn");

// 모달창 띄우기
$("#signBtn").click(function() {
   
	// 모달 배경과 모달 창을 보이게 하기
	signModalContainer.removeClass("hidden");  
	 $('#empSignFile').val('');  // 파일 선택 초기화
    
});

// 모달 닫기 함수
function closeSignModal() {
	signModalContainer.addClass("hidden");
    $('body').removeClass('overflow-hidden');
    
    // 모달 안의 파일 입력 초기화
    //$('#signModalContainer input[type="file"]').val('');
    
    // sign_pad 초기화
    $('#pad').addClass("hidden");
    //signaturePad.clear();

}

// 닫기 버튼
closeSignModalBtn.click(closeSignModal);

// 수정 버튼 -> 모달창 닫기
addEmpSignBtn.click(function() {
	closeSignModal();
});

// 배경 클릭시 닫기
signModalBackground.click(function(event) {
    if (event.target === this) {
    	closeSignModal();
    }
});

/* 끝 : 서명 관리 모달창  */



/* 현재 첨부한 파일 삭제 */
// 파일 삭제
$('#removeSignFileBtn').click(function() {
	// let html = '<input type="file" id="empSignFile" name="empSignFile" accept="image/*">'; 제거
	
	
	if($('#empSignFile').length == 0){
		alert('삭제할 파일이 없습니다.');
	}else{
		
		$('#empSignFile').val('');
		
	}
	
});  
 

/* 존재하는 서명 가져오기 */
console.log("서명 ajax 실행")

$.ajax({
	url : '/pettopia/rest/employeeSignFile',
	method : 'GET'
}).done(function(result) {
	console.log("응답받은 결과:", result);
	const fileName = result.fileName + result.fileExt;
	console.log('filename : ' + fileName);
	if(result != null && result != ''){
		$('#signView').append('<img src="${pageContext.request.contextPath}/employeeFile/' + fileName + '" style="width: 250px;">');
	}else{
		$('#signView').append('<img src="${pageContext.request.contextPath}/employeeFile/noSign.png" style="width: 250px;">');
	}

}).fail(function() {
	alert('서명 호출 실패');
});


// ----------------------------------------------------------------------------------------------------------

    
    const canvas = $('#pad canvas')[0]; // 배열로 접근해야함
    const signaturePad = new SignaturePad(canvas, {
        minWidth: 2, 
        maxWidth: 2, 
        penColor: '#000000'
    });
    
    const fileInput = $('#empSignFile'); // 파일 첨부 input
    const signPadBtn = $('#signPadBtn'); // 서명하기 버튼
    const removeSignFileBtn = $('#removeSignFileBtn'); // 파일 삭제 버튼

    /* 파일 첨부 시 signPad에 이미 작성된 서명이 존재할 경우 */
    fileInput.on('click', function () {
    	
    	if (!signaturePad.isEmpty()) {		// signpad가 비어있지 않다면 
    		alert("서명 패드에 작성중인 서명이 존재합니다.");
    		fileInput.prop('disabled', true); // 파일 첨부 비활성화
    	}
    	
    });	
    	

    	
    /* 서명 작성 시 이미 첨부된 파일이 존재할 경우 */  	
   	signPadBtn.on('click', function () {
   		
   	 // 첨부된 파일이 없으면 서명 패드 활성화
        if (!$('#empSignFile').val()) { 
            $('#pad').removeClass('hidden'); // 서명 영역 표시
        } else {
            alert('이미 첨부된 파일이 있습니다.');
            $('#pad').addClass('hidden'); 	// 서명 영역 숨김
        }
	
   	});	

        
   

    /* 지우기 버튼 */ 
    $('#btnClear').on('click', function () {
        signaturePad.clear();
        $('#pad').addClass('hidden'); 	// 서명 영역 숨김
     // sign을 지우고 첨부된 파일이 없고 파일 첨부버튼이 비활성화 되어있다면
        if(fileInput.prop('disabled')){			
        	fileInput.prop('disabled', false);
        }
        
        
    });

    // 파일 첨부 확인
    $('#empSignFile').on('change', function () {
        const fileInput = $('#empSignFile')[0];
        console.log('첨부된 파일:', fileInput.files[0]);
    });
    
    
    

    /* 서명 등록 버튼 */
    $('#addEmpSignBtn').on('click', function () {
    	
    	const fileInput = $('#empSignFile')[0]; 	// 파일 입력 요소

    	// sign이 없고 첨부된 파일이 있다면
    	if(fileInput.files.length > 0){
        	const file = fileInput.files[0]; 			// 첨부된 첫 번째 파일
    		
    		const empSignFile = new FormData();			// 파일 전달을 위한 formData
    		
    		empSignFile.append('empSignFile', file); 		// 파일 추가
    		console.log('첨부 파일 : ', file);
            console.log('첨부 파일이 formData에 추가되었습니다.');
    		
    		// ajax 요청
            $.ajax({
                url: '/pettopia/rest/addEmployeeSignFile',
                method: 'POST',
                data: empSignFile,
                contentType: false, 					// 자동으로 content-type 설정하지 않도록
                processData: false, 					// 데이터 자동 변환 방지
                success: function(result) {
                    alert(result); 	
                    
                },
                error: function() {
                    alert('서명 등록 실패');
                }
            });
    		
    	// sign은 있고 첨부된 파일이 없다면	
    	}else if(fileInput.files.length === 0 && !signaturePad.isEmpty()){
    		 console.log('등록할 수 있는 서명이 있음.');
    	        $.ajax({
    	            url: '/pettopia/rest/addEmployeeSignFile',
    	            method: 'POST',
    	            data: { sign: signaturePad.toDataURL() }
    	        }).done(function (result) {
    	            alert("서명 등록 성공");
    	            
    	        }).fail(function (request, status, error) {
    	            alert('서명 등록 실패');
    	        });
    	}else{
    		alert('파일과 서명을 동시에 등록할 수 없습니다. 하나만 등록해주세요.');
            return;  // 함수 실행 중지
    	}
    
    	
    	
    });


    
    
});


</script>





</body>

</html>