class RemoveTwitterAccountFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :twitter_account, :string
  end
end
