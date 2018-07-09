class NoticesController < ApplicationController
  def index
    # @notices = Notice.all
    if params[:order_by] == nil
      @notices = Notice.order("created_at DESC").page params[:page]
    elsif params[:order_by] == '1'
      @notices = Notice.order("title").page params[:page]
    elsif params[:order_by] == '2'
      @notices = Notice.order("user_id").page params[:page]
    elsif params[:order_by] == '3'
      @notices = Notice.order("hit DESC").page params[:page]
    else
      @notices = Notice.order("created_at DESC").page params[:page]
    end
  end

  def new
  end

  def create
    notice = Notice.new
    notice.user_id = current_user.id
    notice.title = params[:title]
    notice.content = params[:content]
    ## 파일 업로드
    uploader = AttachmentUploader.new
    uploader.store!(params[:attachment])
    notice.attachment = uploader.url
    
    notice.save
  end
  
  def edit
    @notice = Notice.find(params[:notice_id])
  end
  
  def update
    notice = Notice.find(params[:notice_id])
    notice.user_id = current_user.id
    notice.title = params[:title]
    notice.content = params[:content]
    ## 파일 업로드
    uploader = AttachmentUploader.new
    uploader.store!(params[:attachment])
    notice.attachment = uploader.url
    
    notice.hit -= 1
    notice.save
  end

  def show
    @notice = Notice.find(params[:notice_id])
    @notice.hit += 1
    @notice.save
  end

  def delete
    notice = Notice.find(params[:notice_id])
    notice.destroy
    redirect_to '/notices/index'
  end
end