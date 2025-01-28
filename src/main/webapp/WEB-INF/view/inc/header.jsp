<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 시큐리티 세션 사용을 위한 taglib -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 시큐리티 세션정보 접근 -->
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="loginEmp"/></sec:authorize>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
</head>
<body>



<div class="layout-width">
            <div class="flex items-center px-4 mx-auto bg-topbar border-b-2 border-topbar group-data-[topbar=dark]:bg-topbar-dark group-data-[topbar=dark]:border-topbar-dark group-data-[topbar=brand]:bg-topbar-brand group-data-[topbar=brand]:border-topbar-brand shadow-md h-header shadow-slate-200/50 group-data-[navbar=bordered]:rounded-md group-data-[navbar=bordered]:group-[.is-sticky]/topbar:rounded-t-none group-data-[topbar=dark]:dark:bg-zink-700 group-data-[topbar=dark]:dark:border-zink-700 dark:shadow-none group-data-[topbar=dark]:group-[.is-sticky]/topbar:dark:shadow-zink-500 group-data-[topbar=dark]:group-[.is-sticky]/topbar:dark:shadow-md group-data-[navbar=bordered]:shadow-none group-data-[layout=horizontal]:group-data-[navbar=bordered]:rounded-b-none group-data-[layout=horizontal]:shadow-none group-data-[layout=horizontal]:dark:group-[.is-sticky]/topbar:shadow-none">
                <div class="flex items-center w-full group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl navbar-header group-data-[layout=horizontal]:ltr:xl:pr-3 group-data-[layout=horizontal]:rtl:xl:pl-3">
                    <!-- LOGO -->
                    <div class="items-center justify-center hidden px-5 text-center h-header group-data-[layout=horizontal]:md:flex group-data-[layout=horizontal]:ltr::pl-0 group-data-[layout=horizontal]:rtl:pr-0">
                        <a href="index.html">
                            <span class="hidden">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEwAAABMCAYAAADHl1ErAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDcuMS1jMDAwIDc5LmRhYmFjYmIsIDIwMjEvMDQvMTQtMDA6Mzk6NDQgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMi41IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGMDk0N0MyMDY4QjcxMUVFOTYxN0Q1OTIxQkQxNzgwRCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGMDk0N0MyMTY4QjcxMUVFOTYxN0Q1OTIxQkQxNzgwRCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkYwOTQ3QzFFNjhCNzExRUU5NjE3RDU5MjFCRDE3ODBEIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkYwOTQ3QzFGNjhCNzExRUU5NjE3RDU5MjFCRDE3ODBEIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+iIlVCAAACB1JREFUeNrsXGts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" alt="" class="h-6 mx-auto">
                            </span>
                            <span class="group-data-[topbar=dark]:hidden group-data-[topbar=brand]:hidden">
                                <img src="${pageContext.request.contextPath}/assets/images/logo-dark.png" alt="" class="h-6 mx-auto">
                            </span>
                        </a>
                        <a href="index.html" class="hidden group-data-[topbar=dark]:block group-data-[topbar=brand]:block">
                            <span class="group-data-[topbar=dark]:hidden group-data-[topbar=brand]:hidden">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEwAAABMCAYAAADHl1ErAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDcuMS1jMDAwIDc5LmRhYmFjYmIsIDIwMjEvMDQvMTQtMDA6Mzk6NDQgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMi41IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGMDk0N0MyMDY4QjcxMUVFOTYxN0Q1OTIxQkQxNzgwRCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGMDk0N0MyMTY4QjcxMUVFOTYxN0Q1OTIxQkQxNzgwRCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkYwOTQ3QzFFNjhCNzExRUU5NjE3RDU5MjFCRDE3ODBEIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkYwOTQ3QzFGNjhCNzExRUU5NjE3RDU5MjFCRDE3ODBEIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+iIlVCAAACB1JREFUeNrsXGts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" alt="" class="h-6 mx-auto">
                            </span>
                            <span class="group-data-[topbar=dark]:block group-data-[topbar=brand]:block">
                                <img src="${pageContext.request.contextPath}/assets/images/logo-light.png" alt="" class="h-6 mx-auto">
                            </span>
                        </a>
                    </div>
    
                    <button type="button" class="inline-flex relative justify-center items-center p-0 text-topbar-item transition-all w-[37.5px] h-[37.5px] duration-75 ease-linear bg-topbar rounded-md btn hover:bg-slate-100 group-data-[topbar=dark]:bg-topbar-dark group-data-[topbar=dark]:border-topbar-dark group-data-[topbar=dark]:text-topbar-item-dark group-data-[topbar=dark]:hover:bg-topbar-item-bg-hover-dark group-data-[topbar=dark]:hover:text-topbar-item-hover-dark group-data-[topbar=brand]:bg-topbar-brand group-data-[topbar=brand]:border-topbar-brand group-data-[topbar=brand]:text-topbar-item-brand group-data-[topbar=brand]:hover:bg-topbar-item-bg-hover-brand group-data-[topbar=brand]:hover:text-topbar-item-hover-brand group-data-[topbar=dark]:dark:bg-zink-700 group-data-[topbar=dark]:dark:text-zink-200 group-data-[topbar=dark]:dark:border-zink-700 group-data-[topbar=dark]:dark:hover:bg-zink-600 group-data-[topbar=dark]:dark:hover:text-zink-50 group-data-[layout=horizontal]:flex group-data-[layout=horizontal]:md:hidden hamburger-icon" id="topnav-hamburger-icon">
                        <i data-lucide="chevrons-left" class="w-5 h-5 group-data-[sidebar-size=sm]:hidden"></i>
                        <i data-lucide="chevrons-right" class="hidden w-5 h-5 group-data-[sidebar-size=sm]:block"></i>
                    </button>
    
                    <div class="flex gap-3 ms-auto">
                    
                    
    					<!-- bell-ring -->
                        <div class="relative flex items-center dropdown h-header">
                            <button type="button" class="inline-flex justify-center relative items-center p-0 text-topbar-item transition-all w-[37.5px] h-[37.5px] duration-200 ease-linear bg-topbar rounded-md dropdown-toggle btn hover:bg-topbar-item-bg-hover hover:text-topbar-item-hover group-data-[topbar=dark]:bg-topbar-dark group-data-[topbar=dark]:hover:bg-topbar-item-bg-hover-dark group-data-[topbar=dark]:hover:text-topbar-item-hover-dark group-data-[topbar=brand]:bg-topbar-brand group-data-[topbar=brand]:hover:bg-topbar-item-bg-hover-brand group-data-[topbar=brand]:hover:text-topbar-item-hover-brand group-data-[topbar=dark]:dark:bg-zink-700 group-data-[topbar=dark]:dark:hover:bg-zink-600 group-data-[topbar=brand]:text-topbar-item-brand group-data-[topbar=dark]:dark:hover:text-zink-50 group-data-[topbar=dark]:dark:text-zink-200 group-data-[topbar=dark]:text-topbar-item-dark" id="notificationDropdown" data-bs-toggle="dropdown">
                                <i data-lucide="bell-ring" class="inline-block w-5 h-5 stroke-1 fill-slate-100 group-data-[topbar=dark]:fill-topbar-item-bg-hover-dark group-data-[topbar=brand]:fill-topbar-item-bg-hover-brand"></i>
                                <span class="absolute top-0 right-0 flex w-1.5 h-1.5">
                                    <span class="absolute inline-flex w-full h-full rounded-full opacity-75 animate-ping bg-sky-400"></span>
                                    <span class="relative inline-flex w-1.5 h-1.5 rounded-full bg-red-500"></span>
                                </span>
                            </button>
                            <div class="absolute z-50 hidden ltr:text-left rtl:text-right bg-white rounded-md shadow-md !top-4 dropdown-menu min-w-[20rem] lg:min-w-[26rem] dark:bg-zink-600" aria-labelledby="notificationDropdown">
                                <div class="p-4">
                                    <h6 class="mb-4 text-16">Notifications <span class="inline-flex items-center justify-center w-5 h-5 ml-1 text-[11px] font-medium border rounded-full text-white bg-orange-500 border-orange-500">15</span></h6>
                                    <ul class="flex flex-wrap w-full p-1 mb-2 text-sm font-medium text-center rounded-md filter-btns text-slate-500 bg-slate-100 nav-tabs dark:bg-zink-500 dark:text-zink-200" data-filter-target="notification-list">
                                        <li class="grow">
                                            <a href="javascript:void(0);" data-filter="all" class="inline-block nav-link px-1.5 w-full py-1 text-xs transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent [&.active]:bg-white [&.active]:text-custom-500 hover:text-custom-500 active:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:[&.active]:bg-zink-600 -mb-[1px] active">View All</a>
                                        </li>
                                        <li class="grow">
                                            <a href="javascript:void(0);" data-filter="mention" class="inline-block nav-link px-1.5 w-full py-1 text-xs transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent [&.active]:bg-white [&.active]:text-custom-500 hover:text-custom-500 active:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:[&.active]:bg-zink-600 -mb-[1px]">Mentions</a>
                                        </li>
                                        <li class="grow">
                                            <a href="javascript:void(0);" data-filter="follower" class="inline-block nav-link px-1.5 w-full py-1 text-xs transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent [&.active]:bg-white [&.active]:text-custom-500 hover:text-custom-500 active:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:[&.active]:bg-zink-600 -mb-[1px]">Followers</a>
                                        </li>
                                        <li class="grow">
                                            <a href="javascript:void(0);" data-filter="invite" class="inline-block nav-link px-1.5 w-full py-1 text-xs transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent [&.active]:bg-white [&.active]:text-custom-500 hover:text-custom-500 active:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:[&.active]:bg-zink-600 -mb-[1px]">Invites</a>
                                        </li>
                                    </ul>
    
                                </div>
                                <div data-simplebar class="max-h-[350px]">
                                    <div class="flex flex-col gap-1" id="notification-list">
                                        <a href="#!" class="flex gap-3 p-4 product-item hover:bg-slate-50 dark:hover:bg-zink-500 follower">
                                            <div class="w-10 h-10 rounded-md shrink-0 bg-slate-100">
                                                <img src="${pageContext.request.contextPath}/assets/images/avatar-3.png" alt="" class="rounded-md">
                                            </div>
                                            <div class="grow">
                                                <h6 class="mb-1 font-medium"><b>@willie_passem</b> followed you</h6>
                                                <p class="mb-0 text-sm text-slate-500 dark:text-zink-300"><i data-lucide="clock" class="inline-block w-3.5 h-3.5 mr-1"></i> <span class="align-middle">Wednesday 03:42 PM</span></p>
                                            </div>
                                            <div class="flex items-center self-start gap-2 text-xs text-slate-500 shrink-0 dark:text-zink-300">
                                                <div class="w-1.5 h-1.5 bg-custom-500 rounded-full"></div> 4 sec
                                            </div>
                                        </a>
                                        <a href="#!" class="flex gap-3 p-4 product-item hover:bg-slate-50 dark:hover:bg-zink-500 mention">
                                            <div class="w-10 h-10 bg-yellow-100 rounded-md shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/images/avatar-5.png" alt="" class="rounded-md">
                                            </div>
                                            <div class="grow">
                                                <h6 class="mb-1 font-medium"><b>@caroline_jessica</b> commented on your post</h6>
                                                <p class="mb-3 text-sm text-slate-500 dark:text-zink-300"><i data-lucide="clock" class="inline-block w-3.5 h-3.5 mr-1"></i> <span class="align-middle">Wednesday 03:42 PM</span></p>
                                                <div class="p-2 rounded bg-slate-100 text-slate-500 dark:bg-zink-500 dark:text-zink-300">Amazing! Fast, to the point, professional and really amazing to work with them!!!</div>
                                            </div>
                                            <div class="flex items-center self-start gap-2 text-xs text-slate-500 shrink-0 dark:text-zink-300">
                                                <div class="w-1.5 h-1.5 bg-custom-500 rounded-full"></div> 15 min
                                            </div>
                                        </a>
                                        <a href="#!" class="flex gap-3 p-4 product-item hover:bg-slate-50 dark:hover:bg-zink-500 invite">
                                            <div class="flex items-center justify-center w-10 h-10 bg-red-100 rounded-md shrink-0">
                                                <i data-lucide="shopping-bag" class="w-5 h-5 text-red-500 fill-red-200"></i>
                                            </div>
                                            <div class="grow">
                                                <h6 class="mb-1 font-medium">Successfully purchased a business plan for <span class="text-red-500">$199.99</span></h6>
                                                <p class="mb-0 text-sm text-slate-500 dark:text-zink-300"><i data-lucide="clock" class="inline-block w-3.5 h-3.5 mr-1"></i> <span class="align-middle">Monday 11:26 AM</span></p>
                                            </div>
                                            <div class="flex items-center self-start gap-2 text-xs text-slate-500 shrink-0 dark:text-zink-300">
                                                <div class="w-1.5 h-1.5 bg-custom-500 rounded-full"></div> Yesterday
                                            </div>
                                        </a>
                                        <a href="#!" class="flex gap-3 p-4 product-item hover:bg-slate-50 dark:hover:bg-zink-500 mention">
                                            <div class="relative shrink-0">
                                                <div class="w-10 h-10 bg-pink-100 rounded-md">
                                                    <img src="${pageContext.request.contextPath}/assets/images/avatar-7.png" alt="" class="rounded-md">
                                                </div>
                                                <div class="absolute text-orange-500 -bottom-0.5 -right-0.5 text-16">
                                                    <i class="ri-heart-fill"></i>
                                                </div>
                                            </div>
                                            <div class="grow">
                                                <h6 class="mb-1 font-medium"><b>@scott</b> liked your post</h6>
                                                <p class="mb-0 text-sm text-slate-500 dark:text-zink-300"><i data-lucide="clock" class="inline-block w-3.5 h-3.5 mr-1"></i> <span class="align-middle">Thursday 06:59 AM</span></p>
                                            </div>
                                            <div class="flex items-center self-start gap-2 text-xs text-slate-500 shrink-0 dark:text-zink-300">
                                                <div class="w-1.5 h-1.5 bg-custom-500 rounded-full"></div> 1 Week
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- message -->
                        <div class="relative flex items-center dropdown h-header">
                            <button type="button" class="inline-flex justify-center relative items-center p-0 text-topbar-item transition-all w-[37.5px] h-[37.5px] duration-200 ease-linear bg-topbar rounded-md dropdown-toggle btn hover:bg-topbar-item-bg-hover hover:text-topbar-item-hover group-data-[topbar=dark]:bg-topbar-dark group-data-[topbar=dark]:hover:bg-topbar-item-bg-hover-dark group-data-[topbar=dark]:hover:text-topbar-item-hover-dark group-data-[topbar=brand]:bg-topbar-brand group-data-[topbar=brand]:hover:bg-topbar-item-bg-hover-brand group-data-[topbar=brand]:hover:text-topbar-item-hover-brand group-data-[topbar=dark]:dark:bg-zink-700 group-data-[topbar=dark]:dark:hover:bg-zink-600 group-data-[topbar=brand]:text-topbar-item-brand group-data-[topbar=dark]:dark:hover:text-zink-50 group-data-[topbar=dark]:dark:text-zink-200 group-data-[topbar=dark]:text-topbar-item-dark" id="notificationDropdown" data-bs-toggle="dropdown">
                                <i data-lucide="mail" class="inline-block w-5 h-5 stroke-1 fill-slate-100 group-data-[topbar=dark]:fill-topbar-item-bg-hover-dark group-data-[topbar=brand]:fill-topbar-item-bg-hover-brand"></i>
                                <span class="absolute top-0 right-0 flex w-1.5 h-1.5">
                                    <span class="absolute inline-flex w-full h-full rounded-full opacity-75 animate-ping bg-sky-400"></span>
                                    <span class="relative inline-flex w-1.5 h-1.5 rounded-full bg-sky-500"></span>
                                </span>
                            </button>
                            <div class="absolute z-50 hidden ltr:text-left rtl:text-right bg-white rounded-md shadow-md !top-4 dropdown-menu min-w-[20rem] lg:min-w-[26rem] dark:bg-zink-600" aria-labelledby="notificationDropdown">
                                <div class="p-4">
                                    <h6 class="mb-4 text-16">Message <span class="inline-flex items-center justify-center w-5 h-5 ml-1 text-[11px] font-medium border rounded-full text-white bg-orange-500 border-orange-500">${loginEmp.notReadYet}</span></h6>
                                    <ul class="flex flex-wrap w-full p-1 mb-2 text-sm font-medium text-center rounded-md filter-btns text-slate-500 bg-slate-100 nav-tabs dark:bg-zink-500 dark:text-zink-200" data-filter-target="notification-list">
                                        <li class="grow">
                                            <a href="${pageContext.request.contextPath}/message/messageList"  data-filter="all" class="inline-block nav-link px-1.5 w-full py-1 text-xs transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent [&.active]:bg-white [&.active]:text-custom-500 hover:text-custom-500 active:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:[&.active]:bg-zink-600 -mb-[1px] active">View All</a>
                                        </li>
                                    </ul>
    
                                </div>
                                <div data-simplebar class="max-h-[350px]">
                                    <div class="flex flex-col gap-1" id="notification-list">
                                    </div>
                                </div>
                            </div>
                        </div>

    					<!-- 개인 정보 -->
                        <div class="relative flex items-center dropdown h-header"">
                            <button type="button" class="inline-block p-0 transition-all duration-200 ease-linear bg-topbar rounded-full text-topbar-item dropdown-toggle btn hover:bg-topbar-item-bg-hover hover:text-topbar-item-hover group-data-[topbar=dark]:text-topbar-item-dark group-data-[topbar=dark]:bg-topbar-dark group-data-[topbar=dark]:hover:bg-topbar-item-bg-hover-dark group-data-[topbar=dark]:hover:text-topbar-item-hover-dark group-data-[topbar=brand]:bg-topbar-brand group-data-[topbar=brand]:hover:bg-topbar-item-bg-hover-brand group-data-[topbar=brand]:hover:text-topbar-item-hover-brand group-data-[topbar=dark]:dark:bg-zink-700 group-data-[topbar=dark]:dark:hover:bg-zink-600 group-data-[topbar=brand]:text-topbar-item-brand group-data-[topbar=dark]:dark:hover:text-zink-50 group-data-[topbar=dark]:dark:text-zink-200" id="dropdownMenuButton" data-bs-toggle="dropdown">
                                <div class="bg-ligth-100 rounded-full">
                                    <img src="${pageContext.request.contextPath}/employeeFile/${loginEmp.empFileName != null ? loginEmp.empFileName : 'placeholder.png'}" alt="" class="w-[37.5px] h-[37.5px] rounded-full">
                                </div>
                            </button>
                            <div class="absolute z-50 hidden p-4 ltr:text-left rtl:text-right bg-white rounded-md shadow-md !top-4 dropdown-menu min-w-[20rem] dark:bg-zink-600" aria-labelledby="dropdownMenuButton">
                                <h6 class="mb-2 text-sm font-normal text-slate-500 dark:text-zink-300">"세상에서 가장 따뜻한 호텔, PETTOPIA"</h6>
                                <a href="${pageContext.request.contextPath }/employee/employeeOne?empNo=${loginEmp.username}" class="flex gap-3 mb-3">
                                    <div class="relative inline-block shrink-0">
                                        <div class="rounded bg-slate-100 dark:bg-zink-500">
                                            <img src="${pageContext.request.contextPath}/employeeFile/${loginEmp.empFileName != null ? loginEmp.empFileName : 'placeholder.png'}" alt="" class="w-20 h-20 rounded">
                                        </div>
                                        
                                    </div>
                                    <div>
                                        <h6 class="mb-1 text-15">${loginEmp.empName } ${loginEmp.rankName } (${loginEmp.isTeamLeader == 'H' ? '팀장' : '팀원'})</h6>
                                        <p class="text-slate-500 dark:text-zink-300"> ${loginEmp.username }</p>
                                        <p class="text-slate-500 dark:text-zink-300">${loginEmp.divisionName} / ${loginEmp.deptName} </p>
                                    </div>
                                </a>
                                <ul>
                                    <li>
                                        <a class="block ltr:pr-4 rtl:pl-4 py-1.5 text-base font-medium transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:text-custom-500 focus:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:focus:text-custom-500" href="${pageContext.request.contextPath }/employee/employeeOne?empNo=${loginEmp.username}"><i data-lucide="user-2" class="inline-block size-4 ltr:mr-2 rtl:ml-2"></i> MyPage</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/message/messageList" class="block ltr:pr-4 rtl:pl-4 py-1.5 text-base font-medium transition-all duration-200 ease-linear text-slate-600 dropdown-item hover:text-custom-500 focus:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:focus:text-custom-500" href="apps-mailbox.html"><i data-lucide="mail" class="inline-block size-4 ltr:mr-2 rtl:ml-2"></i> Message 
                                        	<span class="inline-flex items-center justify-center w-5 h-5 ltr:ml-2 rtl:mr-2 text-[11px] font-medium border rounded-full text-white bg-red-500 border-red-500">${loginEmp.notReadYet}</span>
                                        </a>
                                    </li>
                                    <li class="pt-2 mt-2 border-t border-slate-200 dark:border-zink-500">
                                        <a class="block ltr:pr-4 rtl:pl-4 py-1.5 text-base font-medium transition-all duration-200 ease-linear text-red-600 dropdown-item hover:text-custom-500 focus:text-custom-500 dark:text-zink-200 dark:hover:text-custom-500 dark:focus:text-custom-500" href="${pageContext.request.contextPath }/logout"><i data-lucide="log-out" class="inline-block size-4 ltr:mr-2 rtl:ml-2"></i> Log Out</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>