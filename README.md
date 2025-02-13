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
그룹웨어를 통해 전자결재, 일정 관리, 쪽지, 사내 커뮤니티, 직원 및 고객 관리, 매출 통계 등을 활용하여 효율적인 운영과 관리가 가능합니다.

<details>
<summary><b>각 기능 상세보기</b></summary>
<div markdown="1">

|기능|설명|
|---|---|
|로그인 / 비밀번호 찾기| - 사번과 비밀번호를 이용한 로그인 <br> - 사번 기억하기를 통한 사번 기억 <br> - 비밀번호 찾기를 통해 사번과 이메일의 정보가 일치 시 해당 이메일로 임시 비밀번호 전송 |
|메인페이지| - 로그인한 사원과 관련된 정보 및 공지사항, 통계(Chart.JS)등 출력 <br> - 출,퇴근 기록, 결재 대기 문서, 읽지 않은 메시지, 최신 공지사항 및 통계 |
|공지사항| - 전체 및 부서별 공지사항 출력  <br> - 권한이 있는 직원(관리자:ROLE_ADMIN)만 공지사항 작성 가능 <br> - CKEditor를 이용하여 공지사항 작성 |
|사내 익명 게시판| - 말머리별 게시글 출력 <br>  - 공지사항 작성, 수정, 삭제 <br> -댓글 작성 및 삭제  |
|쪽지| - 메시지 목록과 함께 읽음 유무 출력 <br> - 휴지통에서 영구 삭제, 복원 가능 |
|결재| - 전체, 수신, 발신, 임시 보관함별 결재 문서 출력 <br> - 결재선별 결재 상태, 최종 결재 상태 출력 <br> - 휴지통에서 영구 삭제, 복원 가능 <br> - 결재 유형에 따른 양식 작성 및 결재선 선택 <br> - 결재자 선택시 작성자와 결재자 중복 선택 불가 <br> - 승인 및 반려, 결재 반려시 반려사유 작성  |
|휴가 | - 승인된 휴가 내역 출력 <br> - 날짜별 휴가 조회 가능 <br> - 총 연차, 사용 연차, 잔여 연차 출력|
|일정 | - Google FullCalendar를 이용한 시간대별 일정 등록, 수정, 삭제<br> - 카테고리별, 월간, 주간, 일간 일정 출력 <br> - 드래그로 일정 날짜 변경  |
|회의실 | - 회의실 조회, 등록, 수정, 삭제  <br> - 회의실 예약 내역 조회, 예약 등록  <br> - 회의실, 날짜 선택시 해당 회의실의 예약 가능 시간대 조회 |
|고객 | - 등록된 고객 조회 |
|객실 예약 |- 전체 및 카테고리별 객실 조회, 등록, 수정, 삭제 <br> - 객실 예약 내역 출력 <br> - 예약자 이름 검색으로 예약 내역 출력 <br> - 예약 추가  |
|펫 서비스 | - 펫 서비스 조회, 등록, 삭제 <br> - 서비스명으로 서비스 출력 <br> - 전체 및 예약자명 펫서비스 내역 조회 <br> - 당일 기준 예약 상태 관리(취소, 완료, 노쇼) | 
|직원 | - 전체 및 부서별 직원 근태 상태 출력 <br> - 당일 근태상태별 직원수 조회 <br> - Gridjs를 이용하여 전체, 검색 직원 조회 <br> - 권한이 있는 직원(ROLE_ADMIN, HR)은 재직 상태별 직원 조회 가능, 그 외 부서별 직원만 조회 가능 <br> - 직원 상세 조회 <br> - 권한이 있는 직원(ROLE_ADMIN, HR)만 직원 상세보기에서 소속부서, 직급, 재직상태 변경 가능  <br> - 권한이 있는 직원(ROLE_ADMIN)만 직원 등록 가능 <br> - 직원 등록시 주소는 Daum 주소 API 사용 <br> - 직원 등록시 등록된 직원에게 사번과 임시비밀번호가 등록된 메일로 전송 |
|부서 | - 모든 부서 및 선택 부서별 소속 팀 출력 <br>  - 부서 및 팀 등록, 수정, 삭제 <br> - 부서 및 팀 등록, 수정 시 중복 검사 진행 <br> - BALKAN orgchart js를 이용하여 선택된 하위팀의 조직도 출력 |
|마이페이지 | - 로그인 사원의 개인 정보 출력 <br> - Gridjs를 이용한 로그인 사원의 근태기록 출력 <br> - 서명 이미지 및 SignaturePadjs를 이용한 서명 등록, 삭제  <br> - 로그인 직원의 개인 정보 및 프로필 사진 수정 <br> - 직원 개인정보 수정 시 주소는 Daum 주소 API 사용  <br> - 수정 시 재로그인 요청|
</div>
</details>



# 🧑‍🤝‍🧑 Collaborators
| <a href="https://github.com/KHyun27">김동현</a>| <a href="https://github.com/KHyun27">김문정</a>| <a href="https://github.com/ES-Im">김은서</a>|
|---|---|---|
|사진| | |
|관리자 페이지 중심 MVC 구현|공용 페이지 중심 MVC 구현|회원 페이지 중심 MVC 구현|
	
