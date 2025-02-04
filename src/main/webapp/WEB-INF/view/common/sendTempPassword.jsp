<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<body class="flex items-center justify-center min-h-screen py-16 lg:py-10 bg-slate-50 dark:bg-zink-800 dark:text-zink-100 font-public">

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
                    <h4 class="mb-1 text-custom-500 dark:text-custom-500">PETTOPIA</h4>
                    
                </div>

        
                <form action="${pageContext.request.contextPath}/sendTempPassword" method="post" class="mt-10" id="sendTempPwForm">
                    
                   
                    <div class="mb-3">
                        <label for="username" class="inline-block mb-2 text-base font-medium">사번</label>
                        <input type="text" id="username" name="empNo" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="사번 입력">
                        <div id="username-error" class="hidden mt-1 text-sm text-red-500">사번을 입력해주세요.</div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="inline-block mb-2 text-base font-medium">이메일</label>
                        <input type="email" id="email" name="empEmail" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="이메일 입력">
                        <div id="password-error" class="hidden mt-1 text-sm text-red-500">이메일을 입력해주세요.</div>
                    </div>
                    
                    <div class="mt-10 flex justify-end gap-2">
                    	<div>
                        	<button type="button" id="sendTempPwBtn" class="bg-white text-custom-500 btn border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100">임시 비밀번호 발급</button>
                    	</div>
                    	<div>
                    		<a href="${pageContext.request.contextPath}/loginForm"><button type="button" class="mr-1 bg-white text-green-500 border-green-500 btn hover:text-white hover:bg-green-600 hover:border-green-600 focus:text-white focus:bg-green-600 focus:border-green-600 focus:ring focus:ring-green-100 active:text-white active:bg-green-600 active:border-green-600 active:ring active:ring-green-100">홈으로</button></a>
                    	</div>
                    </div>
    
                </form>
            </div>
        </div>
    </div>

<!-- loading overlay -->
 		<div id="loading-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 9999; align-items: center; justify-content: center;">
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 0s; margin-right: 10px;"></div>
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 1.5s; margin-right: 10px;"></div> 
		  	<div class="inline-flex rounded-full opacity-75 size-6 animate-bounce bg-slate-400 " style="animation-delay: 2s; margin-right: 10px;"></div> 
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
window.onload = function() {
    var message = "${msg}";
    if (message) {
        alert(message);
    }
}





$('#sendTempPwBtn').click(function(event) {
	if($('#username').val() == ''){
		alert('사번을 입력해주세요.');
		$('#username').focus();
		event.preventDefault(); /*  폼 제출 막기 */
		return;
	}
	
	 /*  이메일 유효성 검사 */
	const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   
	
	if($('#email').val() == ''){
		alert('이메일을 입력해주세요.');
		$('#email').focus();
		event.preventDefault(); /*  폼 제출 막기 */
		return;
		
	}else if(emailTest.test($('#email').val()) == false){ /* 이메일 정규식 검사 */
		alert('이메일형식이 올바르지 않습니다.');
		$('#email').focus();
		event.preventDefault(); /*  폼 제출 막기 */
    	return;
	}	
	
	
	console.log('overlay 시작');
    $('#loading-overlay').css('display', 'flex');   /* 로딩 화면 표시 */
	
	
	
	 $('#sendTempPwForm').submit()    /* 모두 통과시 제출 */ 
	
});
</script>



</body>

</html>