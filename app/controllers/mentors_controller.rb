class MentorsController < ApplicationController
  
  # 내 멘토방 해당 멘티 삭제
  def deleteMyMentee
    roomMember = RoomMember.find_by(:user_id => params[:user_id])
    roomMember.destroy
  end
  
end
