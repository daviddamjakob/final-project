class AddTcSiteToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :tc_site, :text
  end
end
