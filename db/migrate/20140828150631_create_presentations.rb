class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.integer :member_id
      t.integer :meeting_id
      t.string :title
      t.string :slides
      t.string :video
      t.text :description

      t.timestamps
    end
    add_index :presentations, :member_id
    add_index :presentations, :meeting_id
  end
end
