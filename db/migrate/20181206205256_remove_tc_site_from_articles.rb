class RemoveTcSiteFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :tc_site, :text
  end
end
