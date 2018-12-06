class AddTcCreatorToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :tc_creator, :text
  end
end
