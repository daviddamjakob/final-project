class AddTcTitleToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :tc_title, :text
  end
end
