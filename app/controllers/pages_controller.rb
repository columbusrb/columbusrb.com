class PagesController < ApplicationController


  def add_speaker
    meeting = Meeting.add_speaker_to_next_meeting(params[:name], params[:title], params[:url])
    render json: meeting
  end

  def now
    @next_crb = Meeting.next_crb
    @board_members = BoardMember.all.order(director: :desc, title: :asc)
  end

end
