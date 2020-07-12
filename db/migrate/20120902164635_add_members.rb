class AddMembers < ActiveRecord::Migration[5.0]
  def up
    create_table :members do |t|
      t.string :email
      t.string :md5_hash
    end
  end

  def down
    drop_table :members
  end
end
