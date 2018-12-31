class AddFbAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_account, :string
  end
end
