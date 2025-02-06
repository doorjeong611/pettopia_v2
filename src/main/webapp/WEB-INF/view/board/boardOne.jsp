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
</head>

<style>
    .boardTitleBox {
        width: 70%;
        margin: 10px auto;
        text-align: left;
    }

    .boardHeaderBox {
        width: 70%;
        margin: 0 auto;
    }

    .boardHeaderBox>div {
        width: 32%;
        margin: 1% 1%;
        float: left;
    }

    .boardHeaderBox>div>label {
        padding-bottom: 2%;
    }
	.boardContentBox > label{
		padding-bottom: 1%;
	}
	.boardTitleBox > label{
	 	padding-bottom: 1%;
	}
    .boardHeaderBox>div:first-child {
        margin-left: 0;
    }

    .boardHeaderBox>div:last-child {
        margin-right: 0;
    }

    .boardContentBox {
        width: 70%;
        margin: 0 auto;
    }

    .boardContentBox>textarea {
        height: 500px;
        text-align: left;
        resize: none;
    }

    .boardContentBox .btnBox {
        width: 50%;
        display: flex;
        justify-content: flex-end;
        margin-top: 2%;
    }
	 .boardContentBox .btnBox div{
        margin:0 1%;
    }
	

    .contentFooterBox {
        width: 100%;
        display: flex;
        justify-content: flex-end;
    }

  
   	.boardFileBox {width: 100%; margin: 1% 0;}
   	.boardFileBox > img {margin: 0 auto; width: 80%;}
   	
   	
   	.commentMainBox {width: 70%; height: auto; margin: 3% auto;}
	.commentBox, .replyBox {
    width: 100%;
    height: auto;
    margin: 0 auto;
    padding: 1%;
}

	.commentBox textarea, .replyBox textarea {
	  height: 100px;
      resize: none; 
	}
	.commentBox button {float: right; margin-right: 1%; margin-top: 1%;}
	.commentBox .btn {float: right; margin-right: 1%; margin-top: 1%;}
	.lineBox {width: 100%; border: 1px solid #f1f5f9; margin: 0 auto;}
	
	.replyBox {
	   width: 100%;
	   height: auto;
	   margin: 0 auto;
	   }
	.commentMainBox .replyBox {padding: 3%; width: 100%; height: 100%; margin: 0 auto;}
	.replyBox button {float: right; margin-right: 2%; margin-top: 1%;}
	.replyBox .btn {float: right; margin-top: 1%;}
	.replyBox textarea {
		height: 120px;
		text-align: left;
	       resize: none;
	    }
	  
	.replyBox .deleteCommentBox {float: right;}  
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
                            <h5 class="text-16">게시글 상세페이지</h5>
                        </div>

                        <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                            <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1 before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                                <a href="${pageContext.request.contextPath}/board/boardList" class="text-slate-400 dark:text-zink-200">사내 게시판</a>
                            </li>
                            <li class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1 before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                                <a href="${pageContext.request.contextPath}/board/boardList" class="text-slate-400 dark:text-zink-200">게시판 리스트</a>
                            </li>
                            <li class="text-slate-700 dark:text-zink-100">
                                게시글&nbsp;No.${boardNo}
                            </li>
                        </ul>
                    </div>
				<!-- Start card -->
                    <div class="card">
                   <!-- Start card-body -->
                        <div class="card-body">
                            <div class="boardHeaderBox">
                                <div>
                                    <label for="category_input" class="inline-block text-base">말머리</label>
                                    <input type="text" class="form-input" id="category_input" name="category" 
       value="${boardCategory == 'SG' ? '건의사항' 
              : boardCategory == 'DS' ? '토론' 
              : boardCategory == 'CT' ? '잡담' 
              : boardCategory == 'IN' ? '정보' 
              : boardCategory == 'QA' ? '질문' 
              : boardCategory == 'CP' ? '칭찬' 
              : boardCategory == null ? '전체' : ''}" readonly>
                                </div>
                                 <div>
                                    <label for="view_input" class="inline-block text-base">조회 수</label>
                                    <input type="text" class="form-input" id="view_input" name="view" value="${boardMap.boardView}" readonly>
                                </div>
                                <div>
                                    <label for="creatDateTime_input" class="inline-block text-base">작성일시</label>
                                    <input type="text" class="form-input" id="creatDateTime_input" readonly value="${fn:substring(boardMap.createDatetime, 0, 10)}">
                                </div>
                            </div>

                            <div class="boardTitleBox">
                           	 	<label for="boardTitle_input" class="inline-block text-base">제목</label>
                                <input id="boardTitle_input" type="text" class="form-input" value="${boardMap.boardTitle}" readonly onfocus='this.blur();'>
                            </div>

                            <div class="boardContentBox">
							    <label for="boardContent_input" class="inline-block text-base">내용</label>
							    <textarea id="boardContent_input" class="form-input" readonly onfocus='this.blur();'>${boardMap.boardContent}</textarea>
							
							    <c:if test="${not empty boardMap.fileName}">
							        <div class="boardFileBox w-full h-[500px] overflow-hidden relative">
							            <img src="${pageContext.request.contextPath}/boardFile/${boardMap.fileName}" alt="게시글 이미지" class="w-full h-full object-contain object-center">
							        </div>
							    </c:if>
							    <!-- 버튼 박스 모음 -->
							    <div>
	                                <div class="contentFooterBox">
	                                    <!-- 버튼 박스 -->
	                                    <c:if test="${empNo == boardMap.boardWriterNo}">
	                                        <div class="btnBox">
	                                            <div class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600" ><a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${boardMap.boardNo}">수정하기</a></div>
	                                            <div class="text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">
	                                            	<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${boardMap.boardNo}">삭제하기</a></div>
	                                            <div class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100"><a href="${pageContext.request.contextPath}/board/boardList">목록</a></div>
	                                        </div>
	                                    </c:if>
	                                    <c:if test="${empNo != boardMap.boardWriterNo}">
	                                        <div class="btnBox">
	                                            <div class="text-green-500 bg-white border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100"><a href="${pageContext.request.contextPath}/board/boardList">목록</a></div>
	                                        </div>
	                                    </c:if>
	                                </div>
	                            </div>
							</div>



							
							
                        </div>
                       <!-- End card-body -->
	                   	   
          
                   <!-- Start card-body -->
                  <div class="card-body">
    <div class="lineBox"></div>

    <!-- 댓글 목록 (c:forEach) 부분 -->
  <c:forEach var="c" items="${comment}">
   <c:if test="${empNo == c.commentWriterNo}">
    <div class="commentMainBox">
        <div class="lineBox"></div>
        <div class="replyBox">
            <textarea class="form-input" name="commentContent" readonly>${c.commentContent}</textarea>
            <div class="deleteCommentBox text-red-500 bg-white border-red-500 btn hover:text-white hover:bg-red-600 hover:border-red-600 focus:text-white focus:bg-red-600 focus:border-red-600 focus:ring focus:ring-red-100 active:text-white active:bg-red-600 active:border-red-600 active:ring active:ring-red-100">
                <a href="${pageContext.request.contextPath}/board/removeComment?boardNo=${boardMap.boardNo}&commentNo=${c.commentNo}">삭제하기</a>
            </div>
        </div>
    </div>
</c:if>
    <c:if test="${empNo != c.commentWriterNo}">
        <div class="commentMainBox">
            <div class="lineBox"></div>
            <div class="replyBox">
                <textarea class="form-input" name="commentContent" readonly>${c.commentContent}</textarea>
            </div>
        </div>
    </c:if>
</c:forEach>



    <div class="lineBox"></div>

    <!-- 댓글 작성 폼 -->
    <div class="commentMainBox">
        <div class="commentBox">
            <form id="formCategory" action="${pageContext.request.contextPath}/board/boardComment" method="post">
                <input type="hidden" name="boardNo" value="${boardNo}">
                <textarea class="form-input" name="commentContent" placeholder="댓글을 작성하세요."></textarea>
                <button class="mr-1 bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600" type="submit">댓글 작성</button>
            </form>
        </div>
    </div>
</div>

                        
	                   	   <!-- Start Footer -->
					        <footer class="ltr:md:left-vertical-menu rtl:md:right-vertical-menu group-data-[sidebar-size=md]:ltr:md:left-vertical-menu-md group-data-[sidebar-size=md]:rtl:md:right-vertical-menu-md group-data-[sidebar-size=sm]:ltr:md:left-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:md:right-vertical-menu-sm absolute right-0 bottom-0 px-4 h-14 group-data-[layout=horizontal]:ltr:left-0 group-data-[layout=horizontal]:rtl:right-0 left-0 border-t py-3 flex items-center dark:border-zink-600">
					            <c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
					        </footer>
	       				   <!-- End Footer -->
                    </div>
                   <!-- End card -->
                </div>
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
    </div>
<c:import url="/WEB-INF/view/inc/customizerButton.jsp"></c:import>
<script src="${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/dropzone/dropzone-min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/form-file-upload.init.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/dashboards-ecommerce.init.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>