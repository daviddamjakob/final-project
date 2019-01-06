class RemoveTestFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :test, :string
  end
end
