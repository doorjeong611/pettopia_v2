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
    <!-- CKEditor5 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/boardStyle.css">
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css" crossorigin>
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
</head>

<style>
	.boardHeader {
		width: 70%;
		margin: 0 auto;
	}
	
	.boardHeader .inputBox {width: 100%; }
	.boardHeader .inputBox .categoryBox {width: 20%;margin-bottom: 1%; margin-right: 1%; float: left;}
	.boardHeader .inputBox .titleBox {width: 79%; float: left; margin-bottom: 1%;}
	
	.boardContent {
		width: 70%;
		margin: 0 auto;
	}
	.boardContent .contentBox {
	margin-top: 1%;
	padding-bottom: 1%;
	}
	.boardContent .contentBox textarea {
		height: 500px;
		resize: none;
		margin: 1% 0;
	}
	.boardContent .contentBox > input {
		margin: 1% 0;
		
	}
	.btnContentBox {
		width: 70%;
		margin: 0 auto;
	}
	
	.btnContentBox .btnBox{
	 	display: flex;
	    justify-content: flex-end;
	    width: 100%;
	}
	.btnContentBox .btnBox .btn {
		margin-left: 1%;
		float:left;
	}
	.cancel-btn{
		border:1px solid #EF4444;
		background-color: #fff;
	}
	.cancel-btn:hover {
		background-color: #fff;
	}
	.boardContent .fileBox {
		width: 100%; 
		display: flex;
		margin-bottom: 1%;
	    justify-content: flex-end;
		
	}
	.boardContent .fileContentBox {
		width:100%;
	}
	.boardContent .fileContentBox input {
	margin-top: 1%;
	}
	
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
                            <a href="${pageContext.request.contextPath}/board/boardList" class="text-slate-400 dark:text-zink-200 ">사내 게시판</a>
                        </li>
                         <li class="text-slate-700 dark:text-zink-100 before:text-slate-400 dark:text-zink-200">
                            게시글 수정하기
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                

                <div class="card" >
                	 <div class="card-body" >
                	 	
                        
	                    <!-- 게시글 작성 -->
                        <form id="formCategory" action="${pageContext.request.contextPath}/board/modifyBoard" method="post" enctype="multipart/form-data" >
	                        <input type="hidden" name="boardNo" value="${boardMap.boardNo}">
	                        <!-- boardHeader 시작 -->
	                        <div class="boardHeader">
		                        <div class="inputBox">
		                        	<div class="categoryBox">
		                        		<label for="boardCategory">말머리</label> <span class="text-red-500">*</span>
			                        		<select id="boardCategory" name="category"  class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
												<option value="" ${boardCategory == '' ? 'selected' : ''}>전체</option>
												<option value="SG" ${boardCategory == 'SG' ? 'selected' : ''}>건의사항</option>
												<option value="DS" ${boardCategory == 'DS' ? 'selected' : ''}>토론</option>
												<option value="CT" ${boardCategory == 'CT' ? 'selected' : ''}>잡담</option>
												<option value="IN" ${boardCategory == 'IN' ? 'selected' : ''}>정보</option>
												<option value="QA" ${boardCategory == 'QA' ? 'selected' : ''}>질문</option>
												<option value="CP" ${boardCategory == 'CP' ? 'selected' : ''}>칭찬</option>
											</select>
								</div>
			                        <div class="titleBox">
			                        	<label for="boardTitle">제목</label> <span class="text-red-500">*</span>
			                        		<input type="text" class="form-input" name="boardTitle" value="${boardMap.boardTitle}">
		                        	</div>
                        		</div>
	                        </div>
	                        <!-- boardHeader 종료 -->
	                        
	                        <!-- boardContent 시작 -->
                        	<div class="boardContent">	
	                        	<div class="contentBox">
		                        	<label for="boardContent">내용</label> <span class="text-red-500">*</span>
			                        	<textarea name="boardContent" class="form-input">${boardMap.boardContent}</textarea>
		                        	<div class="fileBox">
			                        	<div class="fileContentBox">
			                        		<label for="boardImg">이미지 첨부</label> <span class="text-red-500">*</span>
		                        			<input type="file" name="boardImg" class="form-file">
			                        	</div>
			                        
                        			</div>
			                        	
	                        	</div>
                        	</div>
                        	<!-- boardContent 종료 -->
                        	
                       		<div class="btnContentBox ">
	                        	<div class="btnBox">
	                        		<a href="${pageContext.request.contextPath}/board/boardList" class="text-red-500 cancel-btn bg-white btn hover:text-red-500 hover:bg-red-100 focus:text-red-500 focus:bg-red-100 active:text-red-500 active:bg-red-100 dark:bg-zink-700 dark:hover:bg-red-500/10 dark:focus:bg-red-500/10 dark:active:bg-red-500/10"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="x" class="lucide lucide-x inline-block size-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg> <span class="align-middle">취소</span></a>
	                        		<button type="submit" class="text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">수정하기</button>
	                       		</div>
                       		</div>
                        </form>
                        
                        
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
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // 폼 제출 시 유효성 검사
    $("form").submit(function(event) {
        var title = $("input[name='boardTitle']").val();  // 제목 값 가져오기
        var content = $("textarea[name='boardContent']").val();  // 내용 값 가져오기
        var fileInput = $("input[name='boardImg']")[0];  // 파일 입력 필드 가져오기

        // 제목과 내용이 비어있거나 4글자 미만일 경우 경고창 띄우기
        if (title.trim() === "" || title.length < 4) {
            alert("제목을 4글자 이상 입력해주세요.");
            event.preventDefault();  // 폼 제출 막기
            return false;
        }
        if (content.trim() === "" || content.length < 10) {
            alert("내용을 10글자 이상 입력해주세요.");
            event.preventDefault();  // 폼 제출 막기
            return false;
        }

        // 파일 첨부 유효성 검사 (이미지 파일만 허용)
        var file = fileInput.files[0];
        if (file) {
            var fileName = file.name;
            var fileExtension = fileName.split('.').pop().toLowerCase();  // 파일 확장자 추출

            // 허용된 확장자 목록 (webp 포함)
            var allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

            if (!allowedExtensions.includes(fileExtension)) {
                alert("이미지 파일만 업로드 가능합니다.");
                event.preventDefault();  // 폼 제출 막기
                return false;
            }
        }
    });
});
</script>
</body>

</html>