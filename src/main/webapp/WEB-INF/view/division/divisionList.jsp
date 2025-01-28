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
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<!-- Google Chart 라이브러리 로드 -->
	<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
  
  	<!-- Balkan orgchart -->
  	<script src="${pageContext.request.contextPath}/assets/js/balkanOrgchart/orgchart.js"></script>
  	<script src="https://balkan.app/js/OrgChart.js"></script>
  
	<style>
	/* 스타일을 추가해 조직도를 보기 좋게 표시 */

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
			            img : "${pageContext.request.contextPath}/employeeFile/"+node.fileName
			            
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
                    nodes: hierarchy,
                    nodeBinding: {// 노드에 표시할 내용
                    	 img_0: "img",
                         field_0: "name",
                         field_1: "title" 
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
    
    <div class="relative min-h-screen group-data-[sidebar-size=sm]:min-h-sm">
        <div class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
            <div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">
                <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
                    <div class="grow">
                        <h5 class="text-16">부서 목록</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">부서 관리</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            부서 목록
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
				<div class="card">
					<div class="card-body flex gap-4 ">
				    
				        <!-- 상위 부서 목록 -->
						<div class="grid xl:grid-cols-1" id="divisionDiv" style="border: solid 1px green;">
				        </div>
				        
				        <!-- 하위 팀 목록 -->
				        <div class="grid xl:grid-cols-1" id="departDiv" style="border: solid 1px purple;">
				            <div class="grid xl:grid-cols-1 px-5">
				                <span>부서를 선택해 주세요</span>
				            </div>
				        </div >
				        
				        <!-- 조직도 -->
				        <div id="orgchart" class="grid xl:grid-cols-1" style="border: solid 1px blue;  width: 80%; " >
				        	<div class="grid xl:grid-cols-4 px-5 hidden">
				                <span>팀을 선택해 주세요</span>
				            </div>
				        </div>
				        
				        
					</div>
				    
				   	<!-- 버튼 -->
					<div class="px-4 py-4 flex justify-end gap-1">
						<button id="manageDiviBtn" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
						    부서 관리
						</button>
						<button id="manageDeptBtn" type="button" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">
						    팀 관리
						</button>
					</div>
				    
				    
				</div>

				<!-- 끝 :  card -->
                
                
                
                
                
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
	
	
	
	


       
       
       
       
       
       
       
       <!-- 상위 관리 모달창 -->
       <div id="diviModalContainer" class="hidden">
				
			<div id="diviModalBackground"class="fixed inset-0" style="background-color: rgba(0, 0, 0, 0.75); z-index: 40;"></div>
			               	
			<div id="diviFormModal" class="fixed left-1/2 transform -translate-x-1/2 z-[1000]" style="top: 40%; transform: translate(-50%, -40%); z-index: 1000;">
			
				<div class="w-screen md:w-[30rem] bg-white shadow rounded-md dark:bg-zink-600 flex flex-col h-full">
					<!-- 모달 헤더 -->
					<div class="flex items-center justify-between p-4 dark:border-zink-500">    
						<h5 class="text-16">상위 부서 관리</h5>
						<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">    
							<button type="button" id="closeDiviModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
								&#10060;
							</button>
						</div>
					</div>
					<!-- 모달 내용 -->
					<div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">

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
						
						<div id="modifyDiviDiv" class="hidden mb-4">
							<form action="${pageContext.request.contextPath}/admin/modifyDivision" method="post" id="modifyDiviForm">
								<select name="divisionCode" id="divisionSelect" class="form-input border-slate-200 dark:border-zink-500 mb-4">
									<option value="">부서 선택</option>
								</select>
								<input type="text" id="modifyDivisionName" name="divisionName" value="" placeholder="수정할 부서 이름을 입력하세요">
							</form>
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
						
					
					
						<div class="flex gap-2 items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
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
					<div class="flex items-center justify-between p-4 dark:border-zink-500  ml-auto">    
						<button type="button" id="closeDeptModalBtn" class="transition-all duration-200 ease-linear text-slate-500 hover:text-red-500 dark:text-zink-200 dark:hover:text-red-500">
							&#10060;
						</button>
					</div>
					<div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
						
					</div>
					<div class="flex items-center justify-between p-4 mt-auto 0 dark:border-zink-500 ml-auto">
						<button id="addDeptBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">등록</button>
						<button id="modifyDeptBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">수정</button>
						<button id="removeDeptBtn"  type="button" class="text-white btn bg-custom-500 hover:bg-custom-600">삭제</button>
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
   			
   			
   			/* 부서이름 변경하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showModifyDiviFormBtn').click(function() {
   				modifyDiv.removeClass("hidden");
   				modifyDiviBtn.removeClass("hidden");
   				
   				addDiviDiv.addClass("hidden");
   				addDiviBtn.addClass("hidden");
   				
   				removeDiviBtn.addClass("hidden");  		// 삭제 버튼 숨기기
   	   			removeDiviDiv.addClass("hidden");  		// 삭제 폼 숨기기
   	   			

   			});
   			
   			/* 부서등록하기 버튼 클릭시 수정 부분 보이기 */
   			$('#showAddDiviFormBtn').click(function() {
   				modifyDiv.addClass("hidden");
   				modifyDiviBtn.addClass("hidden");
   				
   				addDiviDiv.removeClass("hidden");
   				addDiviBtn.removeClass("hidden");
   				
   				removeDiviBtn.addClass("hidden");  		// 삭제 버튼 숨기기
   	   			removeDiviDiv.addClass("hidden");  		// 삭제 폼 숨기기
   	   			
   			});
   			
   			/* 부서 삭제 버튼 클릭시 삭제 부분 보이기 */
   			$('#showRemoveDiviFormBtn').click(function() {
   				removeDiviBtn.removeClass("hidden");  		// 삭제 버튼 보이기
   	   			removeDiviDiv.removeClass("hidden");  		// 삭제 폼 보이기
   	   			modifyDiv.addClass("hidden");				// 수정 폼 숨기기
				modifyDiviBtn.addClass("hidden");			// 수정버튼 숨기기
				addDiviDiv.addClass("hidden");				// 등록 폼 숨기기
				addDiviBtn.addClass("hidden");				// 등록버튼 숨기기
			
   			});
   			
   			/* 영어 대문자 정규식 */ 
   			const engUp = /^[A-Z]*$/;
   			
   			/* 부서 등록 */
   			$('#addDiviBtn').click(function() {
   				
   				if($('#addDivisionCode').val() == null || $('#addDivisionCode').val() == '' ){
   					alert('부서 코드를 입력해주세요.');
   					$('#addDivisionCode').focus();
   					return;
   				}
   				
   				if(engUp.test($('#addDivisionCode').val()) == false ){
   					alert('부서코드는 영어 대문자만 허용됩니다.');
   					$('#addDivisionCode').focus();
   					return;
   				}

   				if($('#addDivisionName').val() == null || $('#addDivisionName').val() == '' ){
   					alert('등록할 부서명을 입력해주세요.');
   					$('#addDivisionName').focus();
   					return;
   				}
   				
   				$('#addDiviForm').submit();
   			});
   			
   			/* 부서 수정 */
			$('#modifyDiviBtn').click(function() {
				
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

   				
   				$('#removeDiviForm').submit();
   			});
   			
			
			/* 부서 이름, 코드 중복 확인 */
			$('#confirmBtn').click(function() {
				const divisionCode = $('#addDivisionCode').val();
				const divisionName = $('#addDivisionName').val();
				
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
		
		   	        
		
		   	    }).fail(function () {
		   	        alert('부서 호출 실패');
		   	    });
				
			});
			
			
			
   			
   			
   			

   			
   		});	
   		</script>
   		
   		
   		<!-- 팀 관리 -->
   		<script type="text/javascript">
   		$(document).ready(function () {
   			

   			/* 팀 관리 버튼 클릭 */
   			// 재직상태 모달창 관련 id 가져오기 
   			const deptModalContainer = $("#deptModalContainer");
   			const deptModalBackground = $("#deptModalBackground");
   			const deptFormModal = $("#deptFormModal");
   			const closeDeptModalBtn = $("#closeDeptModalBtn");
   			const addDeptBtn = $("#addDeptBtn");
   			const removeDeptBtn = $("#removeDeptBtn");

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
                '<div class="p-3 m-2 w-64" id="clickDiviDiv" onclick="fetchDepartmentList(\'' + item.divisionCode + '\')" style="border: solid 1px blue;">' +
                '<span>' + item.divisionName + '</span>' +
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
                    '<div id="deptDivSel" class="p-3 m-2 w-64" style="border: solid 1px red;">' +
                    '<span>' + item.deptName + '</span>' +
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
        $('#divisionDiv > div').removeClass('bg-blue-500 text-white'); // 기존 강조 제거
        $(this).addClass('bg-blue-500 text-white'); // 클릭한 항목 강조
        
       
        
    });

    
    
    

});
</script>



</body>

</html>