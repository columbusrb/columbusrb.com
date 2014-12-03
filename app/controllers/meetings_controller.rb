class MeetingsController < ApplicationController
  before_action :admin_member, only: [:new, :create, :edit, :update, :destroy]

  def index
    @meetings = Meeting.paginate(page: params[:page])
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
  	@meeting = Meeting.new
  end

  def create
  	@meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:success] = "Added a new meeting."
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def destroy
    Meeting.find(params[:id]).destroy
    flash[:success] = "Meeting deleted."
    redirect_to meetings_url
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(meeting_params)
      flash[:success] = "Meeting updated."
      redirect_to @meeting
    else
      render 'edit'
    end
  end

  private

    def meeting_params
      params.require(:meeting).permit(:time, :format)
    end

end
