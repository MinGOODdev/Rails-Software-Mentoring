class HomeController < ApplicationController
  
  def index
    if current_user != nil
      @mentorApply = MentorApply.find_by(:user_id => current_user.id)
      @roomMember = RoomMember.find_by(:user_id => current_user.id)
    end
  end
  
end
