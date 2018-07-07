class StudentsController < ApplicationController
  
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
