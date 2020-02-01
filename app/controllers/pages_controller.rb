class PagesController < ApplicationController
  def now
    @members = MeetupGroup.get_members_count
    @next_crb = Meeting.find_or_create_next_date
    @board_members = BoardMember.all.order(director: :desc, title: :asc)
  end

  def location
    render layout: false
  end
end
