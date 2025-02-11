<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">

<head>

    <meta charset="utf-8">
    <title>404 | pettopia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <!-- Layout config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
    <!-- Icons CSS -->
    
    <!-- Tailwind CSS -->
    

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind2.css">
</head>

<body class="flex items-center justify-center min-h-screen py-16 bg-cover bg-auth-pattern dark:bg-auth-pattern-dark font-public">

    <div class="mb-0 border-none shadow-none lg:w-[500px] card bg-white/70 dark:bg-zink-500/70">
        <div class="!px-10 !py-12 card-body">
            <a href="index">
                <img src="${pageContext.request.contextPath}/assets/images/logo-pettopia.png" alt="" class="block h-12 mx-auto dark:hidden">
            </a>
            
            <div class="mt-10">
                <img src="${pageContext.request.contextPath}/assets/images/error-404.png" alt="" class="h-64 mx-auto">
            </div>
            <div class="mt-8 text-center">
                <h4 class="mb-2 text-purple-500">접근 권한이 없습니다.</h4>
                <p class="text-slate-500">이 페이지나 기능에 접근하기 위한 권한이 없습니다.</p>
                <p class="mb-6 text-slate-500">관리자에게 문의하거나 권한을 요청해 주세요.</p>
                <a href="${pageContext.request.contextPath}/common/petTopiaMain" class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20"><i data-lucide="home" class="inline-block size-3 ltr:mr-1 rtl:ml-1"></i> <span class="align-middle">돌아가기</span></a>
            </div>
        </div>
    </div>

    <script src='assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
    <script src="assets/libs/@popperjs/core/umd/popper.min.js"></script>
    <script src="assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/prismjs/prism.js"></script>
    <script src="assets/libs/lucide/umd/lucide.js"></script>
    <script src="assets/js/tailwick.bundle.js"></script>
</body>

</html>