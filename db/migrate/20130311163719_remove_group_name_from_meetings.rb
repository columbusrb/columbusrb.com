class RemoveGroupNameFromMeetings < ActiveRecord::Migration[4.2]
  def up
    remove_column :meetings, :group_name
  end

  def down
    add_column :meetings, :group_name
  end
end
