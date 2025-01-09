<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>
	<meta charset="utf-8">
    <title>Room List</title>
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
                        <h5 class="text-16">객실 목록</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">객실 목록</a>
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                  <div class="2xl:col-span-9">
                     <div class="flex flex-wrap items-center gap-2">
                         <div class="flex gap-2 shrink-0 items-cente">
                             <button type="button" id="listView" class="flex items-center justify-center w-[37.5px] h-[37.5px] p-0 text-sky-500 btn bg-sky-100 hover:text-white hover:bg-sky-600 focus:text-white focus:bg-sky-600 [&.active]:text-white [&.active]:bg-sky-600 dark:bg-sky-500/20 dark:text-sky-400 dark:hover:bg-sky-500 dark:hover:text-white dark:focus:bg-sky-500 dark:focus:text-white dark:[&.active]:bg-sky-500 dark:[&.active]:text-white dark:ring-sky-400/20 active">
                                 <i data-lucide="list" class="size-4"></i>
                             </button>
                         </div>
                     </div>
	                   <div class="grid grid-cols-1 mt-5 md:grid-cols-2 [&.gridView]:grid-cols-1 xl:grid-cols-4 group [&.gridView]:xl:grid-cols-1 gap-x-5" id="cardGridView">
	                       <div class="card md:group-[.gridView]:flex relative">
	                           <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
	                               <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6 active">
	                                   <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
	                               </a>
	                               <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
	                                   <img src="./assets/images/img-02.png" alt="" class="group-[.gridView]:h-16">
	                               </div>
	                           </div>
	                           <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
	                               <div class="group-[.gridView]:grow">
	                                   <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
	                                       <a href="apps-ecommerce-product-overview.html">Mesh Ergonomic Black Chair</a>
	                                   </h6>
	                                   <div class="flex items-center text-slate-500 dark:text-zink-200">
	                                       <div class="mr-1 text-yellow-500 shrink-0 text-15">
	                                           <i class="ri-star-fill"></i>
	                                           <i class="ri-star-fill"></i>
	                                           <i class="ri-star-fill"></i>
	                                           <i class="ri-star-fill"></i>
	                                           <i class="ri-star-half-line"></i>
	                                       </div>
	                                       (198)
	                           
	                                   </div>
	                                   <h5 class="mt-4 text-16">
	                                       $674.12 <small class="font-normal line-through text-slate-500 dark:text-zink-200">784.99</small>
	                                   </h5>
	                               </div>
	                               <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
	                                   <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
	                                       <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
	                                       <span class="align-middle">Add to Cart</span>
	                                   </button>
	                                   <div class="relative float-right dropdown">
	                                       <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList1" data-bs-toggle="dropdown">
	                                           <i data-lucide="more-horizontal" class="w-3 h-3"></i>
	                                       </button>
	                                       <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList1">
	                                           <li>
	                                               <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
	                                                   <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
	                                                   <span class="align-middle">Overview</span>
	                                               </a>
	                                           </li>
	                                           <li>
	                                               <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
	                                                   <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
	                                                   <span class="align-middle">Edit</span>
	                                               </a>
	                                           </li>
	                                           <li>
	                                               <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
	                                                   <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
	                                                   <span class="align-middle">Delete</span>
	                                               </a>
	                                           </li>
	                                       </ul>
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-03.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Fastcolors Typography Men</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                    </div>
                                                    (1,150)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">
                                                    $341.99 <small class="font-normal line-through text-slate-500 dark:text-zink-200">784.99</small>
                                                </h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList2" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList2">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-04.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Mesh Ergonomic Green Chair</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                        <i class="ri-star-line"></i>
                                                    </div>
                                                    (29)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">
                                                    $362.21 <small class="font-normal line-through text-slate-500 dark:text-zink-200">599.99</small>
                                                </h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList3" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList3">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6 active">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-05.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Techel Black Bluetooth Soundbar</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                    </div>
                                                    (1,324)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">
                                                    $249.99 <small class="font-normal line-through text-slate-500 dark:text-zink-200">399.99</small>
                                                </h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList4" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList4">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-06.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Bovet Fleurier AIFSQ029</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                    </div>
                                                    (2,195)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">$496.16</h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList5" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList5">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6 active">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-08.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Roar Twill Blue Baseball Cap</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                        <i class="ri-star-line"></i>
                                                        <i class="ri-star-line"></i>
                                                    </div>
                                                    (485)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">
                                                    $674.12 <small class="font-normal line-through text-slate-500 dark:text-zink-200">784.99</small>
                                                </h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList6" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList6">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-012.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Smartest Printed T-shirt</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                        <i class="ri-star-line"></i>
                                                    </div>
                                                    (5,321)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">$89.99</h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList7" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList7">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                    <div class="card md:group-[.gridView]:flex relative">
                                        <div class="relative group-[.gridView]:static p-8 group-[.gridView]:p-5">
                                            <a href="#!" class="absolute group/item toggle-button top-6 ltr:right-6 rtl:left-6 active">
                                                <i data-lucide="heart" class="size-5 text-slate-400 fill-slate-200 transition-all duration-150 ease-linear dark:text-zink-200 dark:fill-zink-600 group-[.active]/item:text-red-500 dark:group-[.active]/item:text-red-500 group-[.active]/item:fill-red-200 dark:group-[.active]/item:fill-red-500/20 group-hover/item:text-red-500 dark:group-hover/item:text-red-500 group-hover/item:fill-red-200 dark:group-hover/item:fill-red-500/20"></i>
                                            </a>
                                            <div class="group-[.gridView]:p-3 group-[.gridView]:bg-slate-100 dark:group-[.gridView]:bg-zink-600 group-[.gridView]:inline-block rounded-md">
                                                <img src="./assets/images/img-10.png" alt="" class="group-[.gridView]:h-16">
                                            </div>
                                        </div>
                                        <div class="card-body !pt-0 md:group-[.gridView]:flex group-[.gridView]:!p-5 group-[.gridView]:gap-3 group-[.gridView]:grow">
                                            <div class="group-[.gridView]:grow">
                                                <h6 class="mb-1 truncate transition-all duration-200 ease-linear text-15 hover:text-custom-500">
                                                    <a href="apps-ecommerce-product-overview.html">Crop tops for Women western wear</a>
                                                </h6>
                                                <div class="flex items-center text-slate-500 dark:text-zink-200">
                                                    <div class="mr-1 text-yellow-500 shrink-0 text-15">
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-fill"></i>
                                                        <i class="ri-star-half-line"></i>
                                                    </div>
                                                    (1551)
                                        
                                                </div>
                                                <h5 class="mt-4 text-16">
                                                    $145 <small class="font-normal line-through text-slate-500 dark:text-zink-200">299.99</small>
                                                </h5>
                                            </div>
                                            <div class="flex items-center gap-2 mt-4 group-[.gridView]:mt-0 group-[.gridView]:self-end">
                                                <button type="button" class="w-full bg-white border-dashed text-slate-500 btn border-slate-500 hover:text-slate-500 hover:bg-slate-50 hover:border-slate-600 focus:text-slate-600 focus:bg-slate-50 focus:border-slate-600 active:text-slate-600 active:bg-slate-50 active:border-slate-600 dark:bg-zink-700 dark:text-zink-200 dark:border-zink-400 dark:ring-zink-400/20 dark:hover:bg-zink-600 dark:hover:text-zink-100 dark:focus:bg-zink-600 dark:focus:text-zink-100 dark:active:bg-zink-600 dark:active:text-zink-100">
                                                    <i data-lucide="shopping-cart" class="inline-block w-3 h-3 leading-none"></i>
                                                    <span class="align-middle">Add to Cart</span>
                                                </button>
                                                <div class="relative float-right dropdown">
                                                    <button class="flex items-center justify-center w-[38.39px] h-[38.39px] dropdown-toggle p-0 text-slate-500 btn bg-slate-100 hover:text-white hover:bg-slate-600 focus:text-white focus:bg-slate-600 focus:ring focus:ring-slate-100 active:text-white active:bg-slate-600 active:ring active:ring-slate-100 dark:bg-slate-500/20 dark:text-slate-400 dark:hover:bg-slate-500 dark:hover:text-white dark:focus:bg-slate-500 dark:focus:text-white dark:active:bg-slate-500 dark:active:text-white dark:ring-slate-400/20" id="productList8" data-bs-toggle="dropdown">
                                                        <i data-lucide="more-horizontal" class="w-3 h-3"></i>
                                                    </button>
                                                    <ul class="absolute z-50 hidden py-2 mt-1 ltr:text-left rtl:text-right list-none bg-white rounded-md shadow-md dropdown-menu min-w-[10rem] dark:bg-zink-600" aria-labelledby="productList8">
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-overview.html">
                                                                <i data-lucide="eye" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Overview</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="apps-ecommerce-product-create.html">
                                                                <i data-lucide="file-edit" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Edit</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-modal-target="deleteModal" class="block px-4 py-1.5 text-base transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:bg-slate-100 hover:text-slate-500 focus:bg-slate-100 focus:text-slate-500 dark:text-zink-100 dark:hover:bg-zink-500 dark:hover:text-zink-200 dark:focus:bg-zink-500 dark:focus:text-zink-200" href="#!">
                                                                <i data-lucide="trash-2" class="inline-block w-3 h-3 ltr:mr-1 rtl:ml-1"></i>
                                                                <span class="align-middle">Delete</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col & card-->
                                </div>
                                <!--end grid-->
                                <div class="flex flex-col items-center mb-5 md:flex-row">
                                    <div class="mb-4 grow md:mb-0">
                                        <p class="text-slate-500 dark:text-zink-200">
                                            Showing <b>12</b>
                                            of <b>44</b>
                                            Results
                                        </p>
                                    </div>
                                    <ul class="flex flex-wrap items-center gap-2 shrink-0">
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">
                                                <i class="mr-1 size-4 rtl:rotate-180" data-lucide="chevron-left"></i>
                                                Prev
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 w-8 h-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">1</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 w-8 h-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto active">2</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 w-8 h-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">3</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 w-8 h-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">4</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 w-8 h-8 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">5</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="inline-flex items-center justify-center bg-white dark:bg-zink-700 h-8 px-3 transition-all duration-150 ease-linear border rounded border-slate-200 dark:border-zink-500 text-slate-500 dark:text-zink-200 hover:text-custom-500 dark:hover:text-custom-500 hover:bg-custom-100 dark:hover:bg-custom-500/10 focus:bg-custom-50 dark:focus:bg-custom-500/10 focus:text-custom-500 dark:focus:text-custom-500 [&.active]:text-white dark:[&.active]:text-white [&.active]:bg-custom-500 dark:[&.active]:bg-custom-500 [&.active]:border-custom-500 dark:[&.active]:border-custom-500 [&.active]:hover:text-custom-700 dark:[&.active]:hover:text-custom-700 [&.disabled]:text-slate-400 dark:[&.disabled]:text-zink-300 [&.disabled]:cursor-auto">
                                                Next <i class="ml-1 size-4 rtl:rotate-180" data-lucide="chevron-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
        	</div>
        </div>
        <!-- End Page-content -->
        
        <!-- pagination -->
        <div class="self-center col-span-12 lg:place-self-end lg:col-span-6"><div class="dataTables_paginate paging_simple_numbers" id="basic_tables_paginate"><div class="text-center dark:text-slate-100"><a aria-controls="basic_tables" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-300 dark:text-slate-300 rounded-l-lg" id="basic_tables_previous">Previous</a><a href="#" aria-controls="basic_tables" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 font-semibold bg-slate-100 dark:bg-zink-600 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">1</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="1" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">2</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="2" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">3</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="3" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">4</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="4" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">5</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="5" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40">6</a><a href="#" aria-controls="basic_tables" role="link" data-dt-idx="next" tabindex="0" class="relative inline-flex justify-center items-center space-x-2 border px-4 py-2 -mr-px leading-6 hover:z-10 focus:z-10 active:z-10 border-slate-200 active:border-slate-200 active:shadow-none dark:border-zink-500 dark:active:border-zink-400 bg-white dark:bg-zink-700 text-slate-800 hover:text-slate-900 hover:border-slate-200 hover:shadow-sm focus:ring focus:ring-slate-300 focus:ring-opacity-25 dark:text-slate-100 dark:hover:border-zink-500 dark:hover:text-zink-50 dark:focus:ring-zink-500 dark:focus:ring-opacity-40 rounded-r-lg" id="basic_tables_next">Next</a></div></div></div>

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
<!--product Grid init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/apps-ecommerce-product-grid.init.js"></script>
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>

</html>