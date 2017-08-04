class PagesController < ApplicationController

  before_filter :set_next_crb

  def add_speaker
    meeting = Meeting.add_speaker_to_next_meeting(params[:name], params[:title], params[:url])
    render json: meeting
  end

  def now
    @board_members = BoardMember.all.order(director: :desc, title: :asc)
  end

  def companies
  end

  def set_next_crb
    @next_crb = Meeting.next_crb
  end

end
