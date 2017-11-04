class Meeting < ActiveRecord::Base

  has_many :speakers

  attr_accessor :crb_times

  scope :next_crb, -> { where(["DATE(time) >= ?", Date.today]).order('time ASC').limit(1) }
  scope :lecture, -> { where(["format = ?", "Lecture"]) }
  scope :current_month_crb, -> { where(["DATE(time) >? AND DATE(time)<?", Time.now.beginning_of_month, Time.now.end_of_month]).order('time ASC').limit(1) }

  def self.add_speaker_to_next_meeting(name, title, url)
    next_crb.speakers.create!({name: name, title:title, url: url})
  end

  def self.find_or_create_next_date
    if Meeting.next_crb.blank?
      if Meeting.current_month_crb.blank?
        next_month = 0
      else
        next_month = 1
      end

      beginning = Date.today.beginning_of_month

      curr_time = beginning + next_month.months
      s         = curr_time.beginning_of_month
      e         = curr_time.end_of_month
      crb_time  = (s..e).select{|d| d.wday == 1}[2] + 18.5.hours

      Meeting.find_or_create_by(time: crb_time)
    else
      next_crb
    end
  end


  def to_s
    time
  end
end
