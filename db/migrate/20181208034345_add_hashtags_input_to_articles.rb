class AddHashtagsInputToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :hashtags_input, :text
  end
end
