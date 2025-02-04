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
    <script src="https://cdn.jsdelivr.net/npm/dragscroll/dragscroll.min.js"></script>
    <script src="https://unpkg.com/simplebar@5.3.0/dist/simplebar.min.js"></script>
    
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<!-- Google Chart 라이브러리 로드 -->
	<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
  
  	<!-- Balkan orgchart -->
  	<script src="${pageContext.request.contextPath}/assets/js/balkanOrgchart/orgchart.js"></script>
  	<script src="https://balkan.app/js/OrgChart.js"></script>
  
	<style>
	.readonly-select {
	    pointer-events: none; /* 클릭 차단 */
	    background-color: #f1f1f1; /* 읽기 전용처럼 보이게 */
	}
	
	
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	#divifont{
		font-family: 'GmarketSansMedium' , 'cursive';
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
    
    <script>
    $(document).ready(function () {
        /* 팀을 클릭하면 해당 팀의 조직도를 띄워줘야함 */
        $('#departDiv').on('click', '#deptDivSel', function () {
        
        	
        	
            // 현재 클릭된 #deptDivSel 내부의 input#deptCode 값을 가져오기
            const deptCode = $(this).find('input#deptCode').val().trim();

            // 확인
            console.log('deptCode:', deptCode);

            // ajax로 데이터 가져오기
            $.ajax({
                url: '/pettopia/rest/orgChart/' + deptCode, 
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    // JSON 데이터를 계층 구조로 변환
                    const hierarchy = createHierarchy(response);
                    console.log("response : "+ response);
                    // 계층 구조 데이터로 조직도 그리기
                    drawOrgChart(hierarchy);
                },
                error: function (error) { 
                    alert('조직도 ajax 실패 ' + deptCode);
                }
            });

            // 계층 구조로 변환
			function createHierarchy(data) {
			    console.log("createHierarchy 실행 확인");
			    console.log("data : ", data);  // data를 출력하여 들어오는 데이터 확인
			
			    var hierarchy = []; // 최상위 노드를 담을 배열
			    var depthMap = {}; // 각 깊이에 해당하는 마지막 노드를 저장 (배열로 저장)
			
			    // 데이터 반복 처리
			    $.each(data, function (index, node) {
			        var newNode = {
			            id: node.empNo, 				// 직원 번호를 고유 ID로 사용
			            name: node.empName , 			// 이름과 직급 표시
			            pid: '', 						// pid 미리 빈 문자열로 설정
			            title: node.rankName,			// 직급
			            img : "${pageContext.request.contextPath}/employeeFile/"+node.fileName,
			            nameWithRank: node.empName + " (" + node.rankName + ")" // "이름 (직급)" 형식으로 출력
			            
			        };
			
			        // 최상위 노드 (depth == 1)인 경우
			        if (node.depth == 1) {
			            console.log("디버깅 확인 1 - 최상위 노드: ", newNode);
			            hierarchy.push(newNode); // 최상위 노드는 바로 배열에 추가
			        } else {
			            console.log("디버깅 확인 2 - 부모 찾기: ", node);
			
			            // 부모 노드 찾기 (같은 depth의 마지막 노드가 부모)
			            var parentNode = depthMap[node.depth - 1] ? depthMap[node.depth - 1].slice(-1)[0] : null;
			            if (parentNode) {
			                newNode.pid = parentNode.id; // 부모 노드 ID 설정
			                console.log("부모 노드 설정: ", parentNode);
			            } else {
			                console.error("Parent node not found for depth " + node.depth + ":", node);
			            }
			        }
			
			        // 현재 노드를 해당 depth에 추가
			        if (!depthMap[node.depth]) {
			            depthMap[node.depth] = [];
			        }
			        depthMap[node.depth].push(newNode);
			        console.log("현재 depthMap 상태: ", depthMap); // depthMap 상태를 확인
			    });
			
			    // depthMap에서 각 깊이의 노드를 모두 hierarchy 배열에 추가
			    $.each(depthMap, function(depth, nodes) {
			        hierarchy = hierarchy.concat(nodes);
			    });
			
			    // 디버깅용 데이터 확인
			    console.log("계층 구조 데이터:", hierarchy);
			
			    return hierarchy;
			}


            // Balkan OrgChart 초기화 및 그리기
            function drawOrgChart(hierarchy) {
                console.log("OrgChart에 전달된 데이터:", hierarchy); // 디버깅용

                const chart = new OrgChart(document.getElementById('orgchart'), {
                	template: 'ula',
                    mouseScrool: OrgChart.none,
                    enableSearch: false,
                    scaleInitial: 0.8,
                    nodes: hierarchy,
                    nodeBinding: {// 노드에 표시할 내용
                    	 img_0: "img",
                         field_0: "nameWithRank",
                         field_1: "id"  
                                                 
                    }
                });
                
                
             
            }
        }); /* 끝:  팀을 클릭하면 해당 팀의 조직도를 띄워줘야함 */
        

        
    });
    </script>
	
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

    <div class="relative min-h-screen group-data-[sidebar-size=sm]:min-h-sm:relative">
        <div class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
            <div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">
                <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
                    <div class="grow">
                        <h5 class="title-font">부서 목록</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0 ">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">부서 관리</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100 ">
                            부서 목록
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
				<div class="card pl-8" style="height:50rem;">
					<!-- 버튼 -->
					<div class="px-4 py-4 flex justify-end gap-1">
						<button id="manageDiviBtn" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
						    부서 관리
						</button>
						<button id="manageDeptBtn" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
						    팀 관리
						</button>
					</div>


					<div class="card pl-8 overflow-y-auto simplebar-scrollable-y shadow-none" style="height:45rem;" data-simplebar>
						   	
						
							<div class="card-body flex gap-6 ">
						    
						        <!-- 상위 부서 목록 -->
								<div class="grid xl:grid-cols-1" id="divisionDiv" >
						        </div>
						        
						        <!-- 하위 팀 목록 -->
						        <div class="" id="departDiv" >
						            <div class="grid xl:grid-cols-1 px-5">
						                <span class="title-font pt-2 text-slate-400 text-lg text-center">부서를 <br> 선택해 주세요</span>
						            </div>
						        </div >
						        
						        <!-- 조직도 -->
						 
						        
					 	   	<div id="orgchart" class="grid xl:grid-cols-1 " style="width:50%"  >
						        	
						         <div id="choiceTeam" class="grid xl:grid-cols-4 px-5 ">
							           <span class="title-font pt-2 text-slate-400 text-lg text-center">팀을 <br> 선택해 주세요</span>
							     </div>

							</div>
					    
					    
					</div>
				</div>
				<!-- 끝 :  card -->
                
                
                
                
                
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
	
	
	
	


       
       
       
       
       
       
       
       <!-- 상위 부서 관리 모달창 -->
       <div id="diviModalContainer" class="hidden">
				
			<div id="diviModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;"></div>
			               	
			<div id="diviFormModal" class="fixed left-1/2 transform -translate-x-1/2 z-[1000]" style="top: 40%; transform: translate(-50%, -40%); z-index: 1000;">
			
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
					<!-- 모달 헤더 -->
					<div class="flex items-center justify-between p-4 dark:border-zink-500 border-b">    
						<h5 class="text-16">상위 부서 관리</h5>
						<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">    
							<button type="button" id="closeDiviModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
								&#10060;
							</button>
						</div>
					</div>
					
					<!-- 모달 내용 -->
					<div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto mt-4">

						<div id="addDiviDiv" class="mb-4 ">
							<form action="${pageContext.request.contextPath}/admin/addDivision" method="post" id="addDiviForm" class="flex gap-2">
								<div class="mb-1">
									<input type="text" id="addDivisionCode" name="divisionCode" value="" placeholder="새로운 부서 코드" class="py-1 border border-gray-300 rounded-md ">
								</div>
								<div class="mb-1">
									<input type="text" id="addDivisionName" name="divisionName" value="" placeholder="새로운 부서명" class="py-1 border border-gray-300 rounded-md ">
								</div>
								<button type="button" id="confirmBtn" class="px-2 py-2 text-sm rounded-md text-slate-500 bg-slate-50 dark:bg-zink-400/20 dark:text-zink-200  hover:text-white hover:bg-slate-600 hover:border-slate-600">중복 검사</button>
							</form>
						</div>
						<div id="alertAddDivi" class="px-4 py-3 text-sm border rounded-md text-slate-500 border-slate-200 bg-slate-50 dark:bg-zink-500/30 dark:border-zink-500 dark:text-zink-200 hidden">
							<span class="font-bold">해당 부서는 등록 가능합니다.</span>
                        </div>
						
						<div id="modifyDiviDiv" class="hidden mb-4">
							<form action="${pageContext.request.contextPath}/admin/modifyDivision" method="post" id="modifyDiviForm">
								<select name="divisionCode" id="divisionSelect" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">부서 선택</option>
								</select>
								<input type="text" id="modifyDivisionName" name="divisionName" value="" placeholder="수정할 부서 이름을 입력하세요">
								<button type="button" id="confirmModifyBtn" class="px-2 py-2 text-sm rounded-md text-slate-500 bg-slate-50 dark:bg-zink-400/20 dark:text-zink-200  hover:text-white hover:bg-slate-600 hover:border-slate-600">중복 검사</button>
							</form>
						</div>
						<div id="alertModifyDivi" class="px-4 py-3 text-sm border rounded-md text-slate-500 border-slate-200 bg-slate-50 dark:bg-zink-500/30 dark:border-zink-500 dark:text-zink-200 hidden">
							<span class="font-bold">입력하신 부서명으로 수정 가능합니다.</span>
                        </div>
						
						<div id="removeDiviDiv" class="hidden mb-4">
							<form action="${pageContext.request.contextPath}/admin/removeDivision" method="post" id="removeDiviForm">
								<select name="divisionCode" id="divisionRemoveSelect" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">부서 선택</option>
								</select>
							</form>
						</div>
				
					</div>
					
					<!-- 모달 푸터 -->
					<div class="flex p-2  dark:border-zink-500 border-t ">
						<!-- 폼 변경 버튼 -->
						<div class="flex gap-1 justify-start pt-4">
							<div class="">
								<button type="button" id="showModifyDiviFormBtn" class="px-2 py-2 text-sm text-green-500 bg-white border border-green-300 rounded-md dark:bg-zink-700 dark:border-green-500 ">
					                            <span class="font-bold">부서 변경</span> 
					                        </button>
							</div>
							<div class="">
								<button type="button" id="showAddDiviFormBtn" class="px-2 py-2 text-sm bg-white border rounded-md border-custom-300 text-custom-500 dark:bg-zink-700 dark:border-custom-500">
					                            <span class="font-bold">부서 등록</span> 
					                        </button>
							</div>
							<div class="">
								<button type="button" id="showRemoveDiviFormBtn" class="px-2 py-2 text-sm text-red-500 bg-white border border-red-300 rounded-md dark:bg-zink-700 dark:border-red-500">
					                            <span class="font-bold">부서 삭제</span> 
					                        </button>
							</div>
						</div>
						
					
						<!-- 등록, 수정, 삭제 버튼 -->
						<div class="flex gap-2 items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
							<button id="resetAddDiviBtn"  type="button" class="py-2 text-red-500 bg-white border-none btn hover:text-white hover:bg-red-600 hover:border-none focus:text-white focus:bg-red-600 focus:border-none focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">다시 작성</button>
							<button id="addDiviBtn"  type="button" class="py-2 text-custom-500 bg-white border-custom-500 btn hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">등록</button>
							<button id="modifyDiviBtn"  type="button" class="py-2 text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100 hidden">수정</button>
							<button id="removeDiviBtn"  type="button" class="py-2 text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100 hidden">삭제</button>
						</div>
					</div>
					
					
				</div>
			</div> 
		</div> 
		<!-- 끝 : 모달창 -->
       
       
       
        
        
       <!-- 하위 관리 모달창 -->
       <div id="deptModalContainer" class="hidden">
				
			<div id="deptModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;"></div>
			               	
			<div id="deptFormModal" class="fixed left-1/2 transform -translate-x-1/2 z-[1000]" style="top: 40%; transform: translate(-50%, -40%); z-index: 1000;">
			
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
					
					<!-- 모달 헤더 -->
					<div class="flex items-center justify-between p-4 dark:border-zink-500 border-b">    
						<h5 class="text-16">하위 팀 관리</h5>
						<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">    
							<button type="button" id="closeDeptModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
								&#10060;
							</button>
						</div>
					</div>
					
					
					<!-- 모달 내용 -->
					<div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto mt-4">

						<div id="addDeptDiv" class="mb-4 ">
							<form action="${pageContext.request.contextPath}/admin/addDepartment" method="post" id="addDeptForm" class="flex gap-2">
								<div class="mb-1">
									<select name="divisionCode" id="selDivisionCode" class="form-input border-slate-200 dark:border-zink-500 mb-4">
										<option value="">부서 선택</option>
									</select>
								</div>
								<div class="mb-1">
									<input type="text" id="addDeptName" name="deptName" value="" placeholder="새로운 팀명" class="py-1 border border-gray-300 rounded-md ">
								</div>
								<button type="button" id="confirmDeptBtn" class="px-2 py-2 text-sm rounded-md text-slate-500 bg-slate-50 dark:bg-zink-400/20 dark:text-zink-200  hover:text-white hover:bg-slate-600 hover:border-slate-600">중복 검사</button>
							</form>
						</div>
						<div id="alertAddDept" class="px-4 py-3 text-sm border rounded-md text-slate-500 border-slate-200 bg-slate-50 dark:bg-zink-500/30 dark:border-zink-500 dark:text-zink-200 hidden">
							<span class="font-bold">해당 팀은 등록 가능합니다.</span>
                        </div>
						
						<div id="modifyDeptDiv" class="hidden mb-4">
								<select name="divisionCode" id="selModifyDivisionCode" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">부서 선택</option>
								</select>
							<form action="${pageContext.request.contextPath}/admin/modifyDepartment" method="post" id="modifyDeptForm">
								<select name="deptCode" id="selDeptCode" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">팀 선택</option>
								</select>
								<input type="text" id="modifyDeptName" name="deptName" value="" placeholder="수정할 팀 이름을 입력하세요">
								<button type="button" id="confirmModifyDeptBtn" class="px-2 py-2 text-sm rounded-md text-slate-500 bg-slate-50 dark:bg-zink-400/20 dark:text-zink-200  hover:text-white hover:bg-slate-600 hover:border-slate-600">중복 검사</button>
							</form>
						</div>
						<div id="alertModifyDept" class="px-4 py-3 text-sm border rounded-md text-slate-500 border-slate-200 bg-slate-50 dark:bg-zink-500/30 dark:border-zink-500 dark:text-zink-200 hidden">
							<span class="font-bold">입력하신 팀명으로 수정 가능합니다.</span>
                        </div>
						
						<div id="removeDeptDiv" class="hidden mb-4">
								<select name="divisionCode" id="divisionRemoveDeptsSelect" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">부서 선택</option>
								</select>
							<form action="${pageContext.request.contextPath}/admin/removeDepartment" method="post" id="removeDeptForm">
								<select name="deptCode" id="deptRemoveSelect" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">팀 선택</option>
								</select>
							</form>
						</div>
				
					</div>
					
					
					
					<!-- 모달 푸터 -->
					<div class="flex p-2  dark:border-zink-500 border-t ">
						<!-- 폼 변경 버튼 -->
						<div class="flex gap-1 justify-start pt-4">
							<div class="">
								<button type="button" id="showModifyDeptFormBtn" class="px-2 py-2 text-sm text-green-500 bg-white border border-green-300 rounded-md dark:bg-zink-700 dark:border-green-500 ">
		                            <span class="font-bold">팀 변경</span> 
		                        </button>
							</div>
							<div class="">
								<button type="button" id="showAddDeptFormBtn" class="px-2 py-2 text-sm bg-white border rounded-md border-custom-300 text-custom-500 dark:bg-zink-700 dark:border-custom-500">
		                            <span class="font-bold">팀 등록</span> 
		                        </button>
							</div>
							<div class="">
								<button type="button" id="showRemoveDeptFormBtn" class="px-2 py-2 text-sm text-red-500 bg-white border border-red-300 rounded-md dark:bg-zink-700 dark:border-red-500">
		                            <span class="font-bold">팀 삭제</span> 
		                        </button>
							</div>
						</div>
						
					
						<!-- 등록, 수정, 삭제 버튼 -->
						<div class="flex gap-2 items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
							<button id="resetAddDeptBtn"  type="button" class="py-2 text-red-500 bg-white border-none btn hover:text-white hover:bg-red-600 hover:border-none focus:text-white focus:bg-red-600 focus:border-none focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">다시 작성</button>
							<button id="addDeptBtn"  type="button" class="py-2 text-custom-500 bg-white border-custom-500 btn hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">등록</button>
							<button id="modifyDeptBtn"  type="button" class="py-2 text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100 hidden">수정</button>
							<button id="removeDeptBtn"  type="button" class="py-2 text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100 hidden">삭제</button>
						</div>
					</div>
				</div>
			</div> 
		</div> 
		<!-- 끝 : 모달창 -->
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!-- 상위 관리 모달창 script -->
   		<script type="text/javascript">
   		$(document).ready(function () {
   			/* 부서 관리 버튼 클릭 */
   			// 재직상태 모달창 관련 id 가져오기 
   			const diviModalContainer = $("#diviModalContainer");
   			const diviModalBackground = $("#diviModalBackground");
   			const diviFormModal = $("#diviFormModal");
   			const closeDiviModalBtn = $("#closeDiviModalBtn");
   			const addDiviBtn = $("#addDiviBtn");
   			

   			// 모달창 띄우기
   			$("#manageDiviBtn").click(function() {
   				
   				// 값 초기화
   			 	$('#addDivisionCode').val('');
 			    $('#addDivisionName').val('');
 			 	$('#modifyDivisionName').val('');
 			 	$('#divisionSelect').val('');

 			    // readonly 제거
 			    $('#addDivisionCode').removeAttr('readonly');
 			    $('#addDivisionName').removeAttr('readonly');
 			 	$('#modifyDivisionName').removeAttr('readonly');

 			    // 중복 검사 완료 알림 숨기기
 			    $('#alertAddDivi').addClass('hidden');
 			 	$('#alertModifyDivi').addClass("hidden");  

 			 	$('#divisionSelect').removeClass('readonly-select'); 
   				// 모달 배경과 모달 창을 보이게 하기
   				diviModalContainer.removeClass("hidden");  	

   			    
   			});

   			// 모달 닫기 함수
   			function closeDiviModal() {
   				diviModalContainer.addClass("hidden");
   			    $('body').removeClass('overflow-hidden');
   			    
   			   

   			}

   			// 닫기 버튼
   			closeDiviModalBtn.click(closeDiviModal);

   			// 수정 버튼 -> 모달창 닫기
/*    			addDiviBtn.click(function() {
   				closeDiviModal();
   			}); */

   			// 배경 클릭시 닫기
   			diviModalBackground.click(function(event) {
   			    if (event.target === this) {
   			    	closeDiviModal();
   			    }
   			});
   			
   			/* 부서 목록 조회 ajax */
	   		$.ajax({
	   	        url: '/pettopia/rest/divisionList',
	   	        method: 'GET'
	   	    }).done(function (result) {
	   	        console.log("응답받은 결과:", result);
	
	   	        // 상위 부서 목록 추가
	   	        $(result).each(function (index, item) {
	   	            $('#divisionSelect').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
	   	         	$('#divisionRemoveSelect').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
	   	        });
	
	   	    }).fail(function () {
	   	        alert('부서 호출 실패');
	   	    });
   			
   			
   			
   			

   			/* 부서 수정 모달창 폼 */
   			const modifyDiv = $('#modifyDiviDiv');
   			const modifyDiviBtn = $('#modifyDiviBtn');
   			const addDiviDiv = $('#addDiviDiv');
   			const showModifyDiviFormBtn = $('#showModifyDiviFormBtn');
   			const showAddDiviFormBtn = $('#showAddDiviFormBtn');
   			const removeDiviBtn = $("#removeDiviBtn");
   			const removeDiviDiv = $("#removeDiviDiv");
   			const showRemoveDiviFormBtn = $("#showRemoveDiviFormBtn");
   			const resetAddDiviBtn = $('#resetAddDiviBtn');
   			 
   			
   			/* 부서이름 변경하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showModifyDiviFormBtn').click(function() {
   				modifyDiv.removeClass("hidden");
   				modifyDiviBtn.removeClass("hidden");
   				
   				addDiviDiv.addClass("hidden");
   				addDiviBtn.addClass("hidden");
   				resetAddDiviBtn.removeClass("hidden");  			
   				
   				removeDiviBtn.addClass("hidden");  		// 삭제 버튼 숨기기
   	   			removeDiviDiv.addClass("hidden");  		// 삭제 폼 숨기기
   	   			$('#alertAddDivi').addClass("hidden");  
   	   			$('#alertModifyDivi').addClass("hidden");  

   			});
   			
   			/* 부서등록하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showAddDiviFormBtn').click(function() {
   				modifyDiv.addClass("hidden");
   				modifyDiviBtn.addClass("hidden");
   				
   				addDiviDiv.removeClass("hidden");
   				addDiviBtn.removeClass("hidden");
   				resetAddDiviBtn.removeClass("hidden");  
   				
   				removeDiviBtn.addClass("hidden");  		// 삭제 버튼 숨기기
   	   			removeDiviDiv.addClass("hidden");  		// 삭제 폼 숨기기
   	   			
   	   			$('#alertAddDivi').addClass("hidden"); 
   	   			$('#alertModifyDivi').addClass("hidden");  
   	   			
   			});
   			
   			/* 부서 삭제 버튼 클릭시 삭제 부분 보이기 */
   			$('#showRemoveDiviFormBtn').click(function() {
   				removeDiviBtn.removeClass("hidden");  		// 삭제 버튼 보이기
   	   			removeDiviDiv.removeClass("hidden");  		// 삭제 폼 보이기
   	   			modifyDiv.addClass("hidden");				// 수정 폼 숨기기
				modifyDiviBtn.addClass("hidden");			// 수정버튼 숨기기
				addDiviDiv.addClass("hidden");				// 등록 폼 숨기기
				addDiviBtn.addClass("hidden");				// 등록버튼 숨기기
				resetAddDiviBtn.addClass("hidden");  		// 리셋 버튼 숨기기
				$('#alertAddDivi').addClass("hidden"); 
				$('#alertModifyDivi').addClass("hidden");  
			
   			});
   			
   			
   			/* 부서 등록 */
   			$('#addDiviBtn').click(function() {
   				const divisionCode = $('#addDivisionCode').val();
				const divisionName = $('#addDivisionName').val();
				const alertAddDivi = $('#alertAddDivi');
				
				const testDivisionCode = /^[A-Za-z]+$/;
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;
			
				if(divisionCode == '' ){
					alert('부서 코드를 입력해주세요.');
					$('#addDivisionCode').focus();
					return;
				}
				
				if(divisionName == ''){
					alert('부서명을 입력해주세요.');
					$('#addDivisionName').focus();
					return;
				}
				
				if(testDivisionCode.test(divisionCode) == false){
					alert('부서코드는 영문자만 가능합니다.');
					$('#addDivisionCode').focus();
					return;
				}
				
				if(testDivisionName.test(divisionName) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#addDivisionName').focus();
					return;
				}
				
				// 중복 검사 진행 여부 확인
			    if (!$('#addDivisionCode').prop('readonly') || !$('#addDivisionName').prop('readonly')) {
			        alert('중복 검사를 진행하세요.');
			        return;
			    }
				
				$('#addDiviForm').submit();
				
				
			});
   			
   			
   			/* 다시 작성 버튼 */
   			$('#resetAddDiviBtn').click(function() {
   			  
   			    $('#addDivisionCode').val('');
   			    $('#addDivisionName').val('');
   			 	$('#modifyDivisionName').val('');

   			    // readonly 제거
   			    $('#addDivisionCode').removeAttr('readonly');
   			    $('#addDivisionName').removeAttr('readonly');
   			 	$('#modifyDivisionName').removeAttr('readonly');

   			    // 중복 검사 완료 알림 숨기기
   			    $('#alertAddDivi').addClass('hidden');
   			 	$('#alertModifyDivi').addClass("hidden");  

   			 	$('#divisionSelect').removeClass('readonly-select'); 
			});
   			
   			
   			/* 부서 수정 */
			$('#modifyDiviBtn').click(function() {
				
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;
				
				// 부서가 선택되지 않았는지 확인
			    if ($('#divisionSelect').val() === '') {
			        alert('수정할 부서를 선택해주세요.');
			        $('#divisionSelect').focus();
			        return;
			    }

   				if($('#modifyDivisionName').val() == null || $('#modifyDivisionName').val() == '' ){
   					alert('수정할 부서명을 입력해주세요.');
   					$('#modifyDivisionName').focus();
   					return;
   				}
   				
   				if(testDivisionName.test($('#modifyDivisionName').val()) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#addDivisionName').focus();
					return;
				}
   				
				// 중복 검사 진행 여부 확인
			    if (!$('#modifyDivisionName').prop('readonly')) {
			        alert('중복 검사를 진행하세요.');
			        return;
			    }

   				$('#modifyDiviForm').submit();
   			});
   			
   			
			/* 부서 삭제 */
			$('#removeDiviBtn').click(function() {
				
				// 부서가 선택되지 않았는지 확인
			    if ($('#divisionRemoveSelect').val() === '') {
			        alert('삭제할 부서를 선택해주세요.');
			        $('#divisionRemoveSelect').focus();
			        return;
			    }

   				
			    if (confirm('정말로 삭제하시겠습니까?')) {
			        $('#removeDiviForm').submit();
			    }
   			});
   			
			
			/* 부서 등록시 이름, 코드 중복 확인 */
			$('#confirmBtn').click(function() {
				const divisionCode = $('#addDivisionCode').val();
				const divisionName = $('#addDivisionName').val();
				const alertAddDivi = $('#alertAddDivi');
				
				const testDivisionCode = /^[A-Za-z]+$/;
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;
			
				if(divisionCode == '' ){
					alert('부서 코드를 입력해주세요.');
					$('#addDivisionCode').focus();
					return;
				}
				
				if(divisionName == ''){
					alert('부서명을 입력해주세요.');
					$('#addDivisionName').focus();
					return;
				}
				
				if(testDivisionCode.test(divisionCode) == false){
					alert('부서코드는 영문자만 가능합니다.');
					$('#addDivisionCode').focus();
					return;
				}
				
				if(testDivisionName.test(divisionName) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#addDivisionName').focus();
					return;
				}

				/* 부서 중복 검사 ajax */
		   		$.ajax({
		   	        url: '/pettopia/rest/confirmDivision',
		   	        method: 'GET',
		   	     	data: {
		   	        	divisionCode: divisionCode,
		   	        	divisionName: divisionName
		   	     	}
		   	    }).done(function (result) {
		   	        console.log("응답받은 결과:", result);
					
		   	        if( result == 'C' ){ // 
		   	        	alert('부서코드 중복! 다시 작성해주세요.');
		   	        	$('#addDivisionCode').focus();
		   	        	return;
		   	        }
		   	        
		   	        if(result == 'N'){
		   	        	alert('부서명 중복! 다시 작성해주세요.');
		   	        	$('#addDivisionName').focus();
						return;
		   	        }
		   	        
		   	        if(result == 'A'){
		   	        	alertAddDivi.removeClass('hidden');
		   	        	$('#addDivisionCode').attr('readonly', true);
		   	        	$('#addDivisionName').attr('readonly', true);
		   	        	return;
		   	        }
		   	        
		
		   	    }).fail(function () {
		   	        alert('부서 호출 실패');
		   	    });
				
			});
			
			
			
			/* 부서명 수정시 이름 중복 확인 */
			$('#confirmModifyBtn').click(function() {
				
				const divisionName = $('#modifyDivisionName').val();
				const alertModifyDivi = $('#alertModifyDivi');
				
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;

				// 부서가 선택되지 않았는지 확인
			    if ($('#divisionSelect').val() === '') {
			        alert('수정할 부서를 선택해주세요.');
			        $('#divisionSelect').focus();
			        return;
			    }

   				if($('#modifyDivisionName').val() == null || $('#modifyDivisionName').val() == '' ){
   					alert('수정할 부서명을 입력해주세요.');
   					$('#modifyDivisionName').focus();
   					return;
   				}
   				
   				if(testDivisionName.test($('#modifyDivisionName').val()) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#addDivisionName').focus();
					return;
				}

				
				/* 부서 중복 검사 ajax */
		   		$.ajax({
		   	        url: '/pettopia/rest/confirmDivision',
		   	        method: 'GET',
		   	     	data: {
		   	        	divisionName: divisionName
		   	     	}
		   	    }).done(function (result) {
		   	        console.log("응답받은 결과:", result);
					
		   	        if( result == 'C' ){ // 
		   	        	alert('부서코드 중복! 다시 작성해주세요.');
		   	        	$('#addDivisionCode').focus();
		   	        	return;
		   	        }
		   	        
		   	        if(result == 'N'){
		   	        	alert('부서명 중복! 다시 작성해주세요.');
		   	        	$('#addDivisionName').focus();
						return;
		   	        }
		   	        
		   	        if(result == 'A'){
		   	        	alertModifyDivi.removeClass('hidden');
		   	        	
		   	        	$('#modifyDivisionName').attr('readonly', true);
		   	        	$('#divisionSelect').addClass('readonly-select'); 
		   	        	return;
		   	        }
		   	        
		
		   	    }).fail(function () {
		   	        alert('부서 호출 실패');
		   	    });
				
			});
			

   		});	
   		</script>
   		<!-- 끝 : 상위 관리 모달창 script -->
   		

<!-- ---------------------------------------------------------------------------------------------------------------------------------  -->
   		
   		<!-- 팀 관리 모달창 script -->
   		<script type="text/javascript">
   		$(document).ready(function () {
   			

   			/* 팀 관리 버튼 클릭 */
   			// 모달창 관련
   			const deptModalContainer = $("#deptModalContainer");
   			const deptModalBackground = $("#deptModalBackground");
   			const deptFormModal = $("#deptFormModal");
   			const closeDeptModalBtn = $("#closeDeptModalBtn");
   			
   			
	   		/* 팀 관리 모달 body 폼 */
	   		const showModifyDeptFormBtn = $('#showModifyDeptFormBtn');
	   		const showAddDeptFormBtn = $('#showAddDeptFormBtn');
	   		const showRemoveDeptFormBtn = $('#showRemoveDeptFormBtn');
	   		
	   		const addDeptDiv = $('#addDeptDiv');
	   		const modifyDeptDiv = $('#modifyDeptDiv');
	   		const removeDeptDiv = $('#removeDeptDiv');
	   		
	   		const resetAddDeptBtn = $('#resetAddDeptBtn');
	   		const addDeptBtn = $('#addDeptBtn');
	   		const modifyDeptBtn = $('#modifyDeptBtn');
	   		const removeDeptBtn = $('#removeDeptBtn');
	   		
	   		const alertModifyDept = $('#alertModifyDept');
	   		const alertAddDept = $('#alertAddDept');
   			
   			


   			// 모달창 띄우기
   			$("#manageDeptBtn").click(function() {
   			   
   				// 모달 배경과 모달 창을 보이게 하기
   				deptModalContainer.removeClass("hidden");  	
   			    
   			});

   			// 모달 닫기 함수
   			function closeDeptModal() {
   				deptModalContainer.addClass("hidden");
   			    $('body').removeClass('overflow-hidden');
   			    
   			}

   			// 닫기 버튼
   			closeDeptModalBtn.click(closeDeptModal);

   			// 수정 버튼 -> 모달창 닫기
   			addDeptBtn.click(function() {
   				closeDeptModal();
   			});

   			// 배경 클릭시 닫기
   			deptModalBackground.click(function(event) {
   			    if (event.target === this) {
   			    	closeDeptModal();
   			    }
   			});
   			
   			
   			/* 부서 목록 조회 ajax */
	   		$.ajax({
	   	        url: '/pettopia/rest/divisionList',
	   	        method: 'GET'
	   	    }).done(function (result) {
	   	        console.log("응답받은 결과:", result);
	
	   	        // 상위 부서 목록 추가
	   	        $(result).each(function (index, item) {
	   	            $('#selDivisionCode').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
	   	         	$('#divisionRemoveDeptsSelect').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
	   	         	$('#selModifyDivisionCode').append('<option value="' + item.divisionCode + '">'+ item.divisionName+ '</option>');
	   	        });
	
	   	    }).fail(function () {
	   	        alert('부서 호출 실패');
	   	    });
   			
   		
	
   			/* 팀 이름 변경하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showModifyDeptFormBtn').click(function() {
   				
   				modifyDeptDiv.removeClass("hidden");
   				modifyDeptBtn.removeClass("hidden");
   				
   				addDeptDiv.addClass("hidden");
   				removeDeptDiv.addClass("hidden");
   				
   				resetAddDeptBtn.removeClass("hidden"); 
   				addDeptBtn.addClass("hidden");
   				modifyDeptBtn.removeClass("hidden"); 
   				removeDeptBtn.addClass("hidden");
   				
   				alertModifyDept.addClass("hidden");
   				alertAddDept.addClass("hidden");

   			});
   			
   			/* 팀 등록하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showAddDeptFormBtn').click(function() {
   				
   				modifyDeptDiv.addClass("hidden");
   				modifyDeptBtn.addClass("hidden");
   				
   				addDeptDiv.removeClass("hidden");
   				addDeptBtn.removeClass("hidden");
   				
   				resetAddDeptBtn.removeClass("hidden");  
   				removeDeptBtn.addClass("hidden");  		// 삭제 버튼 숨기기
   				removeDeptDiv.addClass("hidden");  		// 삭제 폼 숨기기
   	   			
   				alertModifyDept.addClass("hidden"); 
   				alertAddDept.addClass("hidden");  
   				
   	   			
   			});
   			
   			/* 팀 삭제 버튼 클릭시 삭제 부분 보이기 */
   			$('#showRemoveDeptFormBtn').click(function() {
   				
   				removeDeptBtn.removeClass("hidden");  		// 삭제 버튼 보이기
   				removeDeptDiv.removeClass("hidden");  		// 삭제 폼 보이기
   	   			
   				modifyDeptDiv.addClass("hidden");			// 수정 폼 숨기기
   				modifyDeptBtn.addClass("hidden");			// 수정버튼 숨기기
				
   				addDeptDiv.addClass("hidden");				// 등록 폼 숨기기
   				addDeptBtn.addClass("hidden");				// 등록버튼 숨기기
				
   				resetAddDeptBtn.addClass("hidden");  		// 리셋 버튼 숨기기
				
   				alertModifyDept.addClass("hidden"); 
   				alertAddDept.addClass("hidden"); 
			
   			});
   			
   			

   			/* 다시 작성 버튼 */
   			$('#resetAddDeptBtn').click(function() {
   			  
   			    $('#addDeptName').val('');
   			    $('#selDivisionCode').val('');
   			 	$('#selDeptCode').val('');
   			 	$('#modifyDeptName').val('');   			 	
   			 	$('#selModifyDivisionCode').val('');


   			    // readonly 제거
   			    $('#addDeptName').removeAttr('readonly');
   			    $('#modifyDeptName').removeAttr('readonly');

   			    // 중복 검사 완료 알림 숨기기
   			    $('#alertModifyDept').addClass('hidden');
   			 	$('#alertAddDept').addClass("hidden");  

   			 	$('#selDivisionCode').removeClass('readonly-select'); 
   			 	$('#selModifyDivisionCode').removeClass('readonly-select'); 
   			 	$('#selDeptCode').removeClass('readonly-select'); 
			});
   			
   			
   			
   			/* 팀 등록시 이름 중복 확인 */
			$('#confirmDeptBtn').click(function() {

				const deptName = $('#addDeptName').val();
				const selDivision = $('#selDivisionCode').val();
				const alertAddDept = $('#alertAddDept');
				
				const testDeptName = /^[A-Za-z가-힣\s&-]+$/;
			
				if(selDivision == ''){
					alert('소속 부서를 입력해주세요.');
					$('#selDivisionCode').focus();
					return;
				}

				if(deptName == ''){
					alert('팀명을 입력해주세요.');
					$('#addDeptName').focus();
					return;
				}
				
				if(testDeptName.test(deptName) == false){
					alert('팀명에 허용되지 않은 특수문자는 사용할 수 없습니다.');
					$('#addDeptName').focus();
					return;
				}

				/* 팀명 중복 검사 ajax */
		   		$.ajax({
		   	        url: '/pettopia/rest/confirmDepartment',
		   	        method: 'GET',
		   	     	data: {
		   	        	deptName: deptName
		   	     	}
		   	    }).done(function (result) {
		   	        console.log("응답받은 결과:", result);
		   	        
		   	        if(result == 'N'){
		   	        	alert('팀명 중복! 다시 작성해주세요.');
		   	        	$('#addDeptName').focus();
						return;
		   	        }
		   	        
		   	        if(result == 'Y'){
		   	        	alertAddDept.removeClass('hidden');
		   	        	$('#selDivisionCode').addClass('readonly-select'); 
		   	        	$('#addDeptName').attr('readonly', true);
		   	        	return;
		   	        }
		   	        
		
		   	    }).fail(function () {
		   	        alert('중복검사 호출 실패');
		   	    });
				
			});
   			
   			
   			/* 팀 등록 */
   			$('#addDeptBtn').click(function() {
   				const divisionCode = $('#addDivisionCode').val();
   				const deptName = $('#addDeptName').val();
				const selDivision = $('#selDivisionCode').val();
				const alertAddDept = $('#alertAddDept');
				
				const testDeptName = /^[A-Za-z가-힣\s&-]+$/;
			
				if(selDivision == ''){
					alert('소속 부서를 입력해주세요.');
					$('#selDivisionCode').focus();
					return;
				}

				if(deptName == ''){
					alert('팀명을 입력해주세요.');
					$('#addDeptName').focus();
					return;
				}
				
				if(testDeptName.test(deptName) == false){
					alert('팀명에 허용되지 않은 특수문자는 사용할 수 없습니다.');
					$('#addDeptName').focus();
					return;
				}
				
				// 중복 검사 진행 여부 확인
			    if (!$('#addDeptName').prop('readonly') ) {
			        alert('중복 검사를 진행하세요.');
			        return;
			    }
				
				$('#addDeptForm').submit();
				
				
			});
   			
   			
   			
   			
   			
   			
   			/* 부서 선택시 하위 팀 출력 */
			$('#selModifyDivisionCode').change(function() {
				$.ajax({
						url : '/pettopia/rest/departmentList/'+ $('#selModifyDivisionCode').val(),
						method : 'GET'
				}).done(function(result) {
						// 팀 리셋
						$('#selDeptCode').empty();
						$('#selDeptCode').append('<option value="">팀 선택</option>');
				
						$(result).each(function(index,item) {
							$('#selDeptCode').append('<option value="' + item.deptCode + '">'+ item.deptName+ '</option>');});
				
				}).fail(function() {
					alert('팀 호출 실패');
				});
			
			});
   			
			/* 팀명 수정시 이름 중복 확인 */
			$('#confirmModifyDeptBtn').click(function() {
				
				const deptName = $('#modifyDeptName').val();
				const alertModifyDept = $('#alertModifyDept');
				
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;

				// 부서와 수정하려는 팀이 선택되지 않았는지 확인
			    if ($('#selModifyDivisionCode').val() === '' || $('#selDeptCode').val() === '') {
			        alert('수정할 팀을 선택해주세요.');
			        $('#selModifyDivisionCode').focus();
			        return;
			    }
			  

   				if($('#modifyDeptName').val() == null || $('#modifyDeptName').val() == '' ){
   					alert('수정할 팀명을 입력해주세요.');
   					$('#modifyDeptName').focus();
   					return;
   				}
   				
   				if(testDivisionName.test($('#modifyDeptName').val()) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#modifyDeptName').focus();
					return;
				}

				
				/* 팀명 중복 검사 ajax */
		   		$.ajax({
		   	        url: '/pettopia/rest/confirmDepartment',
		   	        method: 'GET',
		   	     	data: {
		   	        	deptName: deptName
		   	     	}
		   	    }).done(function (result) {
		   	        console.log("응답받은 결과:", result);
					
		   	     	if(result == 'N'){
		   	        	alert('팀명 중복! 다시 작성해주세요.');
		   	        	$('#modifyDeptName').focus();
						return;
		   	        }
		   	        
		   	        if(result == 'Y'){
		   	        	alertModifyDept.removeClass('hidden');
		   	        	$('#selModifyDivisionCode').addClass('readonly-select'); 
		   	        	$('#selDeptCode').addClass('readonly-select'); 
		   	        	$('#modifyDeptName').attr('readonly', true);
		   	        	return;
		   	        }

		   	    }).fail(function () {
		   	        alert('중복검사 호출 실패');
		   	    });
				
			});
			
			
			/* 팀명 수정 */
			$('#modifyDeptBtn').click(function() {
				
				const deptName = $('#modifyDeptName').val();
				const alertModifyDept = $('#alertModifyDept');
				
				const testDivisionName = /^[A-Za-z가-힣\s&-]+$/;

				// 부서와 수정하려는 팀이 선택되지 않았는지 확인
			    if ($('#selModifyDivisionCode').val() === '' || $('#selDeptCode').val() === '') {
			        alert('수정할 팀을 선택해주세요.');
			        $('#selModifyDivisionCode').focus();
			        return;
			    }
			  

   				if($('#modifyDeptName').val() == null || $('#modifyDeptName').val() == '' ){
   					alert('수정할 팀명을 입력해주세요.');
   					$('#modifyDeptName').focus();
   					return;
   				}
   				
   				if(testDivisionName.test($('#modifyDeptName').val()) == false){
					alert('부서명에 특수문자는 사용할 수 없습니다.');
					$('#modifyDeptName').focus();
					return;
				}
   				
				// 중복 검사 진행 여부 확인
			    if (!$('#modifyDeptName').prop('readonly')) {
			        alert('중복 검사를 진행하세요.');
			        return;
			    }

   				$('#modifyDeptForm').submit();
   			});
			
			
   			

			/* 팀 삭제 */
			$('#removeDeptBtn').click(function() {
				
				// 부서가 선택되지 않았는지 확인
			    if ($('#divisionRemoveDeptsSelect').val() === '' || $('#deptRemoveSelect').val() === '') {
			        alert('삭제할 팀을 선택해주세요.');
			        $('#divisionRemoveDeptsSelect').focus();
			        return;
			    }

   				
			    if (confirm('정말로 삭제하시겠습니까?')) {
			        $('#removeDeptForm').submit();
			    }
   			});
   			
			/* 부서 선택시 하위 팀 출력 */
			$('#divisionRemoveDeptsSelect').change(function() {
				$.ajax({
						url : '/pettopia/rest/departmentList/'+ $('#divisionRemoveDeptsSelect').val(),
						method : 'GET'
				}).done(function(result) {
						// 팀 리셋
						$('#deptRemoveSelect').empty();
						$('#deptRemoveSelect').append('<option value="">팀 선택</option>');
				
						$(result).each(function(index,item) {
							$('#deptRemoveSelect').append('<option value="' + item.deptCode + '">'+ item.deptName+ '</option>');});
				
				}).fail(function() {
					alert('팀 호출 실패');
				});
			
			});
   			
   			
   			
   			
   			
   		});
   		</script>

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

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


<script type="text/javascript">
$(document).ready(function () {
    console.log("ajax 실행");

    /* 상위 부서 조회 */
    $.ajax({
        url: '/pettopia/rest/divisionList',
        method: 'GET'
    }).done(function (result) {
        console.log("응답받은 결과:", result);

        
        // 상위 부서 목록 추가
        $(result).each(function (index, item) {
            $('#divisionDiv').append(
                '<div class="relative p-3 pl-2 mb-5 w-52 h-16 text-lg border border-t-2 border-transparent rounded-md border-t-custom-500 text-custom-500 bg-custom-50 flex justify-center items-center text-center" id="clickDiviDiv" onclick="fetchDepartmentList(\'' + item.divisionCode + '\')" style="text-align: center;">' +
                '<span  id="divifont">' + item.divisionName + '</span>' +
                '</div>'
            );
        });

    }).fail(function () {
        alert('부서 호출 실패');
    });

    // 하위 팀 조회 함수
    window.fetchDepartmentList = function (divisionCode) {
        // 기존 하위 팀 목록 초기화
        $('#departDiv').empty();

        const chartContainer = document.getElementById('orgchart');

    	// 기존 OrgChart 인스턴스가 존재하는지 확인
        if (chartContainer) {
            
            chartContainer.innerHTML = '';  // 기존 DOM 내용 제거
            console.log("OrgChart 인스턴스가 제거되었습니다.");
        } else {
            console.log("OrgChart 인스턴스가 존재하지 않습니다.");
        } 
   	
      
        
        /* 하위 팀 조회 */
        $.ajax({
            url: '/pettopia/rest/departmentList/' + divisionCode,
            method: 'GET'
        }).done(function (result) {
            console.log("하위 팀 조회 결과:", result);

            // 하위 팀 목록 추가
            $(result).each(function (index, item) {
                $('#departDiv').append(
                    '<div id="deptDivSel" class="relative mb-5 w-52 h-24 text-lg text-green-500 border border-t-2 border-transparent rounded-md bg-green-50 border-t-green-300 flex justify-center items-center text-center" style="text-align: center;" >' +
                    '<span id="divifont">' + item.deptName + '</span>' +
                    '<input class="hidden" id="deptCode" value="'+item.deptCode+'">' +
                    '</div>'
                );
            });

        }).fail(function () {
            alert('팀 호출 실패');
        });
    
    };

    // 클릭된 상위 부서 강조
    $(document).on('click', '#divisionDiv > div', function () {
        $('#divisionDiv > div').removeClass('text-white bg-custom-500'); // 기존 강조 제거
        $(this).addClass('text-white bg-custom-500'); // 클릭한 항목 강조
          
    });
    
    // 클릭된 하위 부서 강조
    $(document).on('click', '#departDiv > div', function () {
        $('#departDiv > div').removeClass('text-white bg-green-500'); // 기존 강조 제거
        $(this).addClass('text-white bg-green-500'); // 클릭한 항목 강조
          
    });

    
    
    

});
</script>



</body>

</html>