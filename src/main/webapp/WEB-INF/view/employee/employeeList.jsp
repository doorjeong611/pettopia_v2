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
</head>

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.0.2/list.min.js" integrity="sha512-MT5YyrGWqMGkIbwkVUZEWGrRDjlNx8loukEdFyzLo4s8INKVxnDQy2eFcpmnWGrFwJ+X8mRTQOJpWCayXz7+Og==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<body
	class="text-base bg-body-bg text-body font-public dark:text-zink-100 dark:bg-zink-800 group-data-[skin=bordered]:bg-body-bordered group-data-[skin=bordered]:dark:bg-zink-700">
	<div
		class="group-data-[sidebar-size=sm]:min-h-sm group-data-[sidebar-size=sm]:relative">

		<!-- Left Sidebar Start -->
		<div
			class="app-menu w-vertical-menu bg-vertical-menu ltr:border-r rtl:border-l border-vertical-menu-border fixed bottom-0 top-0 z-[1003] transition-all duration-75 ease-linear group-data-[sidebar-size=md]:w-vertical-menu-md group-data-[sidebar-size=sm]:w-vertical-menu-sm group-data-[sidebar-size=sm]:pt-header group-data-[sidebar=dark]:bg-vertical-menu-dark group-data-[sidebar=dark]:border-vertical-menu-dark group-data-[sidebar=brand]:bg-vertical-menu-brand group-data-[sidebar=brand]:border-vertical-menu-brand group-data-[sidebar=modern]:bg-gradient-to-tr group-data-[sidebar=modern]:to-vertical-menu-to-modern group-data-[sidebar=modern]:from-vertical-menu-form-modern group-data-[layout=horizontal]:w-full group-data-[layout=horizontal]:bottom-auto group-data-[layout=horizontal]:top-header hidden md:block print:hidden group-data-[sidebar-size=sm]:absolute group-data-[sidebar=modern]:border-vertical-menu-border-modern group-data-[layout=horizontal]:dark:bg-zink-700 group-data-[layout=horizontal]:border-t group-data-[layout=horizontal]:dark:border-zink-500 group-data-[layout=horizontal]:border-r-0 group-data-[sidebar=dark]:dark:bg-zink-700 group-data-[sidebar=dark]:dark:border-zink-600 group-data-[layout=horizontal]:group-data-[navbar=scroll]:absolute group-data-[layout=horizontal]:group-data-[navbar=bordered]:top-[calc(theme('spacing.header')_+_theme('spacing.4'))] group-data-[layout=horizontal]:group-data-[navbar=bordered]:inset-x-4 group-data-[layout=horizontal]:group-data-[navbar=hidden]:top-0 group-data-[layout=horizontal]:group-data-[navbar=hidden]:h-16 group-data-[layout=horizontal]:group-data-[navbar=bordered]:w-[calc(100%_-_2rem)] group-data-[layout=horizontal]:group-data-[navbar=bordered]:[&.sticky]:top-header group-data-[layout=horizontal]:group-data-[navbar=bordered]:rounded-b-md group-data-[layout=horizontal]:shadow-md group-data-[layout=horizontal]:shadow-slate-500/10 group-data-[layout=horizontal]:dark:shadow-zink-500/10 group-data-[layout=horizontal]:opacity-0">
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
							<h5 class="text-16">직원 목록</h5>
						</div>
						<ul class="flex items-center gap-2 text-sm font-normal shrink-0">
							<li
								class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
								<a href="#!" class="text-slate-400 dark:text-zink-200">직원 목록</a>
							</li>
							<!-- <li class="text-slate-700 dark:text-zink-100">템플릿</li> -->
						</ul>
					</div>
					<!-- Main content -->
			<div class="card" id="employeeTable">
                <div class="card-body">
                    <div class="flex items-center gap-3 mb-4">
                        <h6 class="text-15 grow">펫토피아 직원 (<b class="total-Employs">12</b>)</h6>
                        <!-- 카테고리 선택 + 검색 -->
                         <form action="${pageContext.request.contextPath}/employee/employeeList" method="get" id="searchCategoryForm">
							<select name="divisionCode" id="division">
								<option value="">전체</option>
								<c:forEach var="dvs" items="${noticeList.divisionList}" >
									<option value="${dvs.divisionCode }" ${dvs.divisionCode == CurrentdivisionCode ? 'selected' : ''}>${dvs.divisionName }</option>
								</c:forEach>
							</select>
                                  	
                          	<input type="text" name="searchTitle" class="ltr:pl-8 rtl:pr-8 search form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="Search for ..." autocomplete="off">
                          	<!-- <i data-lucide="search" class="inline-block size-4 absolute ltr:left-2.5 rtl:right-2.5 top-2.5 text-slate-500 dark:text-zink-200 fill-slate-100 dark:fill-zink-600"></i>  -->
                  			<button type="submit" class="text-slate-500 btn bg-slate-200 border-slate-200 hover:text-slate-600 hover:bg-slate-300 hover:border-slate-300 focus:text-slate-600 focus:bg-slate-300 focus:border-slate-300 focus:ring focus:ring-slate-100 active:text-slate-600 active:bg-slate-300 active:border-slate-300 active:ring active:ring-slate-100 dark:bg-zink-600 dark:hover:bg-zink-500 dark:border-zink-600 dark:hover:border-zink-500 dark:text-zink-200 dark:ring-zink-400/50">검색</button>
                  		 </form>
                    </div>

                    <div class="-mx-5 overflow-x-auto">
                        <table class="w-full whitespace-nowrap">
                            <thead class="ltr:text-left rtl:text-right">
                                <tr class="bg-slate-100 dark:bg-zink-600">
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 ID">사원 번호</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Name">이름</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Role">이메일</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Email">재직 상태</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Phone">소속 부서</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Country">직급</th>
                                    <th class="px-3.5 py-2.5 first:pl-5 last:pr-5 font-semibold border-b border-slate-200 dark:border-zink-500 Country">입사일</th>
                             
                                </tr>
                            </thead>
                            <tbody class="list" id="employeeList">
                            	<!--  -->
                   				<c:forEach var="emp" items="${empList}">
											<tr>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 ID">
													<a href="#!" class="transition-all duration-150 ease-linear text-custom-500 hover:text-custom-600">
														${emp.empNo }
													</a>
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Name">
													<a href="#!" class="flex items-center gap-3">
														<div div=""class="w-6 h-6 rounded-full shrink-0 bg-slate-100 dark:bg-zink-600">
															<img src="./employeeFile/${emp.fileName }" alt="" class="h-6 rounded-full">
														</div>
														<h6 class="grow">${emp.empName } </h6>
													</a>
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Role">
													${emp.empEmail }
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Email">
													<c:if test="${emp.empStatus == 'E'}">
														<span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded border bg-green-100 border-transparent text-green-500 dark:bg-green-500/20 dark:border-transparent text-uppercase">
															재직
														</span>
													</c:if>
													<c:if test="${emp.empStatus == 'T'}">
														<span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded border bg-sky-100 border-transparent text-sky-500 dark:bg-sky-500/20 dark:border-transparent">
															임시
														</span>
													</c:if>
													<c:if test="${emp.empStatus == 'L'}">
														<span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded border bg-yellow-100 border-transparent text-yellow-500 dark:bg-yellow-500/20 dark:border-transparent">
															휴직
														</span>
													</c:if>
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Phone">
													<span class="font-semibold">${emp.divisionName }</span>
													<br>
													${emp.deptName }
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Country">
													${emp.rankName }
												</td>
												<td class="px-3.5 py-2.5 first:pl-5 last:pr-5 border-y border-slate-200 dark:border-zink-500 Country">
													${emp.hireDate }
												</td>
										
											</tr>
										</c:forEach>
                            	
                            	
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- 페이지네이션 -->
                    <div class="flex flex-col items-center gap-4 px-4 mt-4 md:flex-row" id="pagination-element">
                        <div class="grow">
                            <p class="text-slate-500 dark:text-zink-200">Showing <b class="showing">7</b> of <b class="total-records">12</b> Results</p>
                        </div>

                        <div class="col-sm-auto mt-sm-0">
                            <div class="flex gap-2 pagination-wrap justify-content-center">
                                <a class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-500 dark:[&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 dark:[&amp;.active]:bg-custom-500/10 [&amp;.active]:border-custom-50 dark:[&amp;.active]:border-custom-500/10 [&amp;.active]:hover:text-custom-700 dark:[&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto page-item pagination-prev disabled" href="javascript:void(0)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-left" class="lucide lucide-chevron-left mr-1 size-4 rtl:rotate-180"><path d="m15 18-6-6 6-6"></path></svg> Prev
                                </a>
                                <ul class="flex flex-wrap items-center gap-2 pagination listjs-pagination"><li class="active"><a class="page" href="#" data-i="1" data-page="7">1</a></li><li><a class="page" href="#" data-i="2" data-page="7">2</a></li></ul>
                                <a class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-50 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&amp;.active]:text-custom-500 dark:[&amp;.active]:text-custom-500 [&amp;.active]:bg-custom-50 dark:[&amp;.active]:bg-custom-500/10 [&amp;.active]:border-custom-50 dark:[&amp;.active]:border-custom-500/10 [&amp;.active]:hover:text-custom-700 dark:[&amp;.active]:hover:text-custom-700 [&amp;.disabled]:text-slate-400 dark:[&amp;.disabled]:text-zink-300 [&amp;.disabled]:cursor-auto page-item pagination-next" href="javascript:void(0)">
                                    Next <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="chevron-right" class="lucide lucide-chevron-right ml-1 size-4 rtl:rotate-180"><path d="m9 18 6-6-6-6"></path></svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
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
			<%-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script> --%>

			<!--dashboard ecommerce init js-->
			<%-- <script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script> --%>

			<!-- App js -->
			<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

			<!-- list js-->
			<script src="/pettopia/assets/libs/list.js/list.min.js"></script>
			<script src="/pettopia/assets/libs/list.pagination.js/list.pagination.min.js"></script>
			<script src="/pettopia/assets/js/pages/apps-hr-employee.init.js"></script> 
</body>
<script type="text/javascript">


</script>




</html>