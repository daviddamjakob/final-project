class AddTestToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :test, :string
  end
end
