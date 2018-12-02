class CreateDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :descriptions do |t|
      t.integer :hashtag_id
      t.integer :article_id

      t.timestamps
    end
  end
end
