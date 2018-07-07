class AdminController < ApplicationController
  
  # 전체 유저 목록 조회
  def findAllUsers
    @users = User.all
  end
  
  # 멘토 신청자 목록 조회
  def mentorApplyUsers
    @users = MentorApply.all
  end
  
  # 멘토 신청 승인 (신청자 권한 멘토로 변경)
  def mentorApplyConfirm
    # 멘토 권한 승인
    users = User.find(params[:users])
    users.each do |u|
      u.authorization = 1
      u.save
    end
    
    # 멘토방 개설
    users.each do |u|
      mentorApply = MentorApply.find_by(:user_id => u.id)
      ## 해당 유저의 멘토방이 없다면 개설
      if MentorRoom.find_by(:user_id => u.id) == nil
        mentorRoom = MentorRoom.new
        mentorRoom.user_id = mentorApply.user_id
        mentorRoom.team_name = mentorApply.team_name
        mentorRoom.subject = mentorApply.subject
        mentorRoom.purpose = mentorApply.purpose
        mentorRoom.content = mentorApply.content
        mentorRoom.method = mentorApply.method
        mentorRoom.semester_id = mentorApply.semester_id
        mentorRoom.save
      end
    end
  end
  
end
