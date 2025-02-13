# 📝 개요
  - 프로젝트 명 : 반려동물 동반 호텔 그룹웨어 PETTOPIA<br>
  - 프로젝트 기간 :  2024-12-23 ~ 2025-02-11 <br>
  - (K-Digital Training) 클라우드 활용 자바 개발자 양성과정 86기 파이널 팀 프로젝트<br>

# 📑 서비스 설계 개요
 - <a href="https://app.luminpdf.com/viewer/6752b712f7ff78bf8b148b3e?credentials-id=e124a136-0814-4450-9acf-5ab668712655">스토리보드</a> <br>
 - <a href="https://docs.google.com/spreadsheets/d/1xCPra5FvQ-RIjDnN1FtbF3Iha-nyHkSVYMtwjZj4QUM/edit?usp=sharing">인터페이스 설계서</a>

# 🧰 개발 환경 및 기술 스택
#### LANGUAGE & SKILL
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
#### Framework
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring%20Boot&logoColor=white)
#### DATABASE
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
#### LIBLARY
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![JSTL](https://img.shields.io/badge/jstl-E4F7BA?style=for-the-badge)
![Lombok](https://img.shields.io/badge/Lombok-FFA7A7?style=for-the-badge)
![MyBatis](https://img.shields.io/badge/MyBatis-47C83E?style=for-the-badge)
#### WAS Apache
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat%2010-23F8DC75.svg?style=for-the-badge&logo=apache%20tomcat%2010&logoColor=black)
#### TOOL
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)
![Heidi](https://img.shields.io/badge/Heidi%20SQL-6B9900?style=for-the-badge)
![Spring Tool Suite 4](https://img.shields.io/badge/Spring%20Tool%20Suite%204-8A2BE2?style=for-the-badge)
![Google Spread Sheet](https://img.shields.io/badge/Google%20Spread%20Sheet-4285F4?style=for-the-badge&logo=google&logoColor=white)


# 📚 데이터 베이스 구조
<img src="https://github.com/user-attachments/assets/465928d6-d102-4adf-b7d6-7a9a30ae8d30"  width="700" height="600"/>


# 🗂️ 주요 기능
이 사이트는 반려동물 동반 호텔을 위한 그룹웨어 서비스입니다. <br>
이 그룹웨어를 통해 전자결재, 일정 관리, 쪽지, 사내 커뮤니티, 직원 및 고객 관리, 매출 통계 등을 활용하여 효율적인 운영과 관리가 가능합니다.

<details>
<summary><b>각 기능 상세보기</b></summary>
<div markdown="1">

|기능|설명|
|---|---|
|로그인 / 비밀번호 찾기| - 00000 <br> - 00000 <br> - 00000 |
|메인페이지| - 로그인한 사원과 관련된 정보 및 공지사항, 통계(Chart.JS)등 출력 <br> - 출,퇴근 기록, 결재 대기 문서, 읽지 않은 메시지, 최신 공지사항 및 통계 |
|공지사항| - 전체 및 부서별 공지사항 출력  <br> - 권한이 있는 직원(관리자:ROLE_ADMIN)만 공지사항 작성 가능 <br> - CKEditor를 이용하여 공지사항 작성 |
|사내 익명 게시판| - 말머리별 게시글 출력 <br>  - 공지사항 작성, 수정, 삭제 <br> -댓글 작성 및 삭제  |
|쪽지| - 메시지 목록과 함께 읽음 유무 출력 <br> - 휴지통에서 영구 삭제, 복원 가능 |
|결재| - 전체, 수신, 발신, 임시 보관함별 결재 문서 출력 <br> - 결재선별 결재 상태, 최종 결재 상태 출력 <br> - 휴지통에서 영구 삭제, 복원 가능 <br> - 결재 유형에 따른 양식 작성 및 결재선 선택 <br> - 결재자 선택시 작성자와 결재자 중복 선택 불가 <br> - 승인 및 반려, 결재 반려시 반려사유 작성  |
|휴가 | - 승인된 휴가 내역 출력 <br> - 날짜별 휴가 조회 가능 <br> - 총 연차, 사용 연차, 잔여 연차 출력|
|일정 | - Google FullCalendar를 이용한 시간대별 일정 등록, 수정, 삭제<br> - 카테고리별, 월간, 주간, 일간 일정 출력 <br> - 드래그로 일정 날짜 변경  |
|회의실 | - 회의실 조회, 등록, 수정, 삭제  <br> - 회의실 예약 내역 조회, 예약 등록  <br> - 회의실, 날짜 선택시 해당 회의실의 예약 가능 시간대 조회 |
|고객 | - 등록된 고객 조회 |
|객실 예약|- 전체 및 카테고리별 객실 조회, 등록, 수정, 삭제 <br> - 객실 예약 내역 출력 <br> - 예약자 이름 검색으로 예약 내역 출력 <br> - 예약 추가  |
|CUSTOMER - 결제| - 선택한 장바구니에 대한 상품 정보 리스트와 총 결제 금액 출력 <br> - 결제 기능 구현 및 접근이 직관적이도록 설계 <br> - 결제 완료 시, 장바구니 건수를 재계산하여 세션에 반영|
|CUSTOMER - 회원 결제 이력|  - 로그인한 회원의 주문 목록을 최신순으로 조회할 수 있도록 리스트 및 페이징 구현 <br> - 결제상태(결제취소, 배송완료) 수정 기능 접근이 직관적이도록 설계 |
|CUSTOMER - 회원 가입| - 이메일 중복 검사 기능 구현 및 유효성 검사(ID 중복 확인, 성별, 비밀번호, 생일) 기능 구현 <br>  - 회원 등록 기능 구현|
|CUSTOMER - 개인정보 관리 페이지|  - 비밀번호 변경, 회원 탈퇴 기능 구현 및 회원정보 페이지에서 접근이 직관적이도록 설계 <br> - 로그인한 회원의 기본 정보 출력 <br> - 비밀번호 확인 기능 구현|
</div>
</details>



# 🧑‍🤝‍🧑 Collaborators
| <a href="https://github.com/KHyun27">김동현</a>| <a href="https://github.com/KHyun27">김문정</a>| <a href="https://github.com/ES-Im">김은서</a>|
|---|---|---|
|사진| | |
|관리자 페이지 중심 MVC 구현|공용 페이지 중심 MVC 구현|회원 페이지 중심 MVC 구현|
	
