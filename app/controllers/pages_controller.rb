class PagesController < ApplicationController

  def landing
    @next_crb = Meeting.next_crb.first
  end

  def add_speaker
    meeting = Meeting.add_speaker_to_next_meeting(params[:name], params[:title], params[:url])
    render json: meeting
  end

end
