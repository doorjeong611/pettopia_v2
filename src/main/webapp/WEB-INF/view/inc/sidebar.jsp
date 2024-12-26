<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 현재 페이지 URL을 가져옵니다.
    var currentPath = window.location.pathname;

    // '공지사항' 메뉴 항목을 선택합니다.
    var noticeItem = $('#notice-item');
    var noticeLink = noticeItem.find('a');

    // '공지사항' 링크의 href가 현재 경로와 일치하면 'active' 클래스를 추가합니다.
    if (currentPath.endsWith(noticeLink.attr('href').split('/').pop())) {
        noticeItem.addClass('active');
    }

    // '직원' 메뉴 항목을 선택합니다.
    var empItem = $('#emp-item');
    var empLinks = empItem.find('a');

    // 각 직원 메뉴 항목에 대해, 링크의 href가 현재 경로와 일치하면 'active' 클래스를 추가합니다.
    empLinks.each(function() {
        var linkHref = $(this).attr('href');
        if (currentPath.endsWith(linkHref.split('/').pop())) {
            $(this).addClass('active');
            empItem.addClass('active');  // 드롭다운 메뉴도 활성화 상태로 만듭니다.
        }
    });
});

</script>
</head>
<body>
	<div class="main-navbar">
    	<nav class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
        	<a class="navbar-brand w-100 mr-0" href="${pageContext.request.contextPath}/home" style="line-height: 25px;">
	            <div class="d-table m-auto">
	            	<img id="main-logo" class="d-inline-block align-top mr-1" style="max-width: 50px;" src="./images/pettopia_logo.png" alt="PetTopia">
	            	<span class="d-none d-md-inline ml-1">Pet Topia</span>
	            </div>
          	</a>
            <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none">
	        	<i class="material-icons">&#xE5C4;</i>
            </a>
        </nav>
	</div>
	
    <div class="nav-wrapper">
        <ul class="nav flex-column">
        
        	<!-- 공지사항 -->
			<li class="nav-item" id="notice-item">
		        <a class="nav-link px-3" href="${pageContext.request.contextPath}/notice">
		            <i class="material-icons">campaign</i>
		            <span class="d-none d-md-inline-block">공지사항</span>
		        </a>
		    </li>
          	
			<!-- 직원 -->
			<li class="nav-item dropdown" id="emp-item">
			    <a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
			        <i class="material-icons">person</i>
			        <span class="d-none d-md-inline-block">직원</span>
			    </a>
			    <div class="dropdown-menu dropdown-menu-small">
			        <a class="dropdown-item" href="${pageContext.request.contextPath}/employee">
			            <i class="material-icons">people</i>직원 조회
			        </a>
			        <a class="dropdown-item" href="${pageContext.request.contextPath}/employee">
			            <i class="material-icons">person_add</i>직원 등록
			        </a>
			    </div>
			</li>
           
            <!-- 일정 -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="material-icons">calendar_today</i>
                    <span class="d-none d-md-inline-block">일정</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                    <a class="dropdown-item" href="#">
                        <i class="material-icons">edit_calendar</i>일정 추가
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="material-icons">calendar_month</i>캘린더
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="material-icons">event_note</i>일정 조회
                    </a>
                </div>
		    </li>
             
			<!-- 사내 게시판 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">forum</i>
                	<span class="d-none d-md-inline-block">사내 게시판</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">edit_note</i>글 작성
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">notes</i>사내 게시판
                 	</a>
				</div>
			</li>
			
			<!-- 쪽지 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">mail</i>
                	<span class="d-none d-md-inline-block">쪽지</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">forward_to_inbox</i>쪽지 쓰기
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">mark_as_unread</i>쪽지 보관함
                 	</a>
                 	<a class="dropdown-item" href="#">
                    	<i class="material-icons">delete</i>휴지통
                 	</a>
				</div>
			</li>
			
			<!-- 결재 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">description</i>
                	<span class="d-none d-md-inline-block">결재 문서</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">assignment_add</i>문서 작성
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">inventory</i>문서 보관함
                 	</a>
                 	<a class="dropdown-item" href="#">
                    	<i class="material-icons">delete</i>휴지통
                 	</a>
				</div>
			</li>

			<!-- 회의실 예약 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">groups</i>
                	<span class="d-none d-md-inline-block">회의실 예약</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">meeting_room</i>회의실 목록
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">schedule</i>예약 내역
                 	</a>
				</div>
			</li>          	

			<!-- 휴가 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">nature_people</i>
                	<span class="d-none d-md-inline-block">휴가</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">assignment_add</i>휴가 문서 작성
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">spa</i>휴가 조회
                 	</a>
				</div>
			</li>
			
			<!-- 펫 서비스 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">pets</i>
                	<span class="d-none d-md-inline-block">펫 서비스</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">forest</i>서비스 관리
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">cruelty_free</i>예약 내역
                 	</a>
				</div>
			</li>
			
			<!-- 어매니티 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">redeem</i>
                	<span class="d-none d-md-inline-block">어매니티</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">coffee</i>어매니티 관리
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">bed</i>어매니티 추가
                 	</a>
				</div>
			</li>
			
			<!-- 예약 현황 -->
          	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                	<i class="material-icons">holiday_village</i>
                	<span class="d-none d-md-inline-block">예약 관리</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">cottage</i>객실 목록
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">add_business</i>객실 추가
                 	</a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">history</i>예약 내역
                 	</a>
				</div>
			</li>
             
            <!-- 관리 -->
            <li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
	                <i class="material-icons">manage_accounts</i>
	                <span class="d-none d-md-inline-block">부서 관리</span>
                </a>
                <div class="dropdown-menu dropdown-menu-small">
                	<a class="dropdown-item" href="#">
                    	<i class="material-icons">domain</i>부서 조회
                    </a>
                    <a class="dropdown-item" href="#">
                    	<i class="material-icons">domain_add</i>부서 등록
                   	</a>
				</div>
        	</li>
		</ul>
	</div>
</body>
</html>