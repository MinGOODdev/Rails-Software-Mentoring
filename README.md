# Software Mentoring System
## TODO
* ~~보고서 다운로드 시 파일 이름에 학기도 포함시키기~~
* ~~멘토 권한은 멘티 신청을 할 수 없게 하기~~
* ~~관리자 권한의 사용자(학생회장단)이 멘토 신청 후 멘토 승인시 권한 관리자로 유지시키기~~
* ~~멘티 신청 선착순 처리~~
* 체크박스 전체선택 기능 추가하기
* 시간 설정해서 그 시간에 멘토 신청, 멘티 신청 활성화 비활성화 되게 하기
* Mentoring End 하면 관리자 아이디 빼고 권한 다 2로 만들기
* if문 중첩 3개 이상 case-when으로 바꾸기
* 삭제를 할 경우에는 한번 더 확인하기
* 파일 업로드할 때 선택된 파일 없으면 버튼 안 보이게 하기 (AJAX...)
* Flash Message (보고서 업로드, )
* MentorRoom Table reportOk column이 필요없나? 이건 일단 있어도 문제는 없으니 나중에 생각해보기
* 예외 처리 하기

---

## API arrangement
### Common
설명 | 요청 url
--------|-------
회원가입 | /users/sign_up
로그인 | /users/sign_in
로그아웃 | /users/sign_out
회원 정보 수정 | /users/edit

### General User (authorization == '2')
* 공지 R
    * /notices/index
    * /notices/show/:notice_id
* 멘토 신청 C (/students/applyMentorGet & /students/applyMentorPost)
* 멘토 신청 U (/students/applyMentorEdit & /students/applyMentorUpdate)
* 멘토 신청 D (/students/applyMentorDelete)
* 멘토방 R
    * /students/findAllRooms
    * /students/findOneRoom/:mentor_room_id
* 해당 멘토방 멘티 신청 C (/students/applyMentee/:mentor_room_id)
* 해당 멘토방 멘티 신청 D (/students/deleteApplyMentee/:user_id)
* 소속된 멘토방 R (/students/myMentorRoom)
* 시간표 CU (/time/timeTableGet & /time/timeTablePost)

### Mentor User (authorization == '1')
* 내 멘토방 멘티 D (/mentors/deleteMyMentee/:user_id)
* 보고서 CU
    * /mentors/midReportUpdate
    * /mentors/finalReportUpdate
    
### Admin User (authorization == '0')
* 유저 R (/admin/findAllUsers)
* 유저 권한 변경 U (/admin/userAuthChange)
* 유저 삭제 D (/admin/userDelete/:user_id)
* 멘토 신청자 R (/admin/mentorApplyUsers)
* 멘토 신청자 세부 정보 R (/admin/mentorApplyFindOne/:mentor_apply_id)
* 멘토 신청 승인 CU (/admin/mentorApplyConfirm)
    > 유저 권한 변경과 멘토방 개설이므로 CU로 표기
* 멘토 신청 내역 D (/admin/deleteMentorApply/:mentor_apply_id)
* 멘토방 D (/admin/mentorRoomDelete/:mentor_room_id)
* 학기 CRUD
    * /admin/semesterGet
    * /admin/semesterCreate
    * /admin/semesterUpdate
    * /admin/semesterDelete
* 멘토 신청 활성화/비활성화 (/admin/mentorOption)
* 멘티 신청 활성화/비활성화 (/admin/menteeOption)
* 멘토방 인원 설정 (/admin/roomOption)
* 보고서 R (/admin/reportAll)
* 회원 엑셀 업로드 (/admin/import)

---

## Function
### Common

* 회원가입 (완료)
* 로그인 (완료)
* 로그아웃 (완료)
* 회원 정보 수정 (완료)

---

### Mentee

* 공지게시판 R (완료)
    * file download (완료)
* 자유게시판 CRUD
    * uploaded file 수정
    * pagination
    * 정렬
    * 검색
    * 댓글  
* 문의게시판 CRUD
    * pagination
    * 정렬
    * 검색
    * 댓글(답글)  
* 시간표 CRU (완료)
    * 각 멘토방 학생의 시간표 비교 (완료)
    
---

* 멘티 신청 (완료)
* 멘티 신청 취소 (완료)
* 멘토 신청 (완료)
    * portfolio upload (완료)
* 멘토 신청 수정 (완료)
    * portfolio 수정 (완료)
* 멘토 신청 취소 (완료)
* 멘토방 목록 조회 (완료)
* 해당 멘토방 세부 정보 조회 (완료)
    * 포트폴리오 download (완료)

---

### Mentor (authorization == '1')
* 중간 보고서 제출(file upload) (완료)
* 최종 보고서 제출(file upload) (완료)
* 본인 멘토방 멘티 삭제 (완료)

---

### Admin (authorization == '0')
* 공지게시판 CRUD (완료)
    * uploaded file 수정 (완료)
    * pagination (완료)
    * 정렬 (완료)
    * 검색 (완료)
* 전체 사용자 조회 (완료)
    * pagination (완료)
    * 정렬
    * 검색   
* 멘토 신청자 조회 (완료)
    * pagination (완료)
* 멘토 신청자 세부 정보 조회 (완료)
* 멘토 신청자 신청 내역 삭제 (완료)
* 멘토 권한 승인 (완료)
* 멘토방 개설 (완료)
* 멘토방 삭제 (완료)
* 사용자 관리
    * 회원 권한 변경 (완료)
    * 사용자 삭제 (완료)
    * 사용자 엑셀 import (완료)
    * 사용자 엑셀 export (완료)
* 학기 등록 (완료)
* 학기 활성/비활성 (완료)
* 보고서 목록 조회 (완료)
    * file download (완료)
* 메뉴 활성/비활성 및 멘토방 최대 인원 설정 (완료)

---

## Author
* 조민국