class AddLinkedinAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :linkedin_account, :string
  end
end
