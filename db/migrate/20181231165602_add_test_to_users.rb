class AddTestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :test, :string
  end
end
