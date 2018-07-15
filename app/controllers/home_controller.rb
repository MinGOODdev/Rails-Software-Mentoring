class HomeController < ApplicationController
  
  def index
    size = AdminOption.all.size
    if size == 0
      adminOption = AdminOption.new
      adminOption.mentor_apply_active = 0
      adminOption.mentee_apply_active = 0
      adminOption.room_member_max_num = 6
      adminOption.save
    end
  end
  
end
