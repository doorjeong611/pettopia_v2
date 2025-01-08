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
        	
           		<div class="card" id="productListTable">
                    <div class="card-body">
                        <div class="grid grid-cols-1 gap-4 lg:grid-cols-2 xl:grid-cols-12">
                             
                              <div class="xl:col-span-2">
                              <form action="${pageContext.request.contextPath}/board/boardList" method="get" id="formCategory">
	                                <select class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
	                                    <option selected>카테고리 선택</option>
	                                    <option value="SG">건의사항</option>
	                                    <option value="CT">잡답</option>
	                                    <option value="IN">정보</option>
	                                    <option value="QA">질문</option>
	                                    <option value="CP">칭찬</option>
	                                    <option value="DS">토론</option>
	                                </select>
                                </form>
                               </div>
                            <div class="xl:col-span-3">
                    	
                         
                           	   <div class="relative">
                                    <input type="text" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="Search for ..." autocomplete="off">
                                    <i data-lucide="search" class="inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"></i>
                               </div>
                            </div><!--end col-->
                        </div><!--end grid-->
                    </div>
                    <div class="!pt-1 card-body">
                        <div class="overflow-x-auto">
                            <table class="w-full whitespace-nowrap" id="productTable">
                                <thead class="ltr:text-left rtl:text-right bg-slate-100 dark:bg-zink-600">
                                    <tr>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >번호</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >제목</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >카테고리</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >조회수</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >추천</th>
                                        <th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500 text-center" >작성일</th>
                                    	<th class="px-3.5 py-2.5 font-semibold border-b border-slate-200 dark:border-zink-500" ></th>
                                    </tr>
                                </thead>
                                <tbody class="list">
                                   <c:forEach var="bl" items="${boardList}">
                                   
                                   <c:if test="${bl.commentCnt!=0}">
                                    <tr>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${bl.boardNum}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 product_name text-center"><a href="#">${bl.boardTitle}&nbsp;[${bl.commentCnt}]</a></td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 category text-center">${bl.boardHeader}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 stock text-center">${bl.boardView}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 revenue text-center">${bl.boardLike}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 price text-center" >${bl.createDate}</td>
                                    	<td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 revenue text-center"><a href="#">삭제</a></td>
                                    </tr>
                                   </c:if>
                                   
                                   <c:if test="${bl.commentCnt==0}">
                                      <tr>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 text-center">${bl.boardNum}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 product_name text-center"><a href="#">${bl.boardTitle}</a></td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 category text-center">${bl.boardHeader}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 stock text-center">${bl.boardView}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 revenue text-center">${bl.boardLike}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 price text-center" >${bl.createDate}</td>
                                        <td class="px-3.5 py-2.5 border-y border-slate-200 dark:border-zink-500 revenue text-center"><a href="#">삭제</a></td>
                                    </tr>
                                   </c:if>
                                   
                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="noresult" style="display: none">
                                <div class="py-6 text-center">
                                    <i data-lucide="search" class="w-6 h-6 mx-auto mb-3 text-sky-500 fill-sky-100 dark:fill-sky-500/20"></i>
                                    <h5 class="mt-2 mb-1">Sorry! No Result Found</h5>
                                    <p class="mb-0 text-slate-500 dark:text-zink-200">We've searched more than 199+ product We did not find any product for you search.</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex flex-col items-center gap-4 px-4 mt-4 md:flex-row" id="pagination-element">
                            <div class="grow">
                                <a href="#">작성하기</a>
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
<script>
    document.getElementById("myButton").addEventListener("click", function() {
        this.classList.add("active");
    });
</script>
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

</body>

</html>