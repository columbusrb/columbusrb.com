class Speaker < ActiveRecord::Base
  belongs_to :meeting
  attr_protected
end
