class AddVideos < ActiveRecord::Migration[4.2]
  def up
    create_table :videos do |t|
      t.string :url
      t.string :name
      t.string :title
    end
  end

  def down
  end
end
