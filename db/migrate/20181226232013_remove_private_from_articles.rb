class RemovePrivateFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :private, :boolean
  end
end
