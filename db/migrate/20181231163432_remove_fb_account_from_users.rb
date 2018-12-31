class RemoveFbAccountFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fb_account, :string
  end
end
