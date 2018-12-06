class AddTcDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :tc_description, :text
  end
end
