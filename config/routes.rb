Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  get 'home/index'
  
  # 공지사항
  get 'notices/index'

  get 'notices/new'
  post 'notices/create'

  get 'notices/edit/:notice_id' => 'notices#edit'
  post 'notices/update/:notice_id' => 'notices#update'

  get 'notices/show/:notice_id' => 'notices#show'
  post 'notices/delete/:notice_id' => 'notices#delete'

  ## 멘토방 목록 조회
  get 'students/findAllRooms'
  
  ## 해당 멘토방 세부 정보 조회
  get 'students/findOneRoom/:mentor_room_id' => 'students#findOneRoom'
  ## 해당 멘토방 멘티로 신청
  post 'students/applyMentee/:mentor_room_id' => 'students#applyMentee'
  ## 해당 멘토방 멘티 신청 취소
  post 'students/deleteApplyMentee/:user_id' => 'students#deleteApplyMentee'
  
  ## 멘토 신청
  get 'students/applyMentorGet'
  post 'students/applyMentorPost'
  ## 멘토 신청 수정
  get 'students/applyMentorEdit'
  post 'students/applyMentorUpdate'
  ## 멘토 신청 취소
  get 'students/applyMentorDelete'

  ## 시간표 등록
  get 'time/timeTableGet'
  post 'time/timeTablePost'
  
  ## 내가 소속된 멘토방 조회
  get 'students/myMentorRoom'
  

  # 멘토 ROUTES
  ## 내 멘토방 멘티 삭제
  post 'mentors/deleteMyMentee/:user_id' => 'mentors#deleteMyMentee'
  
  
  # 관리자 ROUTES
  ## 모든 유저 목록
  get 'admin/findAllUsers'
  ## 유저 권한 변경
  post 'admin/userAuthChange' => 'admin#userAuthChange'
  ## 유저 삭제
  get 'admin/userDelete/:user_id' => 'admin#userDelete'
  
  ## 멘토 신청한 유저 목록
  get 'admin/mentorApplyUsers'
  ## 멘토 신청한 유저 세부 정보
  get 'admin/mentorApplyFindOne/:mentor_apply_id' => 'admin#mentorApplyFindOne'
  ## 멘토 신청 내역 삭제
  get 'admin/deleteMentorApply/:mentor_apply_id' => 'admin#deleteMentorApply'
  ## 멘토 신청자 승인 (신청자 권한 멘토로 변경 및 멘토방 개설)
  post 'admin/mentorApplyConfirm'
  ## 멘토방 삭제
  get 'admin/mentorRoomDelete/:mentor_room_id' => 'admin#mentorRoomDelete'

  ## 학기 관리
  get 'admin/semesterGet'
  post 'admin/semesterCreate'
  post 'admin/semesterUpdate'
  post 'admin/semesterDelete'

end
