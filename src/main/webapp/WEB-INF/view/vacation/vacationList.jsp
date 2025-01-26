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
                        <h5 class="text-16">휴가</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">휴가</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            템플릿
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="grid grid-cols-1 gap-x-5 md:grid-cols-2 xl:grid-cols-12">
				<div class="col-span-12 md:order-3 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12">
                                <div class="col-span-8 md:col-span-9">
                                    <p class="text-slate-500 dark:text-slate-200">총 연차휴가</p>
                                    <h5 class="mt-3 mb-4"><span class="counter-value" data-target="15">15</span></h5>
                                </div>
                                <div class="col-span-4 md:col-span-3">
                                    <div id="totalEmployee" data-chart-colors="[&quot;bg-custom-500&quot;]" dir="ltr" class="grow apex-charts" style="min-height: 77px;"><div id="apexchartsol485m6rl" class="apexcharts-canvas apexchartsol485m6rl apexcharts-theme-light" style="width: 74px; height: 77px;"><svg id="SvgjsSvg1001" width="74" height="77" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="74" height="77"><div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml"></div></foreignObject><g id="SvgjsG1003" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 1)"><defs id="SvgjsDefs1002"><clipPath id="gridRectMaskol485m6rl"><rect id="SvgjsRect1004" width="80" height="114" x="-3" y="-3" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskol485m6rl"></clipPath><clipPath id="nonForecastMaskol485m6rl"></clipPath><clipPath id="gridRectMarkerMaskol485m6rl"><rect id="SvgjsRect1005" width="78" height="112" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1006" class="apexcharts-radialbar"><g id="SvgjsG1007"><g id="SvgjsG1008" class="apexcharts-tracks"><g id="SvgjsG1009" class="apexcharts-radialbar-track apexcharts-track" rel="1"><path id="apexcharts-radialbarTrack-0" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 " fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="6.8136585365853675" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 "></path></g></g><g id="SvgjsG1011"><g id="SvgjsG1013" class="apexcharts-series apexcharts-radial-series" seriesName="TotalxEmployee" rel="1" data:realIndex="0"><path id="SvgjsPath1014" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 0 1 50.84879399303729 17.938770327653675 " fill="none" fill-opacity="0.85" stroke="rgba(59,130,246,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="7.02439024390244" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-0" data:angle="36" data:value="10" index="0" j="0" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 0 1 50.84879399303729 17.938770327653675 "></path></g><circle id="SvgjsCircle1012" r="20.154146341463417" cx="37" cy="37" class="apexcharts-radialbar-hollow" fill="transparent"></circle></g></g></g><line id="SvgjsLine1016" x1="0" y1="0" x2="74" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g></svg></div></div>
                                </div>
                            </div>
                            <div class="flex items-center gap-3 mt-3">
                                <p class="text-slate-500 dark:text-slate-200 grow"><span class="font-medium text-green-500"></span></p>
                                <p class="text-slate-500 dark:text-slate-200"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-12 md:order-5 2xl:order-6 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12">
                                <div class="col-span-8 md:col-span-9">
                                    <p class="text-slate-500 dark:text-slate-200">사용연차</p>
                                    <h5 class="mt-3 mb-4"><span class="counter-value" data-target="10">10</span></h5>
                                </div>
                                <div class="col-span-4 md:col-span-3">
                                    <div id="hiredCandidates" data-chart-colors="[&quot;bg-green-500&quot;]" dir="ltr" class="grow apex-charts" style="min-height: 77px;"><div id="apexchartsr12c7dzs" class="apexcharts-canvas apexchartsr12c7dzs apexcharts-theme-light" style="width: 74px; height: 77px;"><svg id="SvgjsSvg1033" width="74" height="77" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="74" height="77"><div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml"></div></foreignObject><g id="SvgjsG1035" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 1)"><defs id="SvgjsDefs1034"><clipPath id="gridRectMaskr12c7dzs"><rect id="SvgjsRect1036" width="80" height="114" x="-3" y="-3" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskr12c7dzs"></clipPath><clipPath id="nonForecastMaskr12c7dzs"></clipPath><clipPath id="gridRectMarkerMaskr12c7dzs"><rect id="SvgjsRect1037" width="78" height="112" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1038" class="apexcharts-radialbar"><g id="SvgjsG1039"><g id="SvgjsG1040" class="apexcharts-tracks"><g id="SvgjsG1041" class="apexcharts-radialbar-track apexcharts-track" rel="1"><path id="apexcharts-radialbarTrack-0" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 " fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="6.8136585365853675" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 "></path></g></g><g id="SvgjsG1043"><g id="SvgjsG1045" class="apexcharts-series apexcharts-radial-series" seriesName="TotalxEmployee" rel="1" data:realIndex="0"><path id="SvgjsPath1046" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 0 1 60.5609756097561 37 " fill="none" fill-opacity="0.85" stroke="rgba(36,151,130,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="7.02439024390244" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-0" data:angle="90" data:value="25" index="0" j="0" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 0 1 60.5609756097561 37 "></path></g><circle id="SvgjsCircle1044" r="20.154146341463417" cx="37" cy="37" class="apexcharts-radialbar-hollow" fill="transparent"></circle></g></g></g><line id="SvgjsLine1048" x1="0" y1="0" x2="74" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g></svg></div></div>
                                </div>
                            </div>
                            <div class="flex items-center gap-3 mt-3">
                                <p class="text-slate-500 dark:text-slate-200 grow"><span class="font-medium text-red-500"></span></p>
                                <p class="text-slate-500 dark:text-slate-200"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-12 md:order-6 2xl:order-7 lg:col-span-6 2xl:col-span-3 card">
                        <div class="card-body">
                            <div class="grid grid-cols-12">
                                <div class="col-span-8 md:col-span-9">
                                    <p class="text-slate-500 dark:text-slate-200">잔여연차</p>
                                    <h5 class="mt-3 mb-4"><span class="counter-value" data-target="5">5</span></h5>
                                </div>
                                <div class="col-span-4 md:col-span-3">
                                    <div id="rejectedCandidates" data-chart-colors="[&quot;bg-red-500&quot;]" dir="ltr" class="grow apex-charts" style="min-height: 77px;"><div id="apexchartscu3f4wtm" class="apexcharts-canvas apexchartscu3f4wtm apexcharts-theme-light" style="width: 74px; height: 77px;"><svg id="SvgjsSvg1049" width="74" height="77" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="74" height="77"><div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml"></div></foreignObject><g id="SvgjsG1051" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 1)"><defs id="SvgjsDefs1050"><clipPath id="gridRectMaskcu3f4wtm"><rect id="SvgjsRect1052" width="80" height="114" x="-3" y="-3" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskcu3f4wtm"></clipPath><clipPath id="nonForecastMaskcu3f4wtm"></clipPath><clipPath id="gridRectMarkerMaskcu3f4wtm"><rect id="SvgjsRect1053" width="78" height="112" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1054" class="apexcharts-radialbar"><g id="SvgjsG1055"><g id="SvgjsG1056" class="apexcharts-tracks"><g id="SvgjsG1057" class="apexcharts-radialbar-track apexcharts-track" rel="1"><path id="apexcharts-radialbarTrack-0" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 " fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="6.8136585365853675" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 36.99588783402715 13.439024749098078 "></path></g></g><g id="SvgjsG1059"><g id="SvgjsG1061" class="apexcharts-series apexcharts-radial-series" seriesName="TotalxEmployee" rel="1" data:realIndex="0"><path id="SvgjsPath1062" d="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 13.439024390243901 37 " fill="none" fill-opacity="0.85" stroke="rgba(239,68,68,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="7.02439024390244" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-0" data:angle="270" data:value="75" index="0" j="0" data:pathOrig="M 37 13.439024390243901 A 23.5609756097561 23.5609756097561 0 1 1 13.439024390243901 37 "></path></g><circle id="SvgjsCircle1060" r="20.154146341463417" cx="37" cy="37" class="apexcharts-radialbar-hollow" fill="transparent"></circle></g></g></g><line id="SvgjsLine1064" x1="0" y1="0" x2="74" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g></svg></div></div>
                                </div>
                            </div>
                            <div class="flex items-center gap-3 mt-3">
                                <p class="text-slate-500 dark:text-slate-200 grow"><span class="font-medium text-red-500"></span></p>
                                <p class="text-slate-500 dark:text-slate-200"></p>
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

</body>

</html>