class Meeting < ActiveRecord::Base

  has_many :speakers

  attr_accessor :crb_times

  scope :next_crb, -> { where(["DATE(time) >= ?", Date.today]).order('time ASC').limit(1).first }
  scope :lecture, -> { where(["format = ?", "Lecture"]) }

  def self.add_speaker_to_next_meeting(name, title, url)
    next_crb.speakers.create!({name: name, title:title, url: url})
  end


  def self.insert_times_for_five_years
    beginning = Date.today.beginning_of_month - 2.month

    72.times do |x|
      curr_time = beginning + (x+1).months
      s         = curr_time.beginning_of_month
      e         = curr_time.end_of_month
      crb_time  = (s..e).select{|d| d.wday == 1}[2] + 18.5.hours

      Meeting.find_or_create_by(time: crb_time)
    end
  end

  def to_s
    time
  end
end
