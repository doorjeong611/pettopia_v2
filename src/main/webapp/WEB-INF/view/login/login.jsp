<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>

    <meta charset="utf-8">
    <title>Pettopia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/pettopia_favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Icons CSS -->
    
    <!-- Tailwind CSS -->
    
    
    <!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
</head>

<style>

	/* 인덱스 폰트 */
@font-face {
    font-family: 'PTBandocheB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
	.title-font{
		font-family: 'PTBandocheB' , 'cursive';
		font-weight: 400;
	}

	
</style>






<script type="text/javascript">
$(document).ready(function() {
	
    var message = "${tempmsg}";
    console.log('msg : '+message);
    if (message) {
        alert(message);
    }
    
    var msg = '${Loginmsg}';    
    console.log('msg : '+msg);
    if (msg) {
        alert(msg);
        
    }
});
</script>

<body class="flex items-center justify-center min-h-screen py-16 lg:py-10 bg-slate-50 dark:bg-zink-800 dark:text-zink-100 font-public">
	<c:remove var="Loginmsg" scope="session"/> <!-- Loginmsg 삭제 -->
    <div class="relative">
        <div class="absolute hidden opacity-50 ltr:-left-16 rtl:-right-16 -top-10 md:block">
            <svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 125 316" width="125" height="316">
                <title>&lt;Group&gt;</title>
                <g id="&lt;Group&gt;">
                    <path id="&lt;Path&gt;" class="fill-custom-100/50 dark:fill-custom-950/50" d="m23.4 221.8l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-100 dark:fill-custom-950" d="m31.2 229.6l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200/50 dark:fill-custom-900/50" d="m39 237.4l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200/75 dark:fill-custom-900/75" d="m46.8 245.2l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200 dark:fill-custom-900" d="m54.6 253.1l-1.3-3.1v-315.4l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300/50 dark:fill-custom-800/50" d="m62.4 260.9l-1.2-3.1v-315.4l1.2 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300/75 dark:fill-custom-800/75" d="m70.3 268.7l-1.3-3.1v-315.4l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300 dark:fill-custom-800" d="m78.1 276.5l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400/50 dark:fill-custom-700/50" d="m85.9 284.3l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400/75 dark:fill-custom-700/75" d="m93.7 292.1l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400 dark:fill-custom-700" d="m101.5 299.9l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-500/50 dark:fill-custom-600/50" d="m109.3 307.8l-1.3-3.1v-315.4l1.3 3.1z" />
                </g>
            </svg>
        </div>
        
        <div class="absolute hidden -rotate-180 opacity-50 ltr:-right-16 rtl:-left-16 -bottom-10 md:block">
            <svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 125 316" width="125" height="316">
                <title>&lt;Group&gt;</title>
                <g id="&lt;Group&gt;">
                    <path id="&lt;Path&gt;" class="fill-custom-100/50 dark:fill-custom-950/50" d="m23.4 221.8l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-100 dark:fill-custom-950" d="m31.2 229.6l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200/50 dark:fill-custom-900/50" d="m39 237.4l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200/75 dark:fill-custom-900/75" d="m46.8 245.2l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-200 dark:fill-custom-900" d="m54.6 253.1l-1.3-3.1v-315.4l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300/50 dark:fill-custom-800/50" d="m62.4 260.9l-1.2-3.1v-315.4l1.2 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300/75 dark:fill-custom-800/75" d="m70.3 268.7l-1.3-3.1v-315.4l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-300 dark:fill-custom-800" d="m78.1 276.5l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400/50 dark:fill-custom-700/50" d="m85.9 284.3l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400/75 dark:fill-custom-700/75" d="m93.7 292.1l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-400 dark:fill-custom-700" d="m101.5 299.9l-1.3-3.1v-315.3l1.3 3.1z" />
                    <path id="&lt;Path&gt;" class="fill-custom-500/50 dark:fill-custom-600/50" d="m109.3 307.8l-1.3-3.1v-315.4l1.3 3.1z" />
                </g>
            </svg>
        </div>
 
        <div class="mb-0 w-screen lg:mx-auto lg:w-[500px] card shadow-lg border-none shadow-slate-100 relative">
            <div class="!px-10 !py-12 card-body">
               
                    <img src="./assets/images/logo-pettopia.png" alt="" class="hidden h-12 mx-auto dark:block">
                    <img src="./assets/images/logo-pettopia.png" alt="" class="block h-12 mx-auto dark:hidden">
                
        
                <div class="mt-8 text-center">
                    <h4 class="mb-1 text-custom-500 dark:text-custom-500 ">PETTOPIA</h4>
                    
                </div>
                <c:if test="${msg != null}">
	                <div class="mt-8 text-center">
	                    <h4 class="mb-1 text-red-500">${Loginmsg}</h4>
	                    <c:remove var="Loginmsg" scope="session"/>
	                </div>
        		</c:if>
                <form action="${pageContext.request.contextPath}/loginSuccess" method="post" class="mt-10" id="signInForm">
                    
                    <div class="hidden px-4 py-3 mb-3 text-sm text-green-500 border border-green-200 rounded-md bg-green-50 dark:bg-green-400/20 dark:border-green-500/50" id="successAlert">
                        You have <b>successfully</b> signed in.
                    </div>
                    <div class="mb-3">
                        <label for="username" class="title-font text-base font-bold inline-block mb-2 ">사번</label>
                        <input type="text" id="username" name="empNo" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="사번 입력">
                        <div id="username-error" class="hidden mt-1 text-sm text-red-500">사번을 입력해주세요.</div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="title-font text-base font-bold inline-block mb-2 " >비밀번호</label>
                        <input type="password" id="password" name="empPw" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="비밀번호 입력">
                        <div id="password-error" class="hidden mt-1 text-sm text-red-500">비밀번호를 입력해주세요.</div>
                    </div>
                    <div>
                        <div class="flex items-center gap-2">
                            <input type="checkbox" name="remember-me" id="checkboxDefault1" class="title-font border rounded-sm appearance-none size-4 bg-slate-100 border-slate-200 dark:bg-zink-600 dark:border-zink-500 checked:bg-custom-500 checked:border-custom-500 dark:checked:bg-custom-500 dark:checked:border-custom-500 checked:disabled:bg-custom-400 checked:disabled:border-custom-400" value="">
                            <label for="checkboxDefault1" class="title-font text-base inline-block align-middle cursor-pointer" >사번 기억하기</label>
                        </div>
                        <div id="remember-error" class="hidden mt-1 text-sm text-red-500">Please check the "Remember me" before submitting the form.</div>
                        
                    </div>
                    
                    <div class="mt-8 pt-3">
                    	<div>
                        	<button type="button" id="loginBtn" class=" w-full title-font text-white bg-custom-600 btn border-custom-500 hover:text-custom-600 hover:bg-white hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">로그인</button>
						</div>	                
                    	<div class="mt-4 pt-3 text-center">
                        	<!-- 임시 비밀번호 발급받기 버튼 -->
	                		<a href="${pageContext.request.contextPath}/sendTempPassword"> <span class="title-font text-slate-400 hover:text-slate-700 text-base">비밀번호 찾기</span></a>
                        </div>
                    </div>
                    	
                    <!-- 로그인 정보 버튼 -->
				    <div class="text-end">
				       <button> 
                            <span id="loginInfoBtn" class="title-font text-custom-500 hover:text-custom-600 text-base" style="cursor:pointer;">
                                로그인 정보
                            </span>
                        </button>
				    </div>
				    
				    <!-- 모달 창 -->
				    <div class="title-font" id="loginModal" style="display:none; position:fixed; z-index:1; left:0; top:0; width:100%; height:100%; background-color: rgba(0, 0, 0, 0.4);">
				        <div style="background-color: white; margin: 10% auto; border-radius: 10px; width: 80%; max-width: 500px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
				            <div class="p-3 bg-slate-100" style="border-top-left-radius: 12px; border-top-right-radius: 12px;">
							    <span id="closeBtn" style="color:#aaa; font-size:28px; font-weight:bold; float:right; cursor:pointer;">&times;</span>
							    <h3 class="p-1" style="margin-top: 0; color: #000;">로그인 계정 정보</h3>
							</div>
				            <div class="p-3 px-5">
					            <div class="user-info p-3" id="user1" data-username="202300001" data-password="aaaa1234!">
					                <p class="text-custom-500">1. 송혜교 (경영부서 / 조직경영팀 / 사장)</p>
					                <p><span class="">사번</span> : <span>202300001</span></p> 
					                <p><span class="">비밀번호</span> : aaaa1234!</p>
					                <p class="text-slate-600" style="font-size: small; font-family: initial; font-weight: initial;">
					                	* 모든 권한이 있는 사장 계정
					                </p>
					            </div>
					            <hr>
					            <div class="user-info p-3" id="user1" data-username="202500120" data-password="aaaa1234!">
					                <p class="text-custom-500">2. 김지민 (인사부서 / 인사팀 / 부장)</p>
					                <p><span class="">사번</span> : <span>202500120</span></p> 
					                <p><span class="">비밀번호</span> : aaaa1234!</p>
					                <p class="text-slate-600" style="font-size: small; font-family: initial; font-weight: initial;">
					                	* 인사부, 팀장 권한이 있는 인사부 팀장 계정
					                </p>
					            </div>
					            <hr>
					            <div class="user-info p-3" id="user1" data-username="202500070" data-password="!pettopia1234">
					                <p class="text-custom-500">3. 김채고 (영업부서 / 해외영업팀 / 부장)</p>
					                <p><span class="">사번</span> : <span>202500070</span></p> 
					                <p><span class="">비밀번호</span> : !pettopia1234</p>
					                <p class="text-slate-600" style="font-size: small; font-family: initial; font-weight: initial;">
					                	* 팀장 권한이 있는 계정
					                </p>
					            </div>
					            <hr>
					            <div class="user-info p-3" id="user1" data-username="202500138" data-password="!pettopia1234">
					                <p class="text-custom-500">4. 박지훈 (법무부서 / 소송 및 분쟁 해결팀 / 사원)</p>
					                <p><span class="">사번</span> : <span>202500138</span></p> 
					                <p><span class="">비밀번호</span> : !pettopia1234</p>
					                <p class="text-slate-600" style="font-size: small; font-family: initial; font-weight: initial;">
					                	* 아무 권한이 없는 일반 사원 계정
					                </p>
					            </div>
					            <hr>
					            <div class="pt-3">
					                <p class="text-red-500" style="font-size:small; font-family: initial; font-weight: initial;">* 클릭 시 해당 계정으로 로그인 할 수 있습니다.</p>
					            </div>
				            </div>
				        </div>
				    </div>
   
                </form>
            </div>
        </div>
    </div>

    <script src='${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/libs/@popperjs/core/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/prismjs/prism.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/lucide/umd/lucide.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tailwick.bundle.js"></script>
   <!--  <script src="${pageContext.request.contextPath}/assets/js/pages/auth-login.init.js"></script> --> <!-- 아이디, 비밀번호 유효성 검사 js -->

<script>
$(document).ready(function() {
    /* 페이지가 로드되면 localStorage에서 empNo를 확인하여, 값이 있으면 사번 입력란과 체크박스를 설정 */
    const rememberedEmpNo = localStorage.getItem("rememberEmpNo");
    if (rememberedEmpNo) {
        $("#username").val(rememberedEmpNo);
        $("#checkboxDefault1").prop("checked", true);
    }

    /* 폼이 제출될 때 체크박스 상태에 따라 localStorage에 empNo 저장/삭제 */
    $("#signInForm").submit(function(event) {
        const empNo = $("#username").val();
        const rememberMe = $("#checkboxDefault1").prop("checked");
        console.log('empNo : ' + empNo);

        if (rememberMe) {
            localStorage.setItem("rememberEmpNo", empNo); // 사번을 로컬스토리지에 저장
        } else {
            localStorage.removeItem("rememberEmpNo"); // 체크 해제 시 로컬스토리지에서 사번 삭제
        }
    });

    /* 로그인 버튼 클릭 시 유효성 검사 */
    $('#loginBtn').click(function() {
        if ($('#username').val() == null || $('#username').val() == '') {
            alert('사번을 입력하세요.');
            $('#username').focus();
            return;
        }
        if ($('#password').val() == null || $('#password').val() == '') {
            alert('비밀번호를 입력하세요.');
            $('#password').focus();
            return;
        }
        $('#signInForm').submit();
    });
    
    /* 엔터키 눌렀을 때 유효성 검사 */
    $(document).keypress(function(event) {
        if (event.which == 13) {  // 엔터키 코드
            if ($('#username').val() == null || $('#username').val() == '') {
                alert('사번을 입력하세요.');
                $('#username').focus();
                return false;
            }
            if ($('#password').val() == null || $('#password').val() == '') {
                alert('비밀번호를 입력하세요.');
                $('#password').focus();
                return false;
            }
            $('#signInForm').submit();
        }
    });
    
    
 // 로그인 정보 버튼 클릭 시 모달 열기
    $('#loginInfoBtn').click(function() {
        $('#loginModal').fadeIn(); // 모달 열기 (페이드 인 효과)
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $('#closeBtn').click(function() {
        $('#loginModal').fadeOut(); // 모달 닫기 (페이드 아웃 효과)
    });

    // 모달 밖을 클릭하면 모달 닫기
    $(window).click(function(event) {
        if ($(event.target).is('#loginModal')) {
            $('#loginModal').fadeOut(); // 모달 닫기
        }
    });
    
 	// 사용자 정보를 클릭하면 input 필드에 값 입력
    $('.user-info').click(function() {
        var username = $(this).data('username');
        var password = $(this).data('password');

        // 사번과 비밀번호를 input에 채워넣기
        $('#username').val(username);
        $('#password').val(password);

        // 모달 닫기
        $('#loginModal').fadeOut();
    });
    
    
});


</script>




</body>

</html>