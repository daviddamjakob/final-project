class RemoveTestFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :test, :string
  end
end
