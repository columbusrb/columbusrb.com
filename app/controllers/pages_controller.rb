class PagesController < ApplicationController
  before_filter :load_dates

  def next_meeting
  end

  def who_are_we
  end

  def what_we_do
  end

  def how_to_join
  end

  def recent_photos
  end

  def recent_tweets
  end

  private

  def load_dates
    @next_crb = Meeting.next_crb.first
    @next_jam = Meeting.next_jam.first
  end

end
