<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 시큐리티 세션 사용을 위한 taglib %@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>-->

<!-- 시큐리티 세션정보 접근 -->
<!-- 
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var=""/></sec:authorize>
 -->
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
<style>
	.editor-container_classic-editor .editor-container__editor {    min-width: 795px; max-width:1280px;}
	
</style>
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
                        <h5 class="text-16">사내 게시판</h5>
                    </div>
                    
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">사내 게시판</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            게시판 리스트
                        </li>
                    </ul>
                    
                    
                </div>
                <!-- Main content -->
                
                <div>
        	
           		
                   
                     
                    <div class="card">
                    <div class="card-body">
                    	
                    
                  			   <div class="ltr:lg:text-right rtl:lg:text-left">
                                    <a href="${pageContext.request.contextPath}/board/addBoard" type="button" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20"><i data-lucide="plus" class="inline-block size-4"></i> <span class="align-middle">글쓰기</span></a>
                                </div>
                  		
                  		<div id="boardListContainer">	
                        	<form action="${pageContext.request.contextPath}/board/boardList" method="get" id="formCategory">
								
								
								
								
								<select name="category" class="form-select" id="boardCategory">
									<option value="ALL" ${boardCategory == 'ALL' ? 'selected' : ''}>전체</option>
									<option value="SG" ${boardCategory == 'SG' ? 'selected' : ''}>건의사항</option>
									<option value="DS" ${boardCategory == 'DS' ? 'selected' : ''}>토론</option>
									<option value="CT" ${boardCategory == 'CT' ? 'selected' : ''}>잡답</option>
									<option value="IN" ${boardCategory == 'IN' ? 'selected' : ''}>정보</option>
									<option value="QA" ${boardCategory == 'QA' ? 'selected' : ''}>질문</option>
									<option value="CP" ${boardCategory == 'CP' ? 'selected' : ''}>칭찬</option>
								</select>
								
							</form>
                        <table id="basic_tables" class="display stripe group" style="width:100%">
                            <thead>
                                <tr>
	                         		<th class="text-center ltr:!text-left rtl:!text-right">번호</th>
	                                <th class="text-center" >제목</th>
								    <th class="text-center" >조회수</th>
								    <th class="text-center" >추천</th>
								    <th class="text-center" >작성일</th>
								    <th class=""></th>   
                                </tr>
                            </thead>
                            <tbody>
                            
	                           <c:forEach var="bl" items="${boardList}">
								    <tr>
								        <td class="text-center">${bl.boardNum}</td>
								        <td class="text-center">
								            <a href="#">[${bl.boardHeader}]&nbsp;${bl.boardTitle}</a>
								            <!-- 댓글 수가 0이 아니면 댓글 수 표시 -->
								            <c:if test="${bl.commentCnt != 0}">
								                &nbsp;[${bl.commentCnt}]
								            </c:if>
								        </td>
								        <td class="text-center">${bl.boardView}</td>
								        <td class="text-center">${bl.boardLike}</td>
								        <td class="text-center">${bl.createDate}</td>
								        
								        <!-- 로그인한 사용자(empNo)와 게시물 작성자(bl.boardWriterNo)가 같은 경우에만 삭제 버튼 표시 -->
								        <c:if test="${bl.boardWriterNo == empNo}">
								            <td class="text-center"><a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${bl.boardNo}">삭제</a></td>
								        </c:if>
								        
								        <!-- 작성자가 아닌 경우 빈 칸 표시 -->
								        <c:if test="${bl.boardWriterNo != empNo}">
								            <td class="text-center">&nbsp;</td>
								        </c:if>
								    </tr>
								</c:forEach>
							</tbody>
                        </table>
                    </div>
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


<script src="${pageContext.request.contextPath}/assets/js/datatables/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/data-tables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/data-tables.tailwindcss.min.js"></script>
<!--buttons dataTables-->
<script src="${pageContext.request.contextPath}/assets/js/datatables/datatables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatables/buttons.print.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/datatables/datatables.init.js"></script>


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

<script>
$(document).ready(function(){
	$('#boardCategory').change(function(){
		$('#formCategory').submit();
	})
})


</script>

</body>

</html>