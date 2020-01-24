class PagesController < ApplicationController
  layout false

  def now
    @members = MeetupGroup.get_members_count
    @next_crb = Meeting.find_or_create_next_date
    @board_members = BoardMember.all.order(director: :desc, title: :asc)
  end
end
