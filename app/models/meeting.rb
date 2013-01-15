class Meeting < ActiveRecord::Base
  has_many :speakers

  ORDER = %w{Lecture Lecture Fishbowl}

  attr_protected
  attr_accessor :crb_times, :jam_times

  scope :next_crb, lambda{where(["DATE(time) >= ? and group_name = ?", Date.today, "crb"]).limit(1)}
  scope :next_jam, lambda{where(["DATE(time) >= ? and group_name = ?", Date.today, "jam"]).limit(1)}
  scope :lecture, where(["format = ?", "Lecture"])

  def self.add_speaker_to_next_meeting(name, title, url)
    next_crb.lecture.first.speakers.create!({name: name, title:title, url: url})
  end

  def self.insert_times_for_five_years
    delete_all
    Speaker.delete_all
    info      = YAML::load(File.open("config/meetings.yml"))
    beginning = Date.strptime('2012-08-26', '%Y-%m-%d') - 1.year

    72.times do |x|
      curr_time = beginning + (x+1).months
      s = curr_time.beginning_of_month
      e = curr_time.end_of_month
      crb_time = (s..e).select{|d| d.wday == 1}[2] + 18.5.hours
      format = ORDER[x%3]

      crb = Meeting.create!(time: crb_time, format: format, group_name: 'crb')
      jam = Meeting.create!(time: crb_time + 9.days, format: nil, group_name: 'jam')

      info_time = crb_time.strftime('%m/%d/%y')

      if info[info_time]
        info[info_time].each do |s|
          crb.speakers.create!({
            name: s["name"],
            title: s["talk_name"],
            url: s["url"]
          })
        end
      end
    end
  end
end
