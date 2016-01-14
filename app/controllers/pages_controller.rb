class PagesController < ApplicationController

  def landing
    @next_crb = Meeting.next_crb
  end

  def notice
    @next_crb = Meeting.next_crb
  end

  def add_speaker
    meeting = Meeting.add_speaker_to_next_meeting(params[:name], params[:title], params[:url])
    render json: meeting
  end

  def announcement
  end

  def soon
  end

end
