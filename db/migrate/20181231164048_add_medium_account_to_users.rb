class AddMediumAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :medium_account, :string
  end
end
