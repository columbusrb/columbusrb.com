class Presentation < ActiveRecord::Base
  belongs_to :member
  belongs_to :meeting
  validates :meeting_id, presence:true
  validates :title, presence:true
  validates :description, length: { maximum: 1000 }

  scope :presentations_descending, lambda{joins(:meeting).order('time DESC')}
end
