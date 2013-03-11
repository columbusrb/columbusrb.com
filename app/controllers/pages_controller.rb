class PagesController < ApplicationController

  def landing
    @next_crb = Meeting.next_crb.first
  end

end
