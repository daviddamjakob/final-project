class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :link
      t.text :caption
      t.integer :reading_time
      t.integer :user_id
      t.integer :author_id
      t.integer :publisher_id

      t.timestamps
    end
  end
end
