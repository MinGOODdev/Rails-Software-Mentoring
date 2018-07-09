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
  
  
  # 멘토 ROUTES
  ## 내 멘토방 멘티 삭제
  post 'mentors/deleteMyMentee/:user_id' => 'mentors#deleteMyMentee'
  
  
  # 관리자 ROUTES
  ## 모든 유저 목록
  get 'admin/findAllUsers'
  ## 유저 권한 변경
  post 'admin/userAuthChange' => 'admin#userAuthChange'
  
  ## 멘토 신청한 유저 목록
  get 'admin/mentorApplyUsers'
  ## 멘토 신청자 승인 (신청자 권한 멘토로 변경)
  post 'admin/mentorApplyConfirm'

end
