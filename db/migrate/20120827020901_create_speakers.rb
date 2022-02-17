class CreateSpeakers < ActiveRecord::Migration[4.2]
  def up
    create_table :speakers do |t|
      t.integer :meeting_id
      t.string :name
      t.string :title
      t.string :url
    end

    add_index :speakers, :meeting_id
  end

  def down
    remove_index :speakers, :column => :meeting_id
    drop_table :speakers
  end
end
