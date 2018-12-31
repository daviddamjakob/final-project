class AddStatusToFeedbacks < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :status, :text
  end
end
