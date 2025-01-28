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
    <!--CKeditor -->		
	<link rel="stylesheet" href="./style.css">
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css" crossorigin>
	<!-- Dropzone.js API -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@5.9.3/dist/dropzone.min.css">
	<script src="https://cdn.jsdelivr.net/npm/dropzone@5.9.3/dist/dropzone.min.js"></script>
</head>
<style>

	@import url('https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400;1,700&display=swap');

	@media print {
		body {
			margin: 0 !important;
		}
	}
	
	.main-container {
		font-family: 'Lato';
		width: fit-content;
		margin-left: auto;
		margin-right: auto;
	}
	
	.ck-content {
		font-family: 'Lato';
		line-height: 1.6;
		word-break: break-word;
	}
	
	.ck-editor__editable_inline {
	    min-height: 300px;
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
                        <h3 class="text-16">공지사항 작성</h3>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">공지사항</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            공지사항 작성
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="xl:col-span-9">
				    <div class="card max-w-4xl mx-auto shadow-lg rounded-lg">
				        <div class="card-body p-6">
				            <form id="noticeForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/notice/addNotice">
				                <!-- Department and Title -->
				                <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
				                    <!-- Department -->
				                    <div class="col-span-1">
				                        <label for="division" class="block mb-2 text-base font-medium">부서</label>
				                        <h2 class="mb-2 text-green-600">${sessionScope.loginEmp.rankNo}</h2>
				                        <c:if test="${sessionScope.loginEmp.rankNo >= 40}">
				                            <select name="division" class="w-full form-select border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-custom-500">
				                                <option value="">소속 부서를 선택하세요</option>
				                            </select>
				                        </c:if>
				                    </div>
				
				                    <!-- Title -->
				                    <div class="col-span-1">
				                        <label for="docTitle" class="block mb-2 text-base font-medium">제목</label>
				                        <input type="text" name="docTitle" class="w-full form-input border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-custom-500" placeholder="제목을 입력하세요">
				                    </div>
				                </div>
				
				                <!-- CKEditor -->
									<div class="editor-container editor-container_classic-editor mt-4" id="editor-container">
										<div class="editor-container__editor" style="padding-left: 10px;"> 
											<div id="editor"></div></div>
									</div>
				
				
								<!-- 첨부파일 Drag&Drop -->
                                    <div class="item lg:col-span-2 xl:col-span-12 mt-6">
								        <label for="genderSelect" class="inline-block mb-2 text-base font-medium">파일 업로드</label>
								        <div id="fileUploadArea" class="flex items-center justify-center bg-white border border-dashed rounded-md cursor-pointer dropzone border-slate-300 dark:bg-zink-700 dark:border-zink-500 dropzone2 dz-clickable">
								            <div class="w-full py-5 text-lg text-center dz-message needsclick">
								                <div class="mb-3">
								                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload-cloud" class="lucide lucide-upload-cloud block mx-auto size-12 text-slate-500 fill-slate-200 dark:text-zink-200 dark:fill-zink-500">
								                        <path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path>
								                        <path d="M12 12v9"></path>
								                        <path d="m16 16-4-4-4 4"></path>
								                    </svg>
								                </div>
								                <h5 class="mb-0 font-normal text-slate-500 dark:text-zink-200 text-15">파일을 드래그해주세요.</h5>
								            </div>
								        </div>
								        <ul class="flex flex-wrap mb-0 gap-x-5" id="dropzone-preview2"></ul>
								    </div>
                                        
				                <!-- File Attachment -->
				                <!-- <div class="mt-6">
				                    <label class="block mb-2 text-base font-medium">첨부 파일</label>
				                    <div class="border border-gray-200 rounded-md p-3 bg-gray-50">
				                        <span>${noticeOne.noticeFileNo || "첨부 파일이 없습니다"}</span>
				                    </div>
				                </div>  -->
				
				                <!-- Buttons -->
				                <div class="flex justify-end gap-4 mt-8">
				                    <a href="${pageContext.request.contextPath}">
				                        <button type="button" class="px-4 py-2 text-white bg-custom-500 border border-custom-500 rounded-lg hover:bg-custom-600 focus:ring-2 focus:ring-custom-300">수정</button>
				                    </a>
				                    <a href="${pageContext.request.contextPath}/notice/getNoticeList">
				                        <button type="button" class="px-4 py-2 text-white bg-green-500 border border-green-500 rounded-lg hover:bg-green-600 focus:ring-2 focus:ring-green-300">목록</button>
				                    </a>
				                </div>
				            </form>
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
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.umd.js" crossorigin></script>
<script src="https://cdn.ckeditor.com/ckeditor5/44.1.0/translations/ko.umd.js" crossorigin></script>
<script src="./main.js"></script>
<script type="text/javascript">
// Dropzone API
Dropzone.autoDiscover = false;

document.addEventListener("DOMContentLoaded", function() {
    // Dropzone 실행
    var myDropzone = new Dropzone("#fileUploadArea", {
        url: "/pettopia/addFile",
        paramName: "file",  // 파라미터
        maxFilesize: 10,    // 파일 최대사이즈
        acceptedFiles: ".jpg, .jpeg, .png, .gif, .pdf, .docx", // 파일 유형
        addRemoveLinks: true, // 파일 삭제 옵션
        dictDefaultMessage: "파일 선택 또는 드래그 해주세요.", // 기본 메시지
        dictRemoveFile: "삭제", // 삭제 텍스트
        
        init: function () {
            this.on("success", function (file, response) {
                console.log("파일이 업로드 되었습니다!");
            });

            this.on("error", function (file, errorMessage) {
                console.error("파일 업로드 실패했습니다.", errorMessage);
            });
            
            // 파일 삭제시
            this.on("removedfile", function(file) { // 이벤트 이름 수정
                console.log("파일이 삭제되었습니다.", file);
            });
        }
    });

    // 수동으로 파일 제출, Dropzone으로 업로드 하기.
    document.getElementById("noticeForm").addEventListener("submit", function (e) {
        e.preventDefault();  // 기본 제출 방지

        // 객체 생성
        var formData = new FormData(this);

        // 파일 업로드 되어있으면, append로 추가하기
        if (myDropzone.files.length > 0) {
            myDropzone.files.forEach(function (file) {
                formData.append("file", file);
            });
        }

        // form data 전송
        fetch("/pettopia/addFile", { // 쉼표 추가
            method: "POST",             
            body: formData,             
        })
        .then(response => {
            if (response.ok) {
                console.log("공지사항이 성공적으로 추가되었습니다.");
                return response.text(); 
            } else {
                throw new Error("공지사항 업로드 실패");
            }
        })
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error("에러 발생:", error);
        });
    });
</script>


<script>
//CKEditor
	const {
		ClassicEditor,
		Autosave,
		BlockQuote,
		Bold,
		Essentials,
		Heading,
		Indent,
		IndentBlock,
		Italic,
		Link,
		Paragraph,
		SpecialCharacters,
		Table,
		TableCaption,
		TableCellProperties,
		TableColumnResize,
		TableProperties,
		TableToolbar,
		Underline
	} = window.CKEDITOR;
	
	const LICENSE_KEY =
		'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3MzkzMTgzOTksImp0aSI6ImU1MTA5MDUwLTVmMDctNGE2NC04Nzc1LWQ2YTU1ODVkNTVmNyIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiLCJzaCJdLCJ3aGl0ZUxhYmVsIjp0cnVlLCJsaWNlbnNlVHlwZSI6InRyaWFsIiwiZmVhdHVyZXMiOlsiKiJdLCJ2YyI6IjQwNzlmNTQxIn0.9h-4-f2NVZFCmrnBvERfiCFD-mgLaldK-wimYdIJy6X595wSGXY4jv4lFSSJ4wTIxUbYRyAXPweBSq1X4aPEig';
	
	const editorConfig = {
		toolbar: {
			items: [
				'heading',
				'|',
				'bold',
				'italic',
				'underline',
				'|',
				'specialCharacters',
				'link',
				'insertTable',
				'blockQuote',
				'|',
				'outdent',
				'indent'
			],
			shouldNotGroupWhenFull: true
		},
		plugins: [
			Autosave,
			BlockQuote,
			Bold,
			Essentials,
			Heading,
			Indent,
			IndentBlock,
			Italic,
			Link,
			Paragraph,
			SpecialCharacters,
			Table,
			TableCaption,
			TableCellProperties,
			TableColumnResize,
			TableProperties,
			TableToolbar,
			Underline
		],
		heading: {
			options: [
				{
					model: 'paragraph',
					title: 'Paragraph',
					class: 'ck-heading_paragraph'
				},
				{
					model: 'heading1',
					view: 'h1',
					title: 'Heading 1',
					class: 'ck-heading_heading1'
				},
				{
					model: 'heading2',
					view: 'h2',
					title: 'Heading 2',
					class: 'ck-heading_heading2'
				},
				{
					model: 'heading3',
					view: 'h3',
					title: 'Heading 3',
					class: 'ck-heading_heading3'
				},
				{
					model: 'heading4',
					view: 'h4',
					title: 'Heading 4',
					class: 'ck-heading_heading4'
				},
				{
					model: 'heading5',
					view: 'h5',
					title: 'Heading 5',
					class: 'ck-heading_heading5'
				},
				{
					model: 'heading6',
					view: 'h6',
					title: 'Heading 6',
					class: 'ck-heading_heading6'
				}
			]
		},
		initialData:'',
		language: 'ko',
		licenseKey: LICENSE_KEY,
		link: {
			addTargetToExternalLinks: true,
			defaultProtocol: 'https://',
			decorators: {
				toggleDownloadable: {
					mode: 'manual',
					label: 'Downloadable',
					attributes: {download: 'file'}
				}
			}
		},
		menuBar: {
			isVisible: true
		},
		placeholder: '내용을 입력해주세요.',
		table: {
			contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells', 'tableProperties', 'tableCellProperties']
		},
        // 폭, 높이 수정.
        width: '100%',
        height: '500px'
	};
	
	  ClassicEditor.create(document.querySelector('#editor'), editorConfig);
	  
</script>

</body>

</html>