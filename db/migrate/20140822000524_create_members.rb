class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :github
      t.string :twitter
      t.string :website
      t.text :bio
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
