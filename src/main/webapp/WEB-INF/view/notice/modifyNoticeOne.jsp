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
                        <h5 class="text-16">공지사항 수정하기</h5>
                    </div>
                    <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                        <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                            <a href="#!" class="text-slate-400 dark:text-zink-200">공지사항</a>
                        </li>
                        <li class="text-slate-700 dark:text-zink-100">
                            공지사항 수정하기
                        </li>
                    </ul>
                </div>
                <!-- Main content -->
                <div class="xl:col-span-9">
				    <div class="card max-w-4xl mx-auto shadow-lg rounded-lg">
				        <div class="card-body p-6">
				            <form id="saveForm" action="${pageContext.request.contextPath}/notice/modifyNoticeOne" method="post" autocomplete="off" enctype="multipart/form-data">
                				<input type="hidden" name="noticeNo" value="${existingNotice.noticeNo}">
                				
				                <!-- Department and Title -->
				                <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
				                    <!-- Department -->
				                    <div class="col-span-1">
				                        <label class="block mb-2 text-base font-medium">부서</label>
				                        <select name="divisionCode" id="division" class="mr-2" onchange="setDeptCode()">
				                            <option value="" style="text-align: center;">전체</option>
				                            <c:forEach var="d" items="${divisionList}">
				                                <option value="${d.divisionCode}" style="text-align: center" <c:if test="${d.divisionCode == existingNotice.deptCode}">selected</c:if>>${d.divisionName}</option>
				                            </c:forEach>
				                        </select>
				                        <input type="hidden" id="deptCode" name="deptCode" value="">
				                    </div>
				
				                    <!-- Title -->
				                    <div class="col-span-1 mb-4">
				                        <label class="block mb-2 text-base font-medium">제목</label>
				                        <input type="text" name="noticeTitle" class="w-full form-input border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-custom-500" placeholder="제목을 입력하세요" value="${existingNotice.noticeTitle}">
				                    </div>
				                </div>
				
				                <!-- CKEditor -->
				                <div class="col-span-1 mb-4">
				                    <textarea name="noticeContent" id="editor">${existingNotice.noticeContent}</textarea>
				                </div>
				
				                 <!-- 기존 파일 다운로드 -->
								<div class="grid grid-cols-1 gap-2 lg:grid-cols-1 xl:grid-cols-12 m-2 mt-4">
								    <div class="lg:col-span-2 xl:col-span-12">
								        <label class="inline-block text-base font-medium">현재 첨부된 파일</label>
								    </div>
								    <div id="fileDiv" class="lg:col-span-2 xl:col-span-12">
								        <c:forEach var="file" items="${noticeFileList}">
								            <div id="file-${file.noticeFileNo}">
								                ${file.originFileName} 
								                <input type="hidden" name="existingFileNoList" value="${file.noticeFileNo}"> 
								                <button type="button" class="text-red-500" onclick="removeFile(${file.noticeFileNo})">삭제</button>
								            </div>
								        </c:forEach>
								    </div>
								</div>
								
								<!-- 파일 추가 -->
								<div class="grid grid-cols-1 gap-2 lg:grid-cols-1 xl:grid-cols-12 m-2">
								    <div class="lg:col-span-2 xl:col-span-12">
								        <label for="fileUpload" class="inline-block text-base font-medium">파일 업로드</label>
								        <input type="file" name="noticeFile" multiple>
								    </div>
								</div>

				
				                <!-- Pinned Checkbox -->
				                <div class="mt-4">
				                    <label class="block mb-2 text-base font-medium">
				                        <input type="checkbox" id="pinnedCheckbox" name="fixedPost" onclick="setPinnedValue()" <c:if test="${existingNotice.isPinned == 'Y'}">checked</c:if>>
				                        고정 게시글로 설정
				                    </label>
				                </div>
				
				                <!-- Buttons -->
				                <div class="flex justify-end gap-4 mt-8">
				                    <button type="submit" class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">수정 완료</button>
				                    <a href="${pageContext.request.contextPath}/notice/getNoticeList">
				                        <button type="button" class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">목록</button>
				                    </a>
				                </div>
				            </form>
				        </div>
				    </div>
				</div>
				                
                
                
                            </div>
                        </div><!--end card-->
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
<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.umd.js" crossorigin></script>
<script src="https://cdn.ckeditor.com/ckeditor5/44.1.0/translations/ko.umd.js" crossorigin></script>
<script src="./main.js"></script>
<!-- App js -->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.4.2/purify.min.js">
// Get the content from CKEditor
const editorContent = CKEDITOR.instances.editor.getData();

// Sanitize HTML content to avoid XSS vulnerabilities
const sanitizedContent = DOMPurify.sanitize(editorContent);

// Display the sanitized HTML inside the div
document.getElementById('displayArea').innerHTML = sanitizedContent;
	
</script>
<script>
let filesToDelete = []; // 삭제할 파일 번호를 저장할 배열

function removeFile(fileNo) {
    // 파일 삭제 요청을 위한 확인 대화상자
    if (confirm("정말로 이 파일을 삭제하시겠습니까?")) {
        // 파일 번호를 삭제할 리스트에 추가
        if (!filesToDelete.includes(fileNo)) {
            filesToDelete.push(fileNo);
        }
        
        // UI에서 파일 항목 제거
        const fileElement = document.getElementById(`file-${fileNo}`);
        if (fileElement) {
            fileElement.remove(); // UI에서 파일 항목 제거
        }
    }
}

// 수정 확인 버튼 클릭 시 삭제할 파일 번호를 전송
function confirmModification() {
    // AJAX 요청으로 삭제할 파일 번호 전송
    fetch('/notice/modifyNoticeOne', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ filesToDelete: filesToDelete }) // 삭제할 파일 번호 배열
    })
    .then(response => {
        if (response.ok) {
            alert("수정이 완료되었습니다.");
            // 수정 완료 후 필요한 작업 수행
        } else {
            alert("수정에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert("수정 중 오류가 발생했습니다.");
    });
}
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
	
	 ClassicEditor.create(document.querySelector('#editor'), editorConfig)
     .then(editor => {
         // 폼 제출 시 에디터 내용을 textarea에 저장
         document.querySelector('form').addEventListener('submit', () => {
             document.querySelector('textarea[name="noticeContent"]').value = editor.getData();
         });
     })
     .catch(error => console.error(error));
</script>
</body>

</html>