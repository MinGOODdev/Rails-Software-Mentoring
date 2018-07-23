class TimeController < ApplicationController

  # 시간표 등록 (Get)
  def timeTableGet
    @monday = Monday.find_by(:user_id => current_user.id)
    @tuesday = Tuesday.find_by(:user_id => current_user.id)
    @wednesday = Wednesday.find_by(:user_id => current_user.id)
    @thursday = Thursday.find_by(:user_id => current_user.id)
    @friday = Friday.find_by(:user_id => current_user.id)
  end

  # 시간표 등록 (Post)
  def timeTablePost
    ## 월요일
    if Monday.find_by(:user_id => current_user.id) == nil
      timetable = Monday.new
      set_data(timetable)
    else
      timetable = Monday.find_by(:user_id => current_user.id)
      set_data(timetable)
    end

    ## 화요일
    if Tuesday.find_by(:user_id => current_user.id) == nil
      timetable = Tuesday.new
      set_data(timetable)
    else
      timetable = Tuesday.find_by(:user_id => current_user.id)
      set_data(timetable)
    end

    ## 수요일
    if Wednesday.find_by(:user_id => current_user.id) == nil
      timetable = Wednesday.new
      set_data(timetable)
    else
      timetable = Wednesday.find_by(:user_id => current_user.id)
      set_data(timetable)
    end

    ## 목요일
    if Thursday.find_by(:user_id => current_user.id) == nil
      timetable = Thursday.new
      set_data(timetable)
    else
      timetable = Thursday.find_by(:user_id => current_user.id)
      set_data(timetable)
    end

    ## 금요일
    if Friday.find_by(:user_id => current_user.id) == nil
      timetable = Friday.new
      set_data(timetable)
    else
      timetable = Friday.find_by(:user_id => current_user.id)
      set_data(timetable)
    end

    redirect_to '/time/timeTableGet'
  end


  private
  def set_data(timetable)
    i = case timetable
        when Monday then 1
        when Tuesday then 2
        when Wednesday then 3
        when Thursday then 4
        when Friday then 5
        else return
        end

    timetable.user_id = current_user.id
    timetable.am_nine_to_ten = params["one#{i}"]
    timetable.am_ten_to_eleven = params["two#{i}"]
    timetable.am_eleven_to_twelve = params["three#{i}"]
    timetable.pm_twelve_to_one = params["four#{i}"]
    timetable.pm_one_to_two = params["five#{i}"]
    timetable.pm_two_to_three = params["six#{i}"]
    timetable.pm_three_to_four = params["seven#{i}"]
    timetable.pm_four_to_five = params["eight#{i}"]
    timetable.pm_five_to_six = params["nine#{i}"]
    timetable.pm_six_to_seven = params["ten#{i}"]
    timetable.pm_seven_to_eight = params["eleven#{i}"]
    timetable.pm_eight_to_nine = params["twelve#{i}"]
    timetable.pm_nine_to_ten = params["thirteen#{i}"]
    timetable.save
  end

end
