class AddTwitterHandle < ActiveRecord::Migration
  def up
    add_column :speakers, :twitter, :string
    add_column :speakers, :twitter_avatar_url, :string
  end

  def down
    remove_column :speakers, :twitter
    remove_column :speakers, :twitter_avatar_url
  end
end
