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
    
    <!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gridjs/dist/theme/mermaid.min.css">
    <script src="https://cdn.jsdelivr.net/npm/gridjs/dist/gridjs.production.min.js"></script> -->
    
    
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
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
                        <h5 class="text-16">직원 목록</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">직원 관리</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            직원목록
                        </li>
                    </ul>
                </div>
                
                
                <!-- Main content -->
                <div class="card" >
                    <div class="card-body">
                
						<div class="xl:col-span-12 flex flex justify-end gap-4">
						    <!-- 부서 선택 (전체) -->
						    <div class="xl:col-span-4">
						        <!-- <label for="divisionSelect" class="inline-block mb-2 text-base font-medium">부서</label> -->
						        <div class="flex gap-2">
						            <select name="divisionCode" id="divisionSelect" class="form-input border-slate-200 dark:border-zink-500">
						                <option value="">부서 </option>
						            </select>
						        </div>
						    </div>
						    
						    <!-- 재직 상태 선택 (인사부 관리자만) -->
						    <c:if test="${isAllowedEmpStatus}">
						        <div class="xl:col-span-4">
						            <!-- <label for="empStatusSelect" class="inline-block mb-2 text-base font-medium">재직 상태</label> -->
						            <div class="flex gap-2">
						                <select name="empStatus" id="empStatusSelect" class="form-input border-slate-200 dark:border-zink-500">
						                    <option value="">재직 상태</option>
						                    <option value="E">재직</option>
						                    <option value="H">대기</option>
						                    <option value="L">휴직</option>
						                    <option value="R">퇴직</option>
						                    <option value="T">임시</option>
						                </select>
						            </div>
						        </div>
						    </c:if>
						</div>				
						
						<!-- gridjs 출력 -->
		               <div id="employeeTable">			
		               </div>
                	</div>
                </div>

<script>
//전역 변수로 선언
let gridInstance; 			
let divisionCode = 'null';  // 처음은 null -> 전체 조회
let empStatus = 'null';  // 처음은 null -> 전체 조회

// 부서 드롭다운 데이터를 가져오는 함수
function fetchDivisionData() {
    return fetch('/pettopia/rest/divisionList')
        .then(response => {
            if (!response.ok) {
                throw new Error('부서 호출 실패');
            }
            return response.json();
        })
        .then(result => {
            console.log("응답받은 결과:", result);
            result.forEach(item => {
                const option = document.createElement("option");
                option.value = item.divisionCode;
                option.textContent = item.divisionName;
                document.getElementById("divisionSelect").appendChild(option);
            });
        })
        .catch(error => {
            console.error('에러:', error);
            alert('부서 호출 실패');
        });
}

// 부서, 재직 상태 드롭다운 초기화 및 데이터 요청
window.onload = function() {
    fetchDivisionData()
        .then(() => {
            // 초기 선택된 값으로 설정
            divisionCode = document.getElementById("divisionSelect").value || 'null'; // 기본 값 설정
            
         	// empStatusSelect가 존재할 경우에만 empStatus 값을 설정
            const empStatusSelect = document.getElementById("empStatusSelect");
            empStatus = empStatusSelect ? empStatusSelect.value || 'null' : 'null'; // 기본 값 설정
            
            console.log('초기 선택 divisionCode:', divisionCode);
            console.log('초기 선택 empStatus:', empStatus);
            fetchEmployeeData(); 													// 데이터 가져오기
        });
};

// 부서 드롭다운 변경 이벤트 처리
document.getElementById("divisionSelect").addEventListener("change", function() {
    divisionCode = this.value || 'null'; 						// 선택된 부서값 업데이트, 값이 없으면 null
    console.log('변경된 divisionCode:', divisionCode);
    fetchEmployeeData(); 										// 데이터를 다시 가져오는 함수 호출
});


//재직 상태 드롭다운 변경 이벤트 처리 (empStatusSelect가 존재할 경우에만 처리)
const empStatusSelect = document.getElementById("empStatusSelect");
if (empStatusSelect) {
    empStatusSelect.addEventListener("change", function() {
        empStatus = this.value || 'null'; 						// 선택된 재직 상태값 업데이트, 값이 없으면 null
        console.log('변경된 empStatus:', empStatus);
        fetchEmployeeData(); 									// 데이터를 다시 가져오는 함수 호출
    });
}


// 데이터를 가져오는 함수
function fetchEmployeeData() {
	
	 // 기존 데이터를 제거하여 컨테이너를 비워야 새로운 조회 테이블로 업데이트 가능
    const container = document.getElementById("employeeTable");
	
    console.log('데이터 요청 divisionCode: ', divisionCode);
    console.log('데이터 요청 "empStatus": ', empStatus);
    

    // 기존 그리드 인스턴스를 파괴하기
    if (gridInstance) {
        gridInstance.destroy();
    }
    
 	// 기존 컨테이너 내용을 비워줌
    container.innerHTML = ''; 
    

    fetch('/pettopia/rest/employeeList/' + divisionCode + '?empStatus=' + empStatus)
        .then(response => response.json())
        .then(data => {
            console.log('가져온 데이터:', data);

         // 데이터가 없을 경우 "조회 결과 없음" 메시지 표시
         if (!data || data.length === 0) {
        	 container.innerHTML = '<div style="display: flex; justify-content: center; align-items: center; height: 200px; font-size: 18px; color: #6c757d;">'
		            				+ ' 조회 결과 없음 '
		         					+ ' </div>' ; 
		     return;
         }

            // 필터링 (divisionCode에 맞는 직원만)
            const filteredData = data.filter(emp => {
                // divisionCode가 'null'일 경우 전체 직원 반환
                return divisionCode === 'null' || emp.divisionCode === divisionCode
            });

            // 데이터를 수정하여
            const modifiedData = filteredData.map(emp => {
                return {
                    ...emp,
                    empName: '<a href="${pageContext.request.contextPath}/employee/employeeSummary?empNo=' + emp.empNo + '" class="flex items-center gap-3">'
			                + '<div class="w-6 h-6 rounded-full shrink-0 bg-slate-100 dark:bg-zink-600">'
			                + '<img src="${pageContext.request.contextPath}/employeeFile/' + (emp.fileName ? emp.fileName : 'placeholder.png') + '" class="h-6 rounded-full">'
			                + '</div>'
			                + '<h6 class="grow">' + emp.empName + '</h6>' + '</a>',
			        empStatus: emp.empStatus,
			        division: '<strong>' + emp.divisionName + '</strong>' + '/' + emp.deptName,
			        rankName: emp.isTeamLeader === 'H' ? emp.rankName + '(' + emp.isTeamLeader + ')' : emp.rankName,
			        divisionCode: emp.divisionCode,

                };
            });

            console.log("필터링된 데이터:", modifiedData);

            // 그리드 렌더링 (divisionCode는 출력하지 않음)
            gridInstance = new gridjs.Grid({
                columns: ["사번", "이름", "이메일", "재직상태", "소속부서", "직급", "입사일"],
                data: modifiedData.map(emp => [
                    emp.empNo,
                    gridjs.html(emp.empName),
                    emp.empEmail,
                    emp.empStatus,
                    gridjs.html(emp.division),
                    emp.rankName,
                    emp.hireDate,
                ]),
                pagination: true,
                search: true, 
                style: {
                    th: {
                        background: '#f8f9fa',
                        color: '#495057',
                    },
                    td: {
                        padding: '0.75rem',
                        borderBottom: '1px solid #e0e0e0',
                    },

                }
            }).render(container);
            console.log('그리드 렌더링 완료');
        })
        .catch(error => {
            console.error('데이터 가져오기 실패:', error);
        });
}
</script>

			    
                
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

<!-- grid  -->
<script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.production.min.js"></script>

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>

</html>