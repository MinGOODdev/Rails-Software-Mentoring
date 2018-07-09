class StudentsController < ApplicationController
  
  # 멘토 신청 (Get)
  def applyMentorGet
    @semesters = Semester.all
  end
  
  # 멘토 신청 (Post)
  def applyMentorPost
    apply = MentorApply.new
    apply.user_id = current_user.id
    apply.semester_id = params[:semester_id]
    apply.team_name = params[:team_name]
    apply.subject = params[:subject]
    apply.purpose = params[:purpose]
    apply.content = params[:content]
    apply.method = params[:method]
    ## 파일 업로드
    uploader = AttachmentUploader.new
    uploader.store!(params[:attachment])
    apply.attachment = uploader.url
    
    apply.save
  end

  # 멘토 신청 수정 (Edit)
  def applyMentorEdit
    @semesters = Semester.all
    @apply = MentorApply.find_by(:user_id => current_user.id)
  end

  # 멘토 신청 수정 (Update)
  def applyMentorUpdate
    @apply = MentorApply.find_by(:user_id => current_user.id)
    @apply.semester_id = params[:semester_id]
    @apply.team_name = params[:team_name]
    @apply.subject = params[:subject]
    @apply.purpose = params[:purpose]
    @apply.content = params[:content]
    @apply.method = params[:method]
    ## 파일 업로드
    uploader = AttachmentUploader.new
    uploader.store!(params[:attachment])
    @apply.attachment = uploader.url

    @apply.save
  end
  
  # 멘토방 목록 조회
  def findAllRooms
    @mentorRooms = MentorRoom.all
  end
  
  # 해당 멘토방 세부 정보 조회
  def findOneRoom
    @roomAll = RoomMember.all
    @selectedRoom = MentorRoom.find(params[:mentor_room_id])
    @roomMembers = RoomMember.where(:mentor_room_id => params[:mentor_room_id])
  end
  
  # 해당 멘토방 멘티로 신청
  def applyMentee
    roomMember = RoomMember.new
    roomMember.user_id = current_user.id
    roomMember.mentor_room_id = params[:mentor_room_id]
    roomMember.save
  end
  
  # 해당 멘토방 멘티 신청 취소
  def deleteApplyMentee
    roomMember = RoomMember.find_by(:user_id => params[:user_id])
    roomMember.destroy
  end
  
end
