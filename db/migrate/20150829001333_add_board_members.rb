class AddBoardMembers < ActiveRecord::Migration[4.2]
  def up
    create_table :board_members do |t|
      t.string :name
      t.string :title
      t.string :twitter
      t.text :bio
      t.boolean :director, default: false
    end
  end

  def down
    drop_table :board_members
  end
end
