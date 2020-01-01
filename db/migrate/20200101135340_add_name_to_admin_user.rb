class AddNameToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :name, :string
  end
end
