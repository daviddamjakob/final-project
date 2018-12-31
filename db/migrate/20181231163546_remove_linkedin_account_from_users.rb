class RemoveLinkedinAccountFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :linkedin_account, :string
  end
end
