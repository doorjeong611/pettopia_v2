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
                        <h5 class="text-16">쪽지 쓰기</h5>
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
                <div class="card">
                    <div class="card-body">
                        <form action="#!">
							<div class="mb-4">
							    <span class="font-semibold">받는사람 :</span>
							    <input type="text" class="text-slate-500 border-b-0 focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200" placeholder=" 이름을 입력하세요." readonly/>
							    <button type="button" id="searchRecipientBtn" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">
							    	검색
							    </button>
							</div>
							<div class="mb-2 pb-2">
							    <span class="font-semibold">제목 :</span>
							    <input type="text" class="text-slate-500 border-b-0 focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200" placeholder=" 제목을 입력하세요." />
							</div>
							
							<!-- 쪽지 내용 시작 -->
							<hr class="border-t border-blue-400 my-4" /> 
							<div class="mt-4">
							<textarea class="w-full p-2 border border-slate-300 rounded focus:outline-none focus:ring focus:ring-slate-200 dark:bg-zink-700 dark:border-zink-600 dark:text-zink-200" rows="25" placeholder="내용을 입력하세요."></textarea>
							 <div class="flex justify-end gap-2 mt-5">
								<button type="button" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">
								    <i class="ri-mail-send-line inline-block mr-1" style="font-size: 1.05rem;"></i> <!-- 크기 조정 -->
								    <span class="align-middle">전송하기</span>
								</button>
 								<a href="${pageContext.request.contextPath}/message/messageList" class="text-slate-500 btn bg-slate-200 border-slate-200 hover:text-slate-600 hover:bg-slate-300 hover:border-slate-300 focus:text-slate-600 focus:bg-slate-300 focus:border-slate-300 focus:ring focus:ring-slate-100 active:text-slate-600 active:bg-slate-300 active:border-slate-300 active:ring active:ring-slate-100 dark:bg-zink-600 dark:hover:bg-zink-500 dark:border-zink-600 dark:hover:border-zink-500 dark:text-zink-200 dark:ring-zink-400/50">
								    <i class="ri-mail-line inline-block mr-1" style="font-size: 1.05rem;"></i> <!-- 크기 조정 -->
								    <span class="align-middle">쪽지보관함</span>
								</a>
                            </div>
							</div>
                            <div class="grid grid-cols-1 gap-5 xl:grid-cols-12">
                            </div><!--end grid-->
                        </form>
                    </div>
                </div>
                
				<!-- 모달창 HTML -->
				<div id="recipientModal" class="fixed inset-0 z-50 hidden bg-gray-800 bg-opacity-50 flex items-center justify-center">
				    <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-2xl">
				        <div class="flex justify-between items-center mb-4">
				            <h2 class="text-lg font-semibold">직원 검색</h2>
				            <button id="closeModalBtn" class="text-gray-500 hover:text-gray-700">
				                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
				                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
				                </svg>
				            </button>
				        </div>
				
				        <!-- 선택 박스 -->
				        <div class="flex space-x-4 mb-4">
				            <div class="flex-grow">
				                <label class="block mb-1">부서 선택</label>
				                <select id="departmentSelect" class="border border-gray-300 rounded w-full p-2">
				                    <option value="">---부서 선택---</option>
				                    <option value="부서3">경영진</option>
				                    <option value="부서4">마케팅부서</option>
				                    <option value="부서1">인사부서</option>
				                    <option value="부서2">재무부서</option>
				                    <option value="부서5">IT부서</option>
				                    <option value="부서6">법무부서</option>
				                    <option value="부서7">영업부서</option>
				                    <option value="부서8">CS부서</option>
				                </select>
				            </div>
				
				            <div class="flex-grow">
				                <label class="block mb-1">팀 선택</label>
				                <select id="teamSelect" class="border border-gray-300 rounded w-full p-2">
				                    <option value="">---팀 선택---</option>
				                    <option value="팀1">인사팀</option>
				                    <option value="팀2">교육팀</option>
				                    <option value="팀3">채용팀</option>
				                    <option value="팀4">급여/복리후생팀</option>
				                    <option value="팀5">인재관리팀</option>
				                    <option value="팀6">회계팀</option>
				                    <option value="팀7">재무분석팀</option>
				                    <option value="팀8">예산관리팀</option>
				                    <option value="팀9">자산관리팀</option>
				                    <option value="팀10">전략기획팀</option>
				                    <option value="팀11">조직발전팀</option>
				                    <option value="팀12">프로젝트관리팀</option>
				                    <option value="팀13">비즈니스개발팀</option>
				                    <option value="팀14">마케팅팀</option>
				                    <option value="팀15">디지털마케팅팀</option>
				                    <option value="팀16">프로모션팀</option>
				                    <option value="팀17">브랜드전략팀</option>
				                    <option value="팀18">시장조사팀</option>
				                    <option value="팀19">국내영업팀</option>
				                    <option value="팀20">해외영업팀</option>
				                    <option value="팀21">고객지원팀</option>
				                    <option value="팀22">고객만족도팀</option>
				                    <option value="팀23">개발팀</option>
				                    <option value="팀24">사용자지원팀</option>
				                    <option value="팀25">네트워크관리팀</option>
				                    <option value="팀26">보안팀</option>
				                    <option value="팀27">법무팀</option>
				                    <option value="팀28">컴플라이언스팀</option>
				                    <option value="팀29">계약관리팀</option>
				                    <option value="팀30">분쟁해결팀</option>
				                </select>
				            </div>
				
				            <div class="flex-grow">
				                <label class="block mb-1">직급 선택</label>
				                <select id="positionSelect" class="border border-gray-300 rounded w-full p-2">
				                    <option value="">---직급 선택---</option>
				                    <option value="사원">사원</option>
				                    <option value="대리">대리</option>
				                    <option value="대리">과장</option>
				                    <option value="대리">차장</option>
				                    <option value="대리">부사</option>
				                    <option value="팀장">이사</option>
				                    <option value="팀장">사장</option>
				                </select>
				            </div>
				        </div>

				        <!-- 사원번호 입력란 -->
				        <div class="mb-4">
				            <label class="block mb-1">이름</label>
				            <input type="text" id="recipientSearchInput" class="border border-gray-300 rounded w-full p-2" placeholder="직원이름을 입력하세요." oninput="filterEmployees()"/>
				        </div>
						
						<div class="flex justify-end mb-4">
							<button id="searchButton" class="bg-blue-500 hover:bg-blue-700 text-white rounded p-2" onclick="filterEmployees()">검색</button>
						</div>
				        <!-- 직원 리스트 테이블 -->
				        <div class="overflow-x-auto">
				            <table class="min-w-full border border-slate-200 w-full"> <!-- 테이블 너비를 w-full로 설정 -->
				                <thead>
				                    <tr>
				                        <th class="border-b text-center px-4 py-2">부서</th>
				                        <th class="border-b text-center px-4 py-2">팀</th>
				                        <th class="border-b text-center px-4 py-2">직급</th>
				                        <th class="border-b text-center px-4 py-2">사원번호</th>
				                        <th class="border-b text-center px-4 py-2">사원명</th>
				                        <th class="border-b text-center px-4 py-2">선택</th>
				                    </tr>
				                </thead>
				                <tbody id="recipientTableBody">
				                    <!-- 검색 결과 항목이 여기에 추가됩니다. -->
				                </tbody>
				            </table>
				        </div>
				
				        <!-- 페이지네이션 -->
				        <div class="flex justify-between items-center mt-4">
				            <div id="pagination" class="flex space-x-2">
				                <!-- 페이지 버튼이 여기에 추가됩니다. -->
				            </div>
				        </div>
				
				        <div class="flex justify-between mt-4">
				            <button id="confirmBtn" class="bg-blue-500 text-white rounded px-4 py-2">확인</button>
				            <button id="cancelBtn" class="bg-gray-300 text-gray-700 rounded px-4 py-2">취소</button>
				        </div>
				    </div>
				</div>
				
			    </div>
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
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<!-- 받는사람 모달 -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchRecipientBtn = document.getElementById('searchRecipientBtn');
    const recipientModal = document.getElementById('recipientModal');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const recipientSearchInput = document.getElementById('recipientSearchInput');
    const recipientTableBody = document.getElementById('recipientTableBody');
    const selectedEmployee = document.getElementById('selectedEmployee');

    let employees = []; // 전체 직원 목록
    let filteredEmployees = []; // 필터링된 직원 목록
    let currentPage = 1; // 현재 페이지
    const itemsPerPage = 5; // 페이지당 항목 수

    searchRecipientBtn.addEventListener('click', function() {
        recipientModal.classList.remove('hidden');
        recipientSearchInput.value = ''; // 검색 입력 초기화
        recipientTableBody.innerHTML = ''; // 이전 검색 결과 초기화
        fetchEmployees(); // 직원 목록을 가져오는 함수 호출
    });

    closeModalBtn.addEventListener('click', function() {
        recipientModal.classList.add('hidden');
    });

    // 직원 목록을 AJAX로 가져오기
    function fetchEmployees() {
        const empStatus = 'E'; // 재직 중인 직원 상태
        fetch(`/message/messageNote/employees?empStatus=${empStatus}`) // API 경로
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // JSON 형식으로 변환
            })
            .then(data => {
                employees = data; // 전체 직원 목록 저장
                filteredEmployees = employees; // 필터링 초기화
                populateRecipientTable(filteredEmployees); // 전체 직원 목록으로 초기화
                setupPagination(filteredEmployees); // 페이지 초기화
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }

    // 수신자 목록을 테이블에 표시
    function populateRecipientTable(employees) {
        recipientTableBody.innerHTML = ''; // 이전 결과 초기화

        employees.forEach(function(employee) {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td class="border-b text-center px-4 py-2">${employee.department || '-'}</td>
                <td class="border-b text-center px-4 py-2">${employee.team || '-'}</td>
                <td class="border-b text-center px-4 py-2">${employee.rank || '-'}</td>
                <td class="border-b text-center px-4 py-2">${employee.empNo}</td>
                <td class="border-b text-center px-4 py-2">${employee.empName}</td>
                <td class="border-b text-center px-4 py-2">
                    <button class="select-button bg-blue-500 text-white rounded px-2 py-1" data-employee="${employee.empNo}">선택</button>
                </td>
            `;
            recipientTableBody.appendChild(row);

            // 선택 버튼 클릭 시 행동
            row.querySelector('.select-button').addEventListener('click', function() {
                selectedEmployee.textContent = employee.empName; // 선택된 직원 이름 설정
                recipientModal.classList.add('hidden'); // 모달 닫기
            });
        });
    }

    // 페이지 설정
    function setupPagination(employees) {
        const totalPages = Math.ceil(employees.length / itemsPerPage);
        const paginationContainer = document.getElementById('pagination');
        paginationContainer.innerHTML = ''; // 이전 페이지 버튼 초기화

        for (let i = 1; i <= totalPages; i++) {
            const pageBtn = document.createElement('button');
            pageBtn.textContent = i;
            pageBtn.className = 'pagination-btn';
            pageBtn.addEventListener('click', function() {
                currentPage = i;
                const start = (currentPage - 1) * itemsPerPage;
                const end = start + itemsPerPage;
                const paginatedEmployees = employees.slice(start, end);
                populateRecipientTable(paginatedEmployees); // 페이지 내용 업데이트
            });
            paginationContainer.appendChild(pageBtn);
        }
    }

    // 필터링 기능
    recipientSearchInput.addEventListener('input', filterEmployees);

    function filterEmployees() {
        const query = recipientSearchInput.value.toLowerCase();
        filteredEmployees = employees.filter(employee => 
            employee.empName.toLowerCase().includes(query)
        );
        setupPagination(filteredEmployees); // 페이징 초기화
        const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedEmployees = filteredEmployees.slice(start, end);
        populateRecipientTable(paginatedEmployees); // 필터링된 목록 업데이트
    }
});
</script>

</body>

</html>