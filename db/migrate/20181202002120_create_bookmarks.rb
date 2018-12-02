class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
