class AddGoogleTokensToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :google_token, :string
    add_column :admin_users, :google_refresh_token, :string
  end
end
