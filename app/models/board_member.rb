class BoardMember < ActiveRecord::Base

  scope :director, -> { where("director = ?", true) }
  scope :board, -> { where("director = ?", false) }

end
