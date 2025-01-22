<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                        <h5 class="text-16">사직서</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="${pageContext.request.contextPath}/document/documentList" class="text-slate-400">결재 문서</a>
                        </li>
                        <li class="text-slate-700">
                            문서 상세보기
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                
                <div class="card">
				    <div class="card-body flex justify-center items-center h-full flex-col">
					    <div class="p-5 border" id="draftOne" style="width: 1000px; margin: 20px; border:2px solid black;">
					        <!-- 내용 -->
					        <div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					        
					        <table style="border: 0px solid rgb(0, 0, 0); width: 100%; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- Header --> 
						    	<colgroup> 
						    		<col width="310"> 
						    		<col width="490"> 
						   		</colgroup>
						   		
						   		<tbody>
									<tr>
										<td style="padding: 20px; padding-bottom:60px; padding-top:55px; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											사&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;서
										</td>
									</tr>
									<tr>
										<td style="background: white; padding: 0px; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
											<table style="border: 1px solid rgb(0, 0, 0); font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse; width: 250px;"><!-- User --> 
										    	<colgroup> 
										        	<col width="90"> 
										       		<col width="70"> 
										       </colgroup> 
				      
											   <tbody>
											   		<tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               문서번호 
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">No.${documentOne.docNo}</span>
													   </td>
												    </tr>
												   <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               유&nbsp;&nbsp;&nbsp;형
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">
													           <c:if test="${documentOne.docType == 'D'}">
															       기안 문서
														       </c:if>
															   <c:if test="${documentOne.docType == 'V'}">
															       연차 신청서
														       </c:if>
														       <c:if test="${documentOne.docType == 'M'}">
															       비품 신청서
														       </c:if>
														       <c:if test="${documentOne.docType == 'R'}">
															       사직서
														       </c:if>
													       </span>
													   </td>
												    </tr>
												    <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               부&nbsp;&nbsp;&nbsp;서 
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">${documentOne.docWriterDept}</span>
													   </td>
												    </tr>
												    <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               사&nbsp;&nbsp;&nbsp;번
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">${documentOne.docWriterNo}</span>
													   </td>
												    </tr>
												    <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               기안자 
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">${documentOne.docWriterName}</span>
													   </td>
												    </tr>
												    <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               작성일 
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">${fn:substring(documentOne.createDatetime, 0, 10)}</span>
													   </td>
												    </tr>
												    <tr>
												       <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											               결재상태 
													   </td>
													   <td style="padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 170px;">
													       <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">
													           <c:if test="${documentOne.approvalStatus == 'P'}">
															       대기
															   </c:if>
															   <c:if test="${documentOne.approvalStatus == 'A'}">
															       승인
															   </c:if>
															   <c:if test="${documentOne.approvalStatus == 'R'}">
															       반려
															   </c:if>
															   <c:if test="${documentOne.approvalStatus == 'T'}">
															       임시
															   </c:if>
													       </span>
													   </td>
												    </tr>
												</tbody>
											</table> 
										</td>
										<td style="background: white; padding: 0px; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
											[결재선]
											<table style="border: 1px solid rgb(0, 0, 0); width: 100%; margin-top: 10px; font-family: malgun gothic, dotum, arial, tahoma; border-collapse: collapse; table-layout: fixed; height: 120px;">
											    <tbody>
											        <tr style="height: 10px;">
											            <td rowspan="3" style="background: rgb(221, 221, 221); width: 5%; text-align: center; padding: 5px; border: 1px solid black; writing-mode: vertical-rl;">발&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">작성자</td>
											            <td rowspan="3" style="background: rgb(221, 221, 221); width: 5%; text-align: center; padding: 5px; border: 1px solid black; writing-mode: vertical-rl;">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">최초 결재자</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">중간 결재자</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">최종 결재자</td>
											        </tr>
											        <tr style="height: 100px;">
											        	<!-- 작성자 -->
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${not empty writerSignFile}">
															    <div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${writerSignFile.fileName}${writerSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
															</c:if>
															<c:if test="${empty writerSignFile}">
																${documentOne.docWriterName}
															</c:if>
														</td>
														
														<!-- 최초 결재자 -->
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${empty documentOne.initApprovalStatus || empty initSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
											    					${documentOne.initApproverName}       		
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'A' && not empty initSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${initSignFile.fileName}${initSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'R' && not empty initSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${initSignFile.fileName}${initSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            </td>
											            
											            <!-- 중간 결재자 -->
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${empty documentOne.midApprovalStatus || empty midSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
											    					${documentOne.midApproverName}       		
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.midApprovalStatus == 'A' && not empty midSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${midSignFile.fileName}${midSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.midApprovalStatus == 'R' && not empty midSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${midSignFile.fileName}${midSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            </td>
											            
											            <!-- 최종 결재자 -->
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${empty documentOne.finalApprovalStatus || empty finalSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
											    					${documentOne.finalApproverName}       		
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.finalApprovalStatus == 'A' && not empty finalSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${finalSignFile.fileName}${finalSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            	<c:if test="${documentOne.finalApprovalStatus == 'R' && not empty finalSignFile}">
											            		<div style="display: flex; justify-content: center; align-items: center;">
															        <img src="${pageContext.request.contextPath}/employeeFile/${finalSignFile.fileName}${finalSignFile.fileExt}" 
															             style="max-width: 65%; max-height: 65%; width: auto; height: auto; object-fit: contain;">
															    </div>
											            	</c:if>
											            </td>
											        </tr>
											        <tr style="height: 10px;">
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<span class="text-custom-600 font-bold">작성 ${fn:substring(documentOne.createDatetime, 0, 10)}</span>
											            </td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${empty documentOne.initApprovalStatus && documentOne.initApproverNo == empNo && documentOne.approvalStatus != 'T'}">
											            		<a href="${pageContext.request.contextPath}/document/approveDocument?docApproversNo=${documentOne.docApproversNo}&initApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}" id="initApproveBtn" class="approveBtn px-2 py-0 font-bold text-xs text-green-500 bg-white btn hover:text-green-500 hover:bg-text-green-500 focus:text-green-500 active:text-green-500">승인</a>
											            		<span>/</span>
											            		<a href="${pageContext.request.contextPath}/document/rejectDocument?docApproversNo=${documentOne.docApproversNo}&initApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}"" id="initRejectBtn" class="rejectBtn px-2 py-0 font-bold text-xs text-red-500 bg-white btn hover:text-red-500 focus:text-red-500 active:text-red-500">반려</a>
											            	</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'A'}">
											            		<span class="text-green-600 font-bold">승인&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.initApprovalDatetime, 0, 10)}</span>
											            	</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'R'}">
											            		<a href="#" id="initRejectReasonBtn" data-reject-reason="${documentOne.initRejectReason}">
											            			<span class="text-red-600 font-bold">반려&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.initApprovalDatetime, 0, 10)}</span>
											            		</a>
										            		</c:if>
											            </td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${empty documentOne.midApprovalStatus && documentOne.initApprovalStatus == 'A' && documentOne.midApproverNo == empNo && documentOne.approvalStatus != 'T'}">
											            		<a href="${pageContext.request.contextPath}/document/approveDocument?docApproversNo=${documentOne.docApproversNo}&midApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}" id="midApproveBtn" class="approveBtn px-2 py-0 font-bold text-xs text-green-500 bg-white btn hover:text-green-500 hover:bg-text-green-500 focus:text-green-500 active:text-green-500">승인</a>
											            		<span>/</span>
											            		<a href="${pageContext.request.contextPath}/document/rejectDocument?docApproversNo=${documentOne.docApproversNo}&midApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}"" id="midRejectBtn" class="rejectBtn px-2 py-0 font-bold text-xs text-red-500 bg-white btn hover:text-red-500 focus:text-red-500 active:text-red-500">반려</a>
											            	</c:if>
											            	<c:if test="${documentOne.midApprovalStatus == 'A'}">
											            		<span class="text-green-600 font-bold">승인&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.midApprovalDatetime, 0, 10)}</span>
											            	</c:if>
											            	<c:if test="${documentOne.midApprovalStatus == 'R'}">
											            		<a href="#" id="midRejectReasonBtn" data-reject-reason="${documentOne.midRejectReason}">
											            			<span class="text-red-600 font-bold">반려&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.midApprovalDatetime, 0, 10)}</span>
											            		</a>
										            		</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'R'}">
											            		<span></span>
											            	</c:if>
											            </td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">
											            	<c:if test="${(empty documentOne.finalApprovalStatus) && documentOne.initApprovalStatus == 'A' && documentOne.midApprovalStatus == 'A' && documentOne.finalApproverNo == empNo && documentOne.approvalStatus != 'T'}">
											            		<a href="${pageContext.request.contextPath}/document/approveDocument?docApproversNo=${documentOne.docApproversNo}&finalApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}" id="finalApproveBtn" class="approveBtn px-2 py-0 font-bold text-xs text-green-500 bg-white btn hover:text-green-500 hover:bg-text-green-500 focus:text-green-500 active:text-green-500">승인</a>
											            		<span>/</span>
											            		<a href="${pageContext.request.contextPath}/document/rejectDocument?docApproversNo=${documentOne.docApproversNo}&finalApproverNo=${empNo}&docNo=${documentOne.docNo}&docType=${documentOne.docType}"" id="finalRejectBtn" class="rejectBtn px-2 py-0 font-bold text-xs text-red-500 bg-white btn hover:text-red-500 focus:text-red-500 active:text-red-500">반려</a>
											            	</c:if>
											            	<c:if test="${documentOne.finalApprovalStatus == 'A'}">
											            		<span class="text-green-600 font-bold">승인&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.finalApprovalDatetime, 0, 10)}</span>
											            	</c:if>
											            	<c:if test="${documentOne.finalApprovalStatus == 'R'}">
											            		<a href="#" id="finalRejectReasonBtn" data-reject-reason="${documentOne.finalRejectReason}">
											            			<span class="text-red-600 font-bold">반려&nbsp;&nbsp;&nbsp;${fn:substring(documentOne.finalApprovalDatetime, 0, 10)}</span>
											            		</a>
											            	</c:if>
											            	<c:if test="${documentOne.initApprovalStatus == 'R' || documentOne.midApprovalStatus == 'R'}">
											            		<span></span>
											            	</c:if>
											            </td>
											        </tr>
											    </tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br><br>
							<table style="border: 1px solid; width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 600px;"><colgroup> 
						        <col width="140"> 
						        <col width="660"> 
						   	</colgroup> 
	                        	<tbody>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 40px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle;">
											제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 40px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="3">
											<span id="docTitle" data-title="${documentOne.docTitle}" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px; vertical-align: middle;">
												${documentOne.docTitle}
											</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 40px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle; min-width: 160px;">
											퇴 사&nbsp;&nbsp;유 형
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 40px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 300px;">
											<span id="resignationType" data-title="${documentOne.resignationType}" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px; vertical-align: middle;">
												<c:if test="${documentOne.resignationType == 'V'}">
													<span>자발적&nbsp;퇴사</span>
												</c:if>
												<c:if test="${documentOne.resignationType == 'T'}">
													<span>정리&nbsp;해고</span>
												</c:if>
											</span>
										</td>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 40px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle; min-width: 160px;">
											퇴&nbsp;사&nbsp;일
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 40px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; min-width: 300px;">
											<span id="endDate" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px; vertical-align: middle;">
												<span>${documentOne.endDate}</span>
											</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px;border:1px solid black; height: 40px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle;" colspan="4">
											문&nbsp;&nbsp;서&nbsp;&nbsp;내&nbsp;&nbsp;용
										</td>
									</tr>
									<tr>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 560px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="4">
									        <div style="width: 100%; font-family: 'malgun gothic', dotum, arial, tahoma; font-size: 11pt; line-height: 2; margin-top: 0px; margin-bottom: 0px; padding: 30px; padding-left: 50px; white-space: pre-line; max-width: 100%; word-wrap: break-word; text-indent: 0;">
									            ${documentOne.docContent}
									        </div>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 36px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle;">
											비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 70px; text-align: left; color: rgb(0, 0, 0); font-size: 13px; font-weight: normal; vertical-align: middle;" colspan="3">
											<div style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding:5px; padding-left: 10px;">
												${documentOne.docRemarks}
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<table style="border: 0px solid rgb(0, 0, 0); width: 100%; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- Header --> 
						    	<colgroup> 
						    		<col width="310"> 
						    		<col width="490"> 
						   		</colgroup>
						   		<tbody>
						   			<tr>
										<td style="padding: 20px; padding-top:50px; border: 0px currentColor; border-image: none; height: 50px; text-align: center; color: black; font-size: 20px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											상기와 같이 연차 신청서를 제출합니다.
										</td>
									</tr>
									<tr>
										<td style="padding: 20px; padding-top:15px; border: 0px currentColor; border-image: none; height: 30px; text-align: center; color: black; font-size: 30px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											<span><img src="${pageContext.request.contextPath}/assets/images/logo-pettopia.png" alt="Pettopia Logo" style="height: 50px; display: inline; vertical-align: middle;">&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;&nbsp;E&nbsp;&nbsp;&nbsp;T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;A</span>
										</td>
									</tr>
								</tbody>
							</table>
							</div>
							<div style="height: 40px;"></div>
							<p style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>   
						</div>
						
						<!-- 업로드 한 파일 조회 -->
						<div class="flex justify-start items-end mb-3" style="width: 1000px;">
							<c:forEach var="documentFile" items="${documentFile}">
								<div class="flex p-2 border rounded-md" style="float: left; margin-right: 10px; min-width: 326px; max-width: 326px;"">
									<div class="shrink-0 me-3">
										<div class="p-2 rounded-md size-14 bg-slate-100">
											<c:choose>
											    <c:when test="${documentFile.fileExt == 'pdf'}">
											        <img class="block w-full h-full rounded-md" src="data:image/jpeg;base64,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">
											    </c:when>
											    <c:when test="${documentFile.fileExt == 'xlsx'}">
											        <img class="block w-full h-full rounded-md" src="data:image/jpeg;base64,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">
											    </c:when>
											    <c:when test="${documentFile.fileExt == 'png'}">
											        <img class="block w-full h-full rounded-md" src="data:image/jpeg;base64,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">
											    </c:when>
											    <c:when test="${documentFile.fileExt == 'jpg'}">
											        <img class="block w-full h-full rounded-md" src="data:image/jpeg;base64,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">
											    </c:when>
											    <c:when test="${documentFile.fileExt == 'txt'}">
											        <img class="block w-full h-full rounded-md" src="data:image/jpeg;base64,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">
											    </c:when>
											    <c:otherwise>
											        <img class="block w-full h-full rounded-md" src="data:image/png;base64,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">
											    </c:otherwise>
											</c:choose>
										</div>
									</div>                                        
									<div class="grow">                                            
										<div class="pt-1">                                                
											<h5 class="mb-1 text-15" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; float: left; max-width: 190px;">
												<a href="${pageContext.request.contextPath}/documentFile/${documentFile.fileName}.${documentFile.fileExt}" download="${documentFile.originFileName}.${documentFile.fileExt}">${documentFile.originFileName}</a>
											</h5>
											<h5 class="mb-1 text-15">
												.${documentFile.fileExt}
											</h5>
											<p class="mb-0 text-slate-500">
												<strong>
													<c:set var="fileSizeInMB" value="${documentFile.fileSize / (1024 * 1024)}" />
													<c:set var="fileSizeInMBFormatted" value="${fn:substring(fileSizeInMB, 0, fn:indexOf(fileSizeInMB, '.')+3)}" />
													<c:if test="${fileSizeInMBFormatted == 0.0}">
														0.1
													</c:if>
													<c:if test="${fileSizeInMBFormatted != 0.0}">
														${fileSizeInMBFormatted}
													</c:if>
												</strong> MB
												<c:if test="${documentOne.approvalStatus == 'T' }">
													<span style="float: right;">
														<a href="${pageContext.request.contextPath}/document/removeDocumentFile?docFileNo=${documentFile.docFileNo}&docNo=${documentFile.docNo}&docType=${documentOne.docType}" id="removeFileBtn" class="px-2 py-1 font-bold text-xs text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">삭제</a>
													</span>
												</c:if>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
							
						<div class="flex justify-end items-end" style="width: 1000px;">
							<c:if test="${documentOne.approvalStatus == 'T' }">
								<button type="button" class="mr-2 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">문서 수정</button>
							</c:if>
							<button type="button" id="pdfDownloadBtn" class="mr-2 text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">
								<i class="ri-file-pdf-2-line"></i> PDF 다운&nbsp;<svg style="display: inline;" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-download"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" x2="12" y1="15" y2="3"/></svg>
							</button>
							<a href="${pageContext.request.contextPath}/document/documentList" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</a>
						</div>
					</div>
				</div>
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
        
        <!-- 반려 사유 입력 모달창 -->
        <div id="insertInitRejectModal" modal-center="" class="insertInitRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">최초 결재자 반려 사유 입력</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center mb-2">
		            	<textarea id="initRejectReason" class="w-full h-40 p-3 border border-gray-300 rounded mb-2" style="resize: none;" placeholder="반려 사유를 입력하세요"></textarea>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id=submitInitRejectBtn type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                문서 반려
		            </button>
		            <button id="cancelInitBtn" type="button" class="text-custom-500 bg-white btn hover:text-custom-500 hover:bg-custom-100 focus:text-custom-500 focus:bg-custom-100 active:text-custom-500 active:bg-custom-100">
		                취소<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>
		
		<div id="insertMidRejectModal" modal-center="" class="insertMidRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">중간 결재자 반려 사유 입력</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center mb-2">
		            	<textarea id="midRejectReason" class="w-full h-40 p-3 border border-gray-300 rounded mb-2" style="resize: none;" placeholder="반려 사유를 입력하세요"></textarea>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id=submitMidRejectBtn type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                문서 반려
		            </button>
		            <button id="cancelMidBtn" type="button" class="text-custom-500 bg-white btn hover:text-custom-500 hover:bg-custom-100 focus:text-custom-500 focus:bg-custom-100 active:text-custom-500 active:bg-custom-100">
		                취소<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>
		
		<div id="insertFinalRejectModal" modal-center="" class="insertFinalRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">최종 결재자 반려 사유 입력</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center mb-2">
		            	<textarea id="finalRejectReason" class="w-full h-40 p-3 border border-gray-300 rounded mb-2" style="resize: none;" placeholder="반려 사유를 입력하세요"></textarea>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id=submitFinalRejectBtn type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                문서 반려
		            </button>
		            <button id="cancelFinalBtn" type="button" class="text-custom-500 bg-white btn hover:text-custom-500 hover:bg-custom-100 focus:text-custom-500 focus:bg-custom-100 active:text-custom-500 active:bg-custom-100">
		                취소<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>

		
		<!-- 반려 사유 조회 모달창 -->
		<div id="initRejectModal" modal-center="" class="initRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">최초 결재자 반려 사유</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center w-full h-40 border rounded p-3">
		            	<p id="initReasonText" class="text-gray-700" style="white-space: pre-line;"></p>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id="closeInitModal" type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                닫기<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>
		
		<div id="midRejectModal" modal-center="" class="midRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">중간 결재자 반려 사유</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center w-full h-40 border rounded p-3">
		            	<p id="midReasonText" class="text-gray-700" style="white-space: pre-line;"></p>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id="closeMidModal" type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                닫기<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>
		
		<div id="finalRejectModal" modal-center="" class="finalRejectModal fixed flex flex-col transition-all duration-300 ease-in-out left-2/4 z-drawer -translate-x-2/4 -translate-y-2/4 hidden">
		    <div class="w-screen bg-white shadow rounded-md flex flex-col h-full" style="width: 550px">
		        <!-- Modal Header -->
		        <div class="flex items-center justify-between p-4 bg-slate-100 border-b">
		            <h4 class="text-16 mr-auto">최종 결재자 반려 사유</h4> <!-- 제목 왼쪽 정렬을 위한 mr-auto 추가 -->
		        </div>
		         
		        <!-- Modal Content -->
		        <div class="max-h-[calc(theme('height.screen')_-_180px)] p-4 overflow-y-auto">
		            <div class="flex items-center w-full h-40 border rounded p-3">
		            	<p id="finalReasonText" class="text-gray-700" style="white-space: pre-line;"></p>
					</div>
		        </div>
		
		        <!-- Modal Footer -->
		        <div class="flex items-center justify-end p-1 mt-auto border-t border-slate-200">
		            <button id="closeFinalModal" type="button" class="mr-2 text-red-500 bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100">
		                닫기<i class="align-baseline ltr:pl-1 ri-close-line"></i>
		            </button>
		        </div>
		    </div>
		</div>

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

<!--dashboard ecommerce init js-->
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>

<!--pdf download-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

<script>
$(document).ready(function() {
    // PDF 다운로드 버튼 클릭 이벤트
    $('#pdfDownloadBtn').on('click', function() {
        const element = $('#draftOne')[0];  // PDF로 변환할 div 요소

        // html2canvas 옵션 설정
        const opt = {
            scale: 2,           // 이미지 품질 향상
            useCORS: true,      // CORS 오류 방지
            logging: false,     // 디버그 로그 끄기
            x: 0,               // 캡처 시작 X 좌표 (좌측)
            y: 0                // 캡처 시작 Y 좌표 (상단)
        };

        // html2canvas를 사용하여 div 요소를 캡처
        html2canvas(element, opt).then(function(canvas) {
            const { jsPDF } = window.jspdf;  // jsPDF 객체 가져오기
            const imgData = canvas.toDataURL('image/png');  // 캡처된 이미지를 PNG 포맷으로 변환
            const pdf = new jsPDF();  // jsPDF 객체 생성

            const imgProps = pdf.getImageProperties(imgData);
            const pdfWidth = pdf.internal.pageSize.getWidth();  // PDF 페이지의 너비
            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;  // 비율에 따라 높이 계산

            // PDF에 이미지 추가 (0, 0)에서 시작하여 이미지 위치 조정
            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);

            // documentOne.createDatetime에서 시간(T 이후)을 제거하고 -를 _로 치환
            const createDatetime = '${documentOne.createDatetime}'.split('T')[0].replace(/-/g, '.');  // 날짜에서 시간 제거하고 -를 .로 변환

            // 제목에서 공백을 언더바로 변경
            const title = ($('#docTitle').data('title') || 'defaultTitle').replace(/\s+/g, '_');  // 공백을 언더바로 변경

            // 날짜와 제목을 결합하여 파일명 설정
            const fileName = '(' + createDatetime + ')' + title;

            pdf.save(fileName + ".pdf");  // 파일명 설정 및 PDF 저장
        }).catch(function(error) {
            console.error("html2canvas error:", error);  // 에러 발생 시 로그 출력
        });
    });
    
    
    $('#removeFileBtn').click(function(e) {
        e.preventDefault();

        if (confirm("정말 삭제하시겠습니까?")) {
            // 삭제를 수행하는 코드 작성
            window.location.href = $(this).attr('href');
            alert("파일이 삭제되었습니다.");
        } 
    });
    
	// 반려 버튼 클릭 시 모달 열기
    $('#initRejectBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        // confirm 다이얼로그로 사용자의 반려 의사를 묻기
        if (!confirm("결재 문서를 반려하시겠습니까?")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        // 반려 사유를 입력 받는 모달을 띄우기
        if (!confirm("반려 사유를 적어주세요.")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        $('#insertInitRejectModal').removeClass('hidden'); // 모달 열기
    });
	
    $('#midRejectBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        // confirm 다이얼로그로 사용자의 반려 의사를 묻기
        if (!confirm("결재 문서를 반려하시겠습니까?")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        // 반려 사유를 입력 받는 모달을 띄우기
        if (!confirm("반려 사유를 적어주세요.")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        $('#insertMidRejectModal').removeClass('hidden'); // 모달 열기
    });
    
    $('#finalRejectBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        // confirm 다이얼로그로 사용자의 반려 의사를 묻기
        if (!confirm("결재 문서를 반려하시겠습니까?")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        // 반려 사유를 입력 받는 모달을 띄우기
        if (!confirm("반려 사유를 적어주세요.")) {
            return; // 취소를 클릭하면 동작을 멈추고 함수 종료
        }
        $('#insertFinalRejectModal').removeClass('hidden'); // 모달 열기
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('#cancelInitBtn').on('click', function() {
        $('#insertInitRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $('#cancelMidBtn').on('click', function() {
        $('#insertMidRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $('#cancelFinalBtn').on('click', function() {
        $('#insertFinalRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $(document).on('keydown', function(event) {
        if (event.key === 'Escape') {  // ESC 키 눌렀을 때
            // 각 모달이 열려 있는지 확인하고 닫기
            $('#insertInitRejectModal').addClass('hidden');
            $('#insertMidRejectModal').addClass('hidden');
            $('#insertFinalRejectModal').addClass('hidden');
        }
    });

    // 반려 버튼 클릭 시
    $('#submitInitRejectBtn').on('click', function() {
        var initRejectReason = $('#initRejectReason').val(); // 반려 사유 가져오기
        
        if (initRejectReason.trim() === '') {
            alert('반려 사유를 입력하세요.');
            return;
        }

        // URL 파라미터 설정
        var docApproversNo = '${documentOne.docApproversNo}';
        var initApproverNo = '${empNo}';
        var docNo = '${documentOne.docNo}';
        var docType = '${documentOne.docType}';

		// URL 생성
		var url = '/pettopia/document/rejectDocument?docApproversNo=' + docApproversNo +
		          '&initApproverNo=' + initApproverNo + 
		          '&docNo=' + docNo + 
		          '&docType=' + docType + 
		          '&initRejectReason=' + encodeURIComponent(initRejectReason);

        // 페이지 이동 (서버로 전송)
        window.location.href = url; // 페이지 이동 방식
    });
    
    $('#submitMidRejectBtn').on('click', function() {
        var midRejectReason = $('#midRejectReason').val(); // 반려 사유 가져오기
        
        if (midRejectReason.trim() === '') {
            alert('반려 사유를 입력하세요.');
            return;
        }

        // URL 파라미터 설정
        var docApproversNo = '${documentOne.docApproversNo}';
        var midApproverNo = '${empNo}';
        var docNo = '${documentOne.docNo}';
        var docType = '${documentOne.docType}';

		// URL 생성
		var url = '/pettopia/document/rejectDocument?docApproversNo=' + docApproversNo +
		          '&midApproverNo=' + midApproverNo + 
		          '&docNo=' + docNo + 
		          '&docType=' + docType + 
		          '&midRejectReason=' + encodeURIComponent(midRejectReason);

        // 페이지 이동 (서버로 전송)
        window.location.href = url; // 페이지 이동 방식
    });
    
    $('#submitFinalRejectBtn').on('click', function() {
        var finalRejectReason = $('#finalRejectReason').val(); // 반려 사유 가져오기
        
        if (finalRejectReason.trim() === '') {
            alert('반려 사유를 입력하세요.');
            return;
        }

        // URL 파라미터 설정
        var docApproversNo = '${documentOne.docApproversNo}';
        var finalApproverNo = '${empNo}';
        var docNo = '${documentOne.docNo}';
        var docType = '${documentOne.docType}';

		// URL 생성
		var url = '/pettopia/document/rejectDocument?docApproversNo=' + docApproversNo +
		          '&finalApproverNo=' + finalApproverNo + 
		          '&docNo=' + docNo + 
		          '&docType=' + docType + 
		          '&finalRejectReason=' + encodeURIComponent(finalRejectReason);

        // 페이지 이동 (서버로 전송)
        window.location.href = url; // 페이지 이동 방식
    });
    
	// 반려 버튼 클릭 시
    $('#initRejectReasonBtn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지
        
        // 반려 사유를 data-reject-reason 속성에서 가져오기
        var rejectReason = $(this).data('reject-reason');
        
        // 모달에 반려 사유 표시
        $('#initReasonText').text(rejectReason || "반려 사유가 없습니다.");
        
        // 모달 열기
        $('#initRejectModal').removeClass('hidden');
    });

    // 모달 닫기 버튼 클릭 시
    $('#closeInitModal').on('click', function() {
        $('#initRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $(document).on('keydown', function(event) {
        if (event.key === 'Escape') {  // ESC 키 눌렀을 때
            $('#initRejectModal').addClass('hidden'); // 모달 닫기
        }
    });
    
    $('#midRejectReasonBtn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지
        
        // 반려 사유를 data-reject-reason 속성에서 가져오기
        var rejectReason = $(this).data('reject-reason');
        
        // 모달에 반려 사유 표시
        $('#midReasonText').text(rejectReason || "반려 사유가 없습니다.");
        
        // 모달 열기
        $('#midRejectModal').removeClass('hidden');
    });

    // 모달 닫기 버튼 클릭 시
    $('#closeMidModal').on('click', function() {
        $('#midRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $(document).on('keydown', function(event) {
        if (event.key === 'Escape') {  // ESC 키 눌렀을 때
            $('#midRejectModal').addClass('hidden'); // 모달 닫기
        }
    });
    
    $('#finalRejectReasonBtn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지
        
        // 반려 사유를 data-reject-reason 속성에서 가져오기
        var rejectReason = $(this).data('reject-reason');
        
        // 모달에 반려 사유 표시
        $('#finalReasonText').text(rejectReason || "반려 사유가 없습니다.");
        
        // 모달 열기
        $('#finalRejectModal').removeClass('hidden');
    });

    // 모달 닫기 버튼 클릭 시
    $('#closeFinalModal').on('click', function() {
        $('#finalRejectModal').addClass('hidden'); // 모달 닫기
    });
    
    $(document).on('keydown', function(event) {
        if (event.key === 'Escape') {  // ESC 키 눌렀을 때
            $('#finalRejectModal').addClass('hidden'); // 모달 닫기
        }
    });
    
    // 초기 결재자 승인 버튼 클릭 시
    $('#initApproveBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        if (!confirm("결재 문서를 승인하시겠습니까?")) {
            return; // 취소
        }
        
        window.location.href = $(this).attr('href');
    });
    
	 // 중간 결재자 승인 버튼 클릭 시
    $('#midApproveBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        if (!confirm("결재 문서를 승인하시겠습니까?")) {
            return; // 취소
        }
        
        window.location.href = $(this).attr('href');
    });
	 
	 // 최종 결재자 승인 버튼 클릭 시
    $('#finalApproveBtn').on('click', function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막기
        
        if (!confirm("결재 문서를 승인하시겠습니까?")) {
            return; // 취소
        }
        
        window.location.href = $(this).attr('href');
    });
    
});
</script>

</body>

</html>