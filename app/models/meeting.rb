class Meeting < ActiveRecord::Base

  has_many :speakers

  attr_accessor :crb_times

  scope :future_meetings, -> { where(["DATE(time) >= ?", Date.today]).order('time ASC') }
  scope :lecture, -> { where(["format = ?", "Lecture"]) }
  scope :current_month_crb, -> { where(["DATE(time) >? AND DATE(time)<?", Time.now.beginning_of_month, Time.now.end_of_month]).order('time ASC').limit(1) }

  def self.add_speaker_to_next_meeting(name, title, url)
    find_or_create_next_date.speakers.create!({name: name, title:title, url: url})
  end

  def self.find_or_create_next_date
    @next_crb = future_meetings.first
    return @next_crb if @next_crb.present?

    target_month = Date.today.beginning_of_month
    target_month += 1.month if meeting_exists_for_this_month?

    start_of_month    = target_month.beginning_of_month
    end_of_month      = target_month.end_of_month
    third_monday_630p = (start_of_month..end_of_month).select{|d| d.wday == 1}[2] + 18.5.hours
    third_monday_630p += 1.month if third_monday_630p.past?

    find_or_create_by(time: third_monday_630p)
  end

  def self.meeting_exists_for_this_month?
    current_month_crb.present?
  end

  def to_s
    time
  end
end
