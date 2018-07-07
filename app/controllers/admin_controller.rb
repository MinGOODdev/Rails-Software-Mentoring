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
    users = User.find(params[:users])
    users.each do |u|
      u.authorization = 1
      u.save
    end
  end
  
end
