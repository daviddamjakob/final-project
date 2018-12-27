class AddPrivateToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :private, :boolean
  end
end
