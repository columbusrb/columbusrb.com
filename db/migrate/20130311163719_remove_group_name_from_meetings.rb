class RemoveGroupNameFromMeetings < ActiveRecord::Migration
  def up
    remove_column :meetings, :group_name
  end

  def down
    add_column :meetings, :group_name
  end
end
