class AddPrivateStatusToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :private_status, :boolean
  end
end
