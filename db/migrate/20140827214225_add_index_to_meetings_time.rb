class AddIndexToMeetingsTime < ActiveRecord::Migration
  def change
    add_index :meetings, :time, unique: true
  end
end
