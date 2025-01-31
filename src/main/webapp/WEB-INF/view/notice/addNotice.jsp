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
				        	 <form id="savaForm" action="${pageContext.request.contextPath}/notice/addNotice" method="post" autocomplete="off" enctype="multipart/form-data">
				                <!-- Department and Title -->
				                <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
			                    <!-- Department -->
								<div class="col-span-1">
									    <label class="block mb-2 text-base font-medium">부서</label>
									    <select name="divisionCode" id="division" class="mr-2" onchange="setDeptCode()">
									        <option value="" style="text-align: center;">전체</option>
									       <c:forEach var="d" items="${divisionList}">
									           <option value="${d.divisionCode}" style="text-align: center">${d.divisionName}</option>
									       </c:forEach>
									    </select>
									    <input type="hidden" id="deptCode" name="deptCode" value="">
									</div>
				
				                    <!-- Title -->
				                    <div class="col-span-1">
				                        <label class="block mb-2 text-base font-medium">제목</label>
				                        <input type="text" name="noticeTitle" class="w-full form-input border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-custom-500" placeholder="제목을 입력하세요">
				                    </div>
				                </div>
				
				                <!-- CKEditor -->
				                <textarea name="noticeContent" id="editor">
								</textarea>
								
								 <!-- File Upload -->
				               <tr>
							        <th>첨부파일</th>
							        <td colspan="3">
							            <div class="file_list">
							                <div>
							                    <div class="file_input">
							                        <input type="text" readonly />
							                        <label> 첨부파일
							                            <input type="file" name="file" onchange="selectFile(this);" />
							                        </label>
							                    </div>
							                    <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
							                    <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일추가</span></button>
							                </div>
							            </div>
							        </td>
							    </tr>

								<!-- Pinned Checkbox -->
				                <div class="mt-4">
				                    <label class="block mb-2 text-base font-medium">
				                        <input type="checkbox" id="pinnedCheckbox" name="fixedPost" onclick="setPinnedValue()">
				                        고정 게시글로 설정
				                    </label>
				                    <input type="hidden" id="isPinned" name="isPinned" value="N">
				                </div>
			                
				                <!-- Buttons -->
				                <div class="flex justify-end gap-4 mt-8">
				                    <a href="${pageContext.request.contextPath}">
				                        <button type="submit" class="px-4 py-2 text-white bg-custom-500 border border-custom-500 rounded-lg hover:bg-custom-600 focus:ring-2 focus:ring-custom-300">업로드</button>
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
<script>
// 파일 선택
	function selectFile(element) {
	
	    const file = element.files[0];
	    const filename = element.closest('.file_input').firstElementChild;
	
	    // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
	    if ( !file ) {
	        filename.value = '';
	        return false;
	    }
	
	    // 2. 파일 크기가 50MB를 초과하는 경우
	    const fileSize = Math.floor(file.size / 1024 / 1024);
	    if (fileSize > 10) {
	        alert('50MB 이하의 파일로 업로드해 주세요.');
	        filename.value = '';
	        element.value = '';
	        return false;
	    }
	
	    // 3. 파일명 지정
	    filename.value = file.name;
	}
	
	
	// 파일 추가
	function addFile() {
	    const fileDiv = document.createElement('div');
	    fileDiv.innerHTML =`
	        <div class="file_input">
	            <input type="text" readonly />
	            <label> 첨부파일
	                <input type="file" name="files" onchange="selectFile(this);" />
	            </label>
	        </div>
	        <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
	    `;
	    document.querySelector('.file_list').appendChild(fileDiv);
	}


	// 파일 삭제
	function removeFile(element) {
	    const fileAddBtn = element.nextElementSibling;
	    if (fileAddBtn) {
	        const inputs = element.previousElementSibling.querySelectorAll('input');
	        inputs.forEach(input => input.value = '')
	        return false;
	    }
	    element.parentElement.remove();
	}
    
    // 고정게시글 체크박스
    function setPinnedValue() {
            const checkbox = document.getElementById('pinnedCheckbox');
            const hiddenInput = document.getElementById('isPinned');
            hiddenInput.value = checkbox.checked ? 'Y' : 'N';
        }
    
    // 폼 제출 전에 값을 설정
    document.querySelector('form').addEventListener('submit', setPinnedValue);
    
    // 부서 코드 값 전달
    function setDeptCode() {
        const divisionSelect = document.getElementById('division');
        const deptCodeInput = document.getElementById('deptCode');
        deptCodeInput.value = divisionSelect.value;  // 선택된 부서 코드 전달
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