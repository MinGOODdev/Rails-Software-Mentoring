# Software Mentoring System
## TODO
설명 | FE | BE
-----|----|-----
보고서 다운로드 시 파일 이름에 학기도 포함시키기 | - | V
멘토 권한은 멘티 신청을 할 수 없게 하기 | V | Not yet
관리자 권한의 사용자(학생회장단)이 멘토 신청 후 멘토 승인시 권한 관리자로 유지시키기 | - | V
멘티 신청 선착순 처리 | Not yet | V
체크박스 전체선택 기능 추가하기 | Not yet | -
시간 설정해서 그 시간에 멘토 신청, 멘티 신청 On/Off 하기 | Not yet | Not yet 
Mentoring End 하면 관리자 아이디 빼고 권한 다 2로 만들기 | - | Not yet
if문 중첩 3개 이상 case-when으로 바꾸기 | - | Not yet
삭제를 할 경우에는 한번 더 확인하기 | Not yet | -
파일 업로드할 때 선택된 파일 없으면 버튼 안 보이게 하기 (AJAX...) | Not yet | -

## Flash Message 반영된 부분
* 보고서 업로드할 때 선택된 파일이 없는 경우

## 생각해 볼 부분
* MentorRoom Table reportOk column이 필요없나? 이건 일단 있어도 문제는 없으니 나중에 생각해보기

## 예외 처리 반영된 부분
* Flash Message도 예외 처리한 것으로 봐야하나 ?

---

## API arrangement
### Common
기능 | 요청 url
--------|-------
회원가입 | /users/sign_up
로그인 | /users/sign_in
로그아웃 | /users/sign_out
회원 정보 수정 | /users/edit

### General User (authorization == '2')
기능 | 요청 url
--------|-------
공지 조회(R) | /notices/index (전체)<br/>/notices/show/:notice_id (개별)
멘토 신청(C) | /students/applyMentorGet<br/>/students/applyMentorPost
멘토 신청 수정(U) | /students/applyMentorEdit<br/>/students/applyMentorUpdate
멘토 신청 취소(D) | /students/applyMentorDelete
멘토방 조회(R) | /students/findAllRooms (전체)<br/>/students/findOneRoom/:mentor_room_id (개별)
멘토방 멘티 신청(C) | /students/applyMentee/:mentor_room_id
멘토방 멘티 신청 취소(D) | /students/deleteApplyMentee/:user_id
소속된 멘토방 조회(R) | /students/myMentorRoom
시간표 등록/조회/수정(CRU) | /time/timeTableGet<br/>/time/timeTablePost

### Mentor User (authorization == '1')
기능 | 요청 url
--------|-------
멘토방 멘티 삭제(D) | /mentors/deleteMyMentee/:user_id
보고서 등록/수정(CU) | /mentors/midReportUpdate (중간보고서)<br/>/mentors/finalReportUpdate (최종보고서)
    
### Admin User (authorization == '0')
기능 | 요청 url
--------|-------
사용자 등록(C) | /admin/import
사용자 조회(R) | /admin/findAllUsers(전체)
사용자 권한 변경(U) | /admin/userAuthChange
사용자 삭제(D) | /admin/userDelete/:user_id
멘토 신청자 조회(R) | /admin/mentorApplyUsers (전체)<br/>/admin/mentorApplyFindOne/:mentor_apply_id (개별)
멘토 신청 승인(CU) | /admin/mentorApplyConfirm<br/>사용자 권한 변경 + 멘토방 개설
사용자 멘토 신청 삭제(D) | /admin/deleteMentorApply/:mentor_apply_id  
멘토방 삭제(D) | /admin/mentorRoomDelete/:mentor_room_id
학기 등록/조회(CR) | /admin/semesterGet<br/>/admin/semesterCreate
학기 상태 수정(U) | /admin/semesterUpdate
학기 삭제(D) | /admin/semesterDelete
멘토 신청 활성화/비활성화(U) | /admin/mentorOption
멘티 신청 활성화/비활성화(U) | /admin/menteeOption
멘토방 최대 인원 설정(U) | /admin/roomOption
보고서 전체 조회(R) | /admin/reportAll

---

## Function
### Common
기능 | 완료
--------|-------
회원가입 | V
로그인 | V
로그아웃 | V
회원 정보 수정 | V

---

### Mentee
기능 | 완료
--------|-------
공지 R<br/>- 첨부파일 다운로드 | V<br/>V
자유 CRUD<br/>- 첨부파일 다운로드<br/>- Pagination<br/>- 검색<br/>- 댓글 | 
문의 CRUD<br/>- Pagination<br/>- 검색<br/>- 댓글 |
시간표 CRU & 비교 | V
    
---

기능 | 완료
--------|-------
멘티 신청 | V
멘티 신청 취소 | V
멘토 신청<br/>- 포트폴리오 업로드 | V<br/>V
멘토 신청 수정<br/>- 포트폴리오 수정 | V<br/>V
멘토 신청 취소 | V
멘토방 전체 조회 | V
멘토방 개별 조회<br/>- 포트폴리오 다운로드 | V<br/>V

---

### Mentor (authorization == '1')
기능 | 완료
--------|-------
중간 보고서 업로드 | V
최종 보고서 업로드 | V
멘토방 멘티 삭제 | V

---

### Admin (authorization == '0')
기능 | 완료
--------|-------
공지 CRUD<br/>- 첨부파일 등록 및 수정<br/>- Pagination<br/>- 검색 | V<br/>V<br/>V<br/>V
사용자 전체 조회<br/>- Pagination<br/>- 정렬<br/>- 검색 | V<br/>V<br/>　<br/>　
멘토 신청자 전체 조회<br/>- Pagination | V<br/>V
멘토 신청자 개별 조회 | V
사용자 멘토 신청 삭제 | V
멘토 권한 승인 | V
멘토방 개설 | V
멘토방 삭제 | V
사용자 권한 변경 | V
사용자 삭제 | V
사용자 엑셀 Import | V
사용자 엑셀 Export | V
학기 CR | V
학기 활성/비활성화 | V
보고서 전체 조회<br/>- 보고서 다운로드 | V<br/>V
멘토 신청 활성화/비활성화 | V 
멘티 신청 활성화/비활성화 | V
멘토방 최대 인원 설정 | V

---

## Author
* 조민국