<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                        <h5 class="text-16">기안 문서</h5>
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
											기&nbsp;&nbsp;&nbsp;안&nbsp;&nbsp;&nbsp;문&nbsp;&nbsp;&nbsp;서
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
											            <td style="text-align: center; padding: 15px; border: 1px solid black;">${documentOne.docWriterName}</td>
											            <td style="text-align: center; padding: 15px; border: 1px solid black;">${documentOne.initApproverName}</td>
											            <td style="text-align: center; padding: 15px; border: 1px solid black;">사인/이름</td>
											            <td style="text-align: center; padding: 15px; border: 1px solid black;">사인/이름</td>
											        </tr>
											        <tr style="height: 10px;">
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">${fn:substring(documentOne.createDatetime, 0, 10)}</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">2025-01-21</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">2025-01-23</td>
											            <td style="text-align: center; padding: 5px; border: 1px solid black;">2025-01-31</td>
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
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 40px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
											<span id="docTitle" data-title="${documentOne.docTitle}" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; padding-left: 10px; vertical-align: middle;">
												${documentOne.docTitle}
											</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px;border:1px solid black; height: 40px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle;" colspan="2">
											상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용
										</td>
									</tr>
									<tr>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 600px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2">
									        <div style="width: 100%; font-family: 'malgun gothic', dotum, arial, tahoma; font-size: 11pt; line-height: 2; margin-top: 0px; margin-bottom: 0px; padding: 30px; padding-left: 50px; white-space: pre-line; max-width: 100%; word-wrap: break-word; text-indent: 0;">
									            ${documentOne.docContent}
									        </div>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 36px; text-align: center; color: rgb(0, 0, 0); font-size: 13px; font-weight: bold; vertical-align: middle;">
											비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 70px; text-align: left; color: rgb(0, 0, 0); font-size: 13px; font-weight: normal; vertical-align: middle;">
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
											상기와 같이 기안서를 제출합니다.
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
});
</script>






</body>

</html>