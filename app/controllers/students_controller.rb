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

    redirect_to '/home/index'
  end

  # 멘토 신청 수정 (Edit)
  def applyMentorEdit
    @semesters = Semester.all
    @apply = MentorApply.find_by(:user_id => current_user.id)
  end

  # 멘토 신청 수정 (Update)
  def applyMentorUpdate
    apply = MentorApply.find_by(:user_id => current_user.id)
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

    redirect_to '/home/index'
  end

  # 멘토 신청 취소
  def applyMentorDelete
    apply = MentorApply.find_by(:user_id => current_user.id)
    apply.destroy
    redirect_to '/home/index'
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
    @memberCount = @roomMembers.size
  end
  
  # 해당 멘토방 멘티로 신청
  def applyMentee
    roomMembers = RoomMember.where(:mentor_room_id => params[:mentor_room_id])
    room_size = roomMembers.size
    room_member_max_num = AdminOption.first.room_member_max_num

    # 멘토 권한은 멘티 신청을 할 수 없어야 한다.
    # 관리자의 경우 -> 관리자 계정을 따로 갖는다.
    # 소속된 멘토방이 있는지, 아니면 본인이 멘토인지 확인
    myRoom = RoomMember.find_by(:user_id => current_user.id)
    mentorRoom = MentorRoom.find_by(:user_id => current_user.id)

    if myRoom == nil && mentorRoom == nil
      if room_size < room_member_max_num
        roomMember = RoomMember.new
        roomMember.user_id = current_user.id
        roomMember.mentor_room_id = params[:mentor_room_id]
        roomMember.save
        ## 멘티 신청 성공
        flash[:success] = '멘티 신청이 완료되었습니다.'
        redirect_to "/students/findOneRoom/#{roomMember.mentor_room_id}"
      else
        ## 멘티 신청 실패 (해당 멘토방 인원수 초과)
        flash[:warning] = '멘티 신청이 처리되지 않았습니다.'
        redirect_to '/students/findAllRooms'
      end
    else
      ## 멘티 신청 실패 (멘토방에 소속되어 있거나, 멘토인 경우)
      flash[:info] = '멘티 신청 권한이 없습니다.'
      redirect_to 'students/findAllRooms'
    end

  end
  
  # 해당 멘토방 멘티 신청 취소
  def deleteApplyMentee
    roomMember = RoomMember.find_by(:user_id => params[:user_id])
    roomMember.destroy
    flash[:success] = '멘티 신청이 취소되었습니다.'
    redirect_to "/students/findOneRoom/#{roomMember.mentor_room_id}"
  end
  
  # 내가 소속된 멘토방 조회
  def myMentorRoom
    @roomAll = RoomMember.all
    @roomMember = RoomMember.find_by(:user_id => current_user.id)
    @roomMembers = RoomMember.where(:mentor_room_id => @roomMember.mentor_room_id)

    ## 월요일 변수
    @mon_am_nine_to_ten = 1
    @mon_am_ten_to_eleven = 1
    @mon_am_eleven_to_twelve = 1
    @mon_pm_twelve_to_one = 1
    @mon_pm_one_to_two = 1
    @mon_pm_two_to_three = 1
    @mon_pm_three_to_four = 1
    @mon_pm_four_to_five = 1
    @mon_pm_five_to_six = 1
    @mon_pm_six_to_seven = 1
    @mon_pm_seven_to_eight = 1
    @mon_pm_eight_to_nine = 1
    @mon_pm_nine_to_ten = 1

    ## 화요일 변수
    @tues_am_nine_to_ten = 1
    @tues_am_ten_to_eleven = 1
    @tues_am_eleven_to_twelve = 1
    @tues_pm_twelve_to_one = 1
    @tues_pm_one_to_two = 1
    @tues_pm_two_to_three = 1
    @tues_pm_three_to_four = 1
    @tues_pm_four_to_five = 1
    @tues_pm_five_to_six = 1
    @tues_pm_six_to_seven = 1
    @tues_pm_seven_to_eight = 1
    @tues_pm_eight_to_nine = 1
    @tues_pm_nine_to_ten = 1

    ## 수요일 변수
    @wednes_am_nine_to_ten = 1
    @wednes_am_ten_to_eleven = 1
    @wednes_am_eleven_to_twelve = 1
    @wednes_pm_twelve_to_one = 1
    @wednes_pm_one_to_two = 1
    @wednes_pm_two_to_three = 1
    @wednes_pm_three_to_four = 1
    @wednes_pm_four_to_five = 1
    @wednes_pm_five_to_six = 1
    @wednes_pm_six_to_seven = 1
    @wednes_pm_seven_to_eight = 1
    @wednes_pm_eight_to_nine = 1
    @wednes_pm_nine_to_ten = 1

    ## 목요일 변수
    @thurs_am_nine_to_ten = 1
    @thurs_am_ten_to_eleven = 1
    @thurs_am_eleven_to_twelve = 1
    @thurs_pm_twelve_to_one = 1
    @thurs_pm_one_to_two = 1
    @thurs_pm_two_to_three = 1
    @thurs_pm_three_to_four = 1
    @thurs_pm_four_to_five = 1
    @thurs_pm_five_to_six = 1
    @thurs_pm_six_to_seven = 1
    @thurs_pm_seven_to_eight = 1
    @thurs_pm_eight_to_nine = 1
    @thurs_pm_nine_to_ten = 1

    ## 금요일 변수
    @fri_am_nine_to_ten = 1
    @fri_am_ten_to_eleven = 1
    @fri_am_eleven_to_twelve = 1
    @fri_pm_twelve_to_one = 1
    @fri_pm_one_to_two = 1
    @fri_pm_two_to_three = 1
    @fri_pm_three_to_four = 1
    @fri_pm_four_to_five = 1
    @fri_pm_five_to_six = 1
    @fri_pm_six_to_seven = 1
    @fri_pm_seven_to_eight = 1
    @fri_pm_eight_to_nine = 1
    @fri_pm_nine_to_ten = 1
    
    ## 시간표 계산 로직
    @roomMembers.each do |r|
      monday = Monday.find_by(:user_id => r.user_id)
      tuesday = Tuesday.find_by(:user_id => r.user_id)
      wednesday = Wednesday.find_by(:user_id => r.user_id)
      thursday = Thursday.find_by(:user_id => r.user_id)
      friday = Friday.find_by(:user_id => r.user_id)

      multiple_monday(monday)
      multiple_tuesday(tuesday)
      multiple_wednesday(wednesday)
      multiple_thursday(thursday)
      multiple_friday(friday)
    end
  end


  private
  ## 월요일 계산 로직
  def multiple_monday(day)
    if day != nil
      @mon_am_nine_to_ten *= day.am_nine_to_ten
      @mon_am_ten_to_eleven *= day.am_ten_to_eleven
      @mon_am_eleven_to_twelve *= day.am_eleven_to_twelve
      @mon_pm_twelve_to_one *= day.pm_twelve_to_one
      @mon_pm_one_to_two *= day.pm_one_to_two
      @mon_pm_two_to_three *= day.pm_two_to_three
      @mon_pm_three_to_four *= day.pm_three_to_four
      @mon_pm_four_to_five *= day.pm_four_to_five
      @mon_pm_five_to_six *= day.pm_five_to_six
      @mon_pm_six_to_seven *= day.pm_six_to_seven
      @mon_pm_seven_to_eight *= day.pm_seven_to_eight
      @mon_pm_eight_to_nine *= day.pm_eight_to_nine
      @mon_pm_nine_to_ten *= day.pm_nine_to_ten
    end
  end

  ## 화요일 계산 로직
  def multiple_tuesday(day)
    if day != nil
      @tues_am_nine_to_ten *= day.am_nine_to_ten
      @tues_am_ten_to_eleven *= day.am_ten_to_eleven
      @tues_am_eleven_to_twelve *= day.am_eleven_to_twelve
      @tues_pm_twelve_to_one *= day.pm_twelve_to_one
      @tues_pm_one_to_two *= day.pm_one_to_two
      @tues_pm_two_to_three *= day.pm_two_to_three
      @tues_pm_three_to_four *= day.pm_three_to_four
      @tues_pm_four_to_five *= day.pm_four_to_five
      @tues_pm_five_to_six *= day.pm_five_to_six
      @tues_pm_six_to_seven *= day.pm_six_to_seven
      @tues_pm_seven_to_eight *= day.pm_seven_to_eight
      @tues_pm_eight_to_nine *= day.pm_eight_to_nine
      @tues_pm_nine_to_ten *= day.pm_nine_to_ten
    end
  end

  ## 수요일 계산 로직
  def multiple_wednesday(day)
    if day != nil
      @wednes_am_nine_to_ten *= day.am_nine_to_ten
      @wednes_am_ten_to_eleven *= day.am_ten_to_eleven
      @wednes_am_eleven_to_twelve *= day.am_eleven_to_twelve
      @wednes_pm_twelve_to_one *= day.pm_twelve_to_one
      @wednes_pm_one_to_two *= day.pm_one_to_two
      @wednes_pm_two_to_three *= day.pm_two_to_three
      @wednes_pm_three_to_four *= day.pm_three_to_four
      @wednes_pm_four_to_five *= day.pm_four_to_five
      @wednes_pm_five_to_six *= day.pm_five_to_six
      @wednes_pm_six_to_seven *= day.pm_six_to_seven
      @wednes_pm_seven_to_eight *= day.pm_seven_to_eight
      @wednes_pm_eight_to_nine *= day.pm_eight_to_nine
      @wednes_pm_nine_to_ten *= day.pm_nine_to_ten
    end
  end

  ## 목요일 계산 로직
  def multiple_thursday(day)
    if day != nil
      @thurs_am_nine_to_ten *= day.am_nine_to_ten
      @thurs_am_ten_to_eleven *= day.am_ten_to_eleven
      @thurs_am_eleven_to_twelve *= day.am_eleven_to_twelve
      @thurs_pm_twelve_to_one *= day.pm_twelve_to_one
      @thurs_pm_one_to_two *= day.pm_one_to_two
      @thurs_pm_two_to_three *= day.pm_two_to_three
      @thurs_pm_three_to_four *= day.pm_three_to_four
      @thurs_pm_four_to_five *= day.pm_four_to_five
      @thurs_pm_five_to_six *= day.pm_five_to_six
      @thurs_pm_six_to_seven *= day.pm_six_to_seven
      @thurs_pm_seven_to_eight *= day.pm_seven_to_eight
      @thurs_pm_eight_to_nine *= day.pm_eight_to_nine
      @thurs_pm_nine_to_ten *= day.pm_nine_to_ten
    end
  end

  ## 금요일 계산 로직
  def multiple_friday(day)
    if day != nil
      @fri_am_nine_to_ten *= day.am_nine_to_ten
      @fri_am_ten_to_eleven *= day.am_ten_to_eleven
      @fri_am_eleven_to_twelve *= day.am_eleven_to_twelve
      @fri_pm_twelve_to_one *= day.pm_twelve_to_one
      @fri_pm_one_to_two *= day.pm_one_to_two
      @fri_pm_two_to_three *= day.pm_two_to_three
      @fri_pm_three_to_four *= day.pm_three_to_four
      @fri_pm_four_to_five *= day.pm_four_to_five
      @fri_pm_five_to_six *= day.pm_five_to_six
      @fri_pm_six_to_seven *= day.pm_six_to_seven
      @fri_pm_seven_to_eight *= day.pm_seven_to_eight
      @fri_pm_eight_to_nine *= day.pm_eight_to_nine
      @fri_pm_nine_to_ten *= day.pm_nine_to_ten
    end
  end
  
end
