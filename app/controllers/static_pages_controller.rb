class StaticPagesController < ApplicationController
  def home
  	@next_crb = Meeting.next_crb.first
  end
end
