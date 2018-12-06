class RemoveTcCreatorFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :tc_creator, :text
  end
end
