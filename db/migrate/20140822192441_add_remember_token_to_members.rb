class AddRememberTokenToMembers < ActiveRecord::Migration
  def change
    add_column :members, :remember_token, :string
    add_index  :members, :remember_token
  end
end
