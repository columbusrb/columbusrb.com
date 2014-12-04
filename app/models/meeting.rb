class Meeting < ActiveRecord::Base
  validates :time, presence: true, uniqueness:true
  has_many :presentations, dependent: :destroy

  scope :all_crbs, lambda{order('time DESC')}
  scope :next_crb, lambda{where(["DATE(time) >= ?", Date.today]).order('time ASC').limit(1)}
  scope :previous_crbs, lambda{where(["DATE(time) < ?", Date.today]).order('time DESC')}

  def self.insert_meetings(year)
    modified = "#{year - 1}-12-01"
    beginning = Date.strptime(modified, '%Y-%m-%d')

    12.times do |x|
      curr_time = beginning + (x+1).months
      s         = curr_time.beginning_of_month
      e         = curr_time.end_of_month
      crb_time  = (s..e).select{|d| d.wday == 1}[2] + 18.5.hours

      crb = Meeting.create!(time: crb_time)
    end
  end
end
