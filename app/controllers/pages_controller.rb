class PagesController < ApplicationController

  def landing
    @next_crb = Meeting.next_crb.first
    @next_jam = Meeting.next_jam.first
  end

end
