<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar align-items-stretch navbar-light flex-md-nowrap p-0">
        <span class="w-100 d-none d-md-flex d-lg-flex"></span>
        <ul class="navbar-nav border-left flex-row ">
        	<li class="nav-item border-right dropdown notifications">
            	<a class="nav-link nav-link-icon text-center" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="nav-link-icon__wrapper">
                	<i class="material-icons">mail</i>
                    <span class="badge badge-pill badge-danger">2</span>
                </div>
                </a>
            </li>
            
            <li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<img class="user-avatar rounded-circle mr-2" src="images/pettopia_logo.png" alt="User Avatar">
                	<span class="d-none d-md-inline-block">202450001 김사원</span>
               	</a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                   		<i class="material-icons">&#xE7FD;</i> 마이 페이지
                   	</a>
                   	<a class="dropdown-item" href="#">
                   		<i class="material-icons">history</i> 근태 조회
                   	</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="#">
                    	<i class="material-icons text-danger">&#xE879;</i> 로그아웃 
                    </a>
				</div>
			</li>
		</ul>
              
		<nav class="nav">
			<a href="#" class="nav-link nav-link-icon toggle-sidebar d-md-inline d-lg-none text-center border-left" data-toggle="collapse" data-target=".header-navbar" aria-expanded="false" aria-controls="header-navbar">
				<i class="material-icons">&#xE5D2;</i>
			</a>
		</nav>
	</nav>
</body>
</html>