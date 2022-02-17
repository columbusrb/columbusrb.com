class CreateMeetings < ActiveRecord::Migration[4.2]
  def up
    create_table :meetings do |t|
      t.datetime :time
      t.string :format
      t.string :group_name
    end

    add_index :meetings, :time
  end

  def down
    remove_index :meetings, :column => :time
    drop_table :meetings
  end
end
